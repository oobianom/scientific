#' Scientific handout formats (PDF and HTML)
#'
#' Template for creating scientific handout
#'
#' `handout()` provides the PDF format
#'
#' @param ... Other arguments to be passed to
#'   [html_document()] (note you cannot use the `theme` argument in
#'   `html()`; this arguments have been set internally)
#' @param template template name to use
#' @return an HTML notebook output based on the R markdown document provided
#' @details `html()` provides the HTML format based on the scientific CSS
#' @note
#' Template options include "template1" and "template2"
#' @rdname handout
#' @examples
#' \dontrun{
#' # for Rmd to HTML
#' library(rmarkdown)
#' library(scientific)
#' rmdfile <- "input.Rmd"
#' rmarkdown::render(rmdfile,
#'   scientific::html(
#'     toc = TRUE,
#'     toc_depth = 2))
#' }
#' @export
html <- function(...,template = "template1") {
  margin_references = TRUE
  tplext = ".tpl"
  cf. = list(...)$code_folding
  if(not.null(cf.)){
    if(cf. == "hide"){
      tplext = ".tpl2"
    }
  }
  html_document2 <- function(..., extra_dependencies = list()) {
    rmarkdown::html_document(
      ...,
      template = system.file("rmarkdown", "templates", "html",
                             "layout",paste0(template,tplext), package = .packageName),
      extra_dependencies = c(
        extra_dependencies, fetchHtmlDep()
      )
    )
  }
  format <- html_document2(theme = "default", highlight= NULL, ...)
  pandoc2 <- pandoc2.0()

  # add --wrap=preserve to pandoc args for pandoc 2.0:
  format$pandoc$args <-  add_wrap_preserve(format$pandoc$args, pandoc2)

  # when fig.margin = TRUE, set fig.beforecode = TRUE so plots are moved before
  # code blocks, and they can be top-aligned
  ohooks <- knitr::opts_hooks$set(fig.margin = function(options) {
    if (isTRUE(options$fig.margin)) {
      options$fig.beforecode <- TRUE
    }
    options
  })

  # make sure the existing post processor is called first in our new processor
  post_processor <- format$post_processor
  format$post_processor <- function(metadata, input, output, clean, verbose) {
    if (is.function(post_processor)) {
      output <- post_processor(metadata, input, output, clean, verbose)
    }

    knitr::opts_hooks$restore(ohooks)

    x <- xfun::read_utf8(output)
    fn_label <- paste0(knitr::opts_knit$get("rmarkdown.pandoc.id_prefix"), "fn")
    footnotes <- parse_footnotes(x, fn_label)
    notes <- footnotes$items
    # replace footnotes with sidenotes
    for (i in seq_along(notes)) {
      num <- sprintf(
        '<a href="#%s%d" class="%s" id="%sref%d"><sup>%d</sup></a>',
        fn_label, i, if (pandoc2) "footnote-ref" else "footnoteRef", fn_label, i, i
      )
      con <- sprintf(paste0(
        '<label for="scientific-sn-%d" class="margin-toggle sidenote-number">%d</label>',
        '<input type="checkbox" id="scientific-sn-%d" class="margin-toggle">',
        '<span class="sidenote"><span class="sidenote-number">%d</span> %s</span>'
      ), i, i, i, i, notes[i])
      x <- gsub_fixed(num, con, x)
    }
    # remove footnotes at the bottom
    if (length(footnotes$range)) x <- x[-footnotes$range]

    # replace citations with margin notes
    if (margin_references) x <- margin_references(x)

    # place figure captions in margin notes
    x[x == '<p class="caption">'] <- '<p class="caption marginnote shownote">'

    # move </caption> to the same line as <caption>; the previous line should
    # start with <table
    for (i in intersect(grep("^<caption>", x), grep("^<table", x) + 1)) {
      j <- 0
      while (!grepl("</caption>$", x[i])) {
        j <- j + 1
        x[i] <- paste0(x[i], x[i + j])
        x[i + j] <- ""
      }
    }
    # place table captions in the margin
    r <- "^<caption>(.+)</caption>$"
    for (i in grep(r, x)) {
      # the previous line should be <table> or <table class=...>
      if (!grepl("^<table( class=.+)?>$", x[i - 1])) next
      cap <- gsub(r, "\\1", x[i])
      x[i] <- x[i - 1]
      x[i - 1] <- paste0(
        "<p><!--\n<caption>-->", '<span class="marginnote shownote">',
        cap, "</span><!--</caption>--></p>"
      )
    }

    # add an incremental number to the id of <label> and <input> for margin notes
    r <- '(<label|<input type="checkbox") (id|for)(="scientific-mn)-(" )'
    m <- gregexpr(r, x)
    j <- 1
    regmatches(x, m) <- lapply(regmatches(x, m), function(z) {
      n <- length(z)
      if (n == 0) {
        return(z)
      }
      if (n %% 2 != 0) warning("The number of labels is different with checkboxes")
      for (i in seq(1, n, 2)) {
        if (i + 1 > n) break
        z[i + (0:1)] <- gsub(r, paste0("\\1 \\2\\3-", j, "\\4"), z[i + (0:1)])
        j <<- j + 1
      }
      z
    })

    xfun::write_utf8(x, output)
    output
  }

  if (is.null(format$knitr$knit_hooks)) format$knitr$knit_hooks <- list()
  format$knitr$knit_hooks$plot <- function(x, options) {
    # make sure the plot hook always generates HTML code instead of ![]()
    if (is.null(options$out.extra)) options$out.extra <- ""
    fig_margin <- isTRUE(options$fig.margin)
    fig_fullwd <- isTRUE(options$fig.fullwidth)
    if (fig_margin || fig_fullwd) {
      if (is.null(options$fig.cap)) options$fig.cap <- " " # empty caption
    } else if (is.null(options$fig.topcaption)) {
      # for normal figures, place captions at the top of images
      options$fig.topcaption <- TRUE
    }
    res <- knitr::hook_plot_md(x, options)
    if (fig_margin) {
      res <- gsub_fixed('<p class="caption">', '<!--\n<p class="caption marginnote">-->', res)
      res <- gsub_fixed("</p>", "<!--</p>-->", res)
      res <- gsub_fixed("</div>", "<!--</div>--></span></p>", res)
      res <- gsub_fixed(
        '<div class="figure">', paste0(
          "<p>", '<span class="marginnote shownote">', '\n<!--\n<div class="figure">-->'
        ), res
      )
    } else if (fig_fullwd) {
      res <- gsub_fixed('<div class="figure">', '<div class="figure fullwidth">', res)
      res <- gsub_fixed(
        '<p class="caption">', '<p class="caption marginnote shownote">', res
      )
    }
    res
  }

  knitr::knit_engines$set(marginfigure = function(options) {
    options$type <- "marginnote"
    if (is.null(options$html.tag)) options$html.tag <- "span"
    options$html.before <- marginnote_html()
    eng_block <- knitr::knit_engines$get("block")
    eng_block(options)
  })

  format$inherits <- "html_document"

  format
}

