% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/base_func.R, R/markdown.R
\name{newthought}
\alias{newthought}
\alias{margin_note}
\alias{quote_footer}
\alias{sans_serif}
\alias{html}
\title{Scientific handout formats (PDF and HTML)}
\usage{
newthought(text)

margin_note(text, icon = "&#8853;")

quote_footer(text)

sans_serif(text)

html(..., template = "template1")
}
\arguments{
\item{text}{A character string to be presented as a \dQuote{new thought}
(using small caps), or a margin note, or a footer of a quote}

\item{icon}{A character string to indicate there is a hidden margin note when
the page width is too narrow (by default it is a circled plus sign)}

\item{...}{Other arguments to be passed to
[html_document()] (note you cannot use the `theme` argument in
`html()`; this arguments have been set internally)}

\item{template}{template name to use}
}
\value{
an HTML notebook output based on the R markdown document provided
}
\description{
Template for creating scientific handout
}
\details{
`newthought()` can be used in inline R expressions in R
  Markdown
  ```r
  `r newthought(Some text)`
  ```
  and it works for both
  HTML (\samp{<span class="newthought">text</span>}) and PDF
  (\samp{\\newthought{text}}) output.

`margin_note()` can be used in inline R expressions to write a
  margin note (like a sidenote but not numbered).

`quote_footer()` formats text as the footer of a quote. It puts
  `text` in \samp{<footer></footer>} for HTML output, and
  after \samp{\\hfill} for LaTeX output (to right-align text).

`sans_serif()` applies sans-serif fonts to `text`.

`handout()` provides the PDF format

`html()` provides the HTML format based on the scientific CSS
}
\note{
Template options include "template1" and "template2"
}
\examples{
newthought("In this section")
\dontrun{
# for Rmd to HTML
library(rmarkdown)
library(scientific)
rmdfile <- "input.Rmd"
rmarkdown::render(rmdfile,
  scientific::html(
    toc = TRUE,
    toc_depth = 2))
}
}
