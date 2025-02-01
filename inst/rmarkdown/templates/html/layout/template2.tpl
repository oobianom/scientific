<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://scientific.obi.obianom.com/assets/bootstrap.min.css" rel="stylesheet">
    <script src="https://scientific.obi.obianom.com/assets/bootstrap.bundle.min.js"></script>
    <title>$if(title)$$title$$else$Welcome to my Rmarkdown by scientific R package$endif$</title>
    $for(header-includes)$
  $header-includes$
$endfor$
<meta name="keywords" content="R personal profiles, $keywords$" />
$if(footer)$
  <meta name="copyright" content="$footer$"/>
$endif$
$if(font-size-adjustment)$
  <meta name="font-size-adjustment" content="$font-size-adjustment$"/>
$endif$
    <style>
:root{--sidebarmaincol:$if(themecolor)$$themecolor$$else$#dc3545$endif$;--sidebarmaincolfade:#dc354522;--hoversidefade1:rgba(0,0,0,0.1);--sidebarprimcol:#ffffff}.mainbody a{ color: #333333 !important; text-decoration: underline; }.sidebar{background-color:var(--sidebarmaincol);min-height:100vh;color:var(--sidebarprimcol)}.nav-link.active,.navsideleft li a:active,.progress-badge,.sub-menu{background-color:var(--hoversidefade1)}.navsideleft ul{padding:0!important;}.navsideleft li{list-style: none;}.nav-link,.navsideleft li a{display:block;color:#333;padding:.75rem 1rem;cursor:pointer}.nav-link:hover,.navsideleft li a:hover{background-color:var(--hoversidefade1);color:#000}.align-left-icon,.check-icon{width:20px;height:20px;margin-right:8px;color:lightgray}.dropdown-toggle::after{float:right;margin-top:8px}.sub-menu{padding-left:2rem}.sub-menu .nav-link{font-size:.9rem;padding:.5rem 1rem}.chevron-icon{width:16px;height:16px;margin-right:8px;transition:transform .3s}.collapsed .chevron-icon{transform:rotate(-45deg)}.navsideleft{background-color:#fff}.navsideleft .nav{background-color:var(--sidebarmaincolfade)}pre{overflow:hidden}.enlighter-tooltip {display:none}.sticky-column { position: sticky; top: 0; height: 100vh; overflow-y: auto;}code, kbd, pre, samp {  font-size: unset!important; }.enlighter-t-godzilla {border-left: solid 6px var(--sidebarmaincol);}
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar for TOC-->
            $if(toc)$
            <div class="d-none d-md-block col-md-3 col-lg-2 px-0 sidebar sticky-column">
                <div class="p-3">
                    <h5 class="fw-bold mb-0">$if(title)$$title$$endif$</h5>

                </div>

                <nav class="mt-4 navsideleft">
                    <div class="nav flex-column">
                    $toc$
                    </div>
                </nav>
            <div class="progress-badge p-2">
                       Last Updated: $if(date)$$date$$endif$
                    </div>
			</div>
			$endif$

            <!-- Main Content -->
            <div class="col-12 $if(rightpadding)$col-md-8 col-lg-9$else$col-md-9 col-lg-10$endif$ py-4 px-5 shadow mainbody">
            $if(title)$ <div class="slide titlepage">

              <h1 class="">$title$</h1>
              $if(subtitle)$ <h3 class="subtitle">$subtitle$</h3> $endif$

              <p class="author">
              $for(author)$$author$$sep$ <br />$endfor$
              </p>
              $if(date)$ <p class="date">$date$</p> $endif$
            </div> $endif$
                $body$
            </div>
            $if(rightpadding)$
            <div class="d-none d-md-block col-md-1" style="background-color: var(--sidebarmaincol);">
            </div>
            $endif$
        </div>
    </div>


<script>
document.addEventListener("DOMContentLoaded",function(){document.querySelectorAll(".navsideleft li a").forEach(e=>{let t=e.textContent.trim();e.className="nav-link d-flex align-items-center justify-content-between collapsed",e.innerHTML='<span class="d-flex align-items-center"><svg class="check-icon" fill="currentColor" viewBox="0 0 16 16"> <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/> </svg>'+t+"</span>",e.setAttribute("data-bs-toggle","collapse"),e.setAttribute("data-bs-target","#access-colldiv-"+Math.floor(1e5*Math.random()))});let e=document.querySelectorAll(".navsideleft li > ul");e.forEach(e=>{var t=e.parentElement.querySelector("a");t.insertAdjacentHTML("beforeend",'<svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor"> <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/> </svg>');var l=t.getAttribute("data-bs-target");let a=document.createElement("div");a.className="collapse sub-menu",a.id=l.replace("#",""),a.innerHTML=e.innerHTML,e.parentNode.replaceChild(a,e),a.querySelectorAll("li").forEach(e=>{e.classList.add("nav-link")})}),document.querySelectorAll(".check-icon").forEach(e=>{e.parentElement.addEventListener("click",function(){e.style.color="#000000"})})});
</script>
<script type="text/javascript">
var hashloc = window.location.hash;
var currid = hashloc.replace("#","");
$$(document).ready(function() {
$$(".hoveredd").toggleClass('hoveredd')
$$("body").click(function(){
$$(".hoveredd").toggleClass('hoveredd')
})
$$(".ytoc li:has(ul)").children("a").click(function(){
$$(this).parent().children('ul').toggle();
});

if(hashloc != ""){
$$(".ytoc li a[href='"+hashloc+"']").click();
}
$$("div").hover(function() {
let idattr = $$(this).attr("id");
if(typeof idattr !== typeof undefined && idattr !== false){
$$(".ytoc li a[href='"+hashloc+"']").next("ul").hide();
//$$(".ytoc li a[href='#"+currid+"']").next("ul").hide();
//currid = idattr;
$$(".hoveredd").toggleClass('hoveredd')
$$(".ytoc li a[href='#"+idattr+"']").toggleClass('hoveredd')
$$(".ytoc li a[href='#"+idattr+"']").next("ul").show();
}
});


})
</script>

$for(include-after)$
$include-after$
$endfor$

$if(mathjax-url)$
  <!-- dynamically load mathjax for compatibility with self-contained -->
  <script>
    (function () {
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src  = "$mathjax-url$";
      document.getElementsByTagName("head")[0].appendChild(script);
    })();
  </script>
$endif$


    <script type="text/javascript">
        EnlighterJS.init('pre code', '',{
                language : $if(codelang)$'$codelang$'$else$'R'$endif$,
                theme: $if(highlighter)$'$highlighter$'$else$'godzilla'$endif$,
                indent : 2,
                // &amp; to &
                ampersandCleanup: true,
                // enable line hover highlighting
                linehover: true,
                // show linenumbers
                linenumbers: $if(linenum)$$linenum$$else$true$endif$,
                // copy css classes from origin element to outer wrapper
                retainCssClasses: false,
                // additional css classes added to outer wrapper
                cssClasses: '',
                // top outer toolbar
                toolbarOuter: '{BTN_TABS}',
                // header toolbar
                toolbarTop: '{BTN_RAW}{BTN_COPY}{BTN_WINDOW}',
                // footer toolbar
                toolbarBottom: '',
                // no line offset
                lineoffset: 0,
                // no special line highlighting
                highlight: '',
                // default layout
                layout: 'standard',
                // or 'scroll
                textOverflow: 'break',
                // enable collapse / vertical scroll
                collapse: false,
                // default title
                title: ''


        });

        EnlighterJS.init('$codelang$', '',{language : '$codelang$',theme: $if(highlighter)$'$highlighter$'$else$'godzilla'$endif$})

    </script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</body>
</html>