#' @importFrom htmltools htmlDependency
fetchHtmlDep <- function() {
  list(htmltools::htmlDependency(
    "scientific-r", "2024.0",
    src = temp_loc(), stylesheet = list.files(path = temp_loc(), pattern = ".css$"),
    script = list.files(path = temp_loc(), pattern = ".js$")
  ))
}


parse_footnotes <- function(x, fn_label = "fn") {
  i <- grep('^<div class="footnotes[^"]*"[^>]*>', x)
  if (length(i) == 0) {
    return(list(items = character(), range = integer()))
  }
  j <- which(x == "</div>")
  j <- min(j[j > i])
  n <- length(x)
  r <- sprintf(
    '<li id="%s([0-9]+)"><p>(.+)<a href="#%sref\\1"([^>]*)>.{1,2}</a></p></li>',
    fn_label, fn_label
  )
  s <- paste(x[i:j], collapse = "\n")
  list(
    items = gsub(r, "\\2", unlist(regmatches(s, gregexpr(r, s)))),
    range = i:j
  )
}

# move reference items from the bottom to the margin (as margin notes)
margin_references <- function(x) {
  i <- grep('^<div id="refs" class="references[^"]*"[^>]*>$', x)
  if (length(i) != 1) {
    return(x)
  }
  # link-citations: no
  if (length(grep('<a href="#ref-[^"]+"[^>]*>([^<]+)</a>', x)) == 0) {
    return(x)
  }
  r <- '^<div id="(ref-[^"]+)"[^>]*>$'
  k <- grep(r, x)
  k <- k[k > i]
  n <- length(k)
  if (n == 0) {
    return(x)
  }
    r2 <- '(<a href="#ref-[^"]+"[^>]*>)([^<]+)</a>([^<]*)\\1([^<]+)</a>([^<]*)'
  x <- gsub(r2, "\\1\\2\\3\\4\\5</a>", x)
  ids <- gsub(r, "\\1", x[k])
  ids <- sprintf('<a href="#%s"[^>]*>([^<]+)</a>', ids)
  ref <- gsub("^<p>|</p>$", "", x[k + 1])
  # replace 3 em-dashes with author names
  dashes <- paste0("^", intToUtf8(rep(8212, 3)), "[.]")
  for (j in grep(dashes, ref)) {
    ref[j] <- sub(dashes, sub("^([^.]+[.])( .+)$", "\\1", ref[j - 1]), ref[j])
  }
  ref <- marginnote_html(paste0('\\1<span class="marginnote">', ref, "</span>"))
  for (j in seq_len(n)) {
    x <- gsub(ids[j], ref[j], x)
  }
  x[-(i:(max(k) + 3))] # remove references at the bottom
}

marginnote_html <- function(text = "", icon = "&#8853;") {
  sprintf(paste0(
    '<label for="scientific-mn-" class="margin-toggle">%s</label>',
    '<input type="checkbox" id="scientific-mn-" class="margin-toggle">%s'
  ), icon, text)
}
