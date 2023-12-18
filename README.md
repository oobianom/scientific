# Experimental scientific theme for Rmarkdown: Report science intelligently

#### Built to maximize space and styles

### Website: https://scientific.obi.obianom.com/

Take 2, a rebuild of sciRmdTheme


## Example .Rmd
```
---
title: "Scientific Report Example"
highlighter: "dracula" # code theme
codelang: "r" #default is R, you may add js php python and so on
author: "Obinna Obianom"
date: "`r Sys.Date()`"
output:
  scientific::tufte_html: 
    toc: TRUE
    self_contained: TRUE
link-citations: yes
summaryslide: FALSE # whether to show summary slide on top
---


# Introduction

Sample text implemented in LaTeX and HTML/CSS

```{r, message=FALSE}
library(ggplot2)
mtcars2 <- mtcars
mtcars2$am <- factor(
  mtcars$am, labels = c('automatic', 'manual')
)
ggplot(mtcars2, aes(hp, mpg, color = am)) +
  geom_point() + geom_smooth() +
  theme(legend.position = 'bottom')
```

# Output

![](https://scientific.obi.obianom.com/screenshot/scientificscreenshot2.png)



## Highlighter options (Enlighterjs)

```
Enlighter (enlighter, standard) - Enlighter`s default Theme
Classic (classic) - SyntaxHighlighter inspired
Bootstrap (bootstrap4) - Bootstrap 4 inpired themes, high contrast
Beyond (beyond) - BeyondTechnology Theme
Godzilla (godzilla) - A MDN inspired Theme
Eclipse (eclipse) - Eclipse inspired
MooTwo (mootwo) - Inspired by the MooTools Website
Droide (droide) - Modern, minimalistic
Minimal (minimal) - Bright, High contrast
Atomic (atomic) - Dark, Colorful
Dracula (dracula) - Dark, using official draculatheme colorscheme
Rowhammer (rowhammer) - Light, Transparent, divided rows
```

## Languages for `codelang`
```
ABAP (abap)
Apache HTTPD (apache)
Assembly (assembly, asm)
AVR Assembly (avrassembly, avrasm)
Windows Batch/Bat (bat,batch,cmd)
C/C++ (c,cpp, c++)
C# (csharp)
CSS (css)
Cython (cython)
CordPro (cordpro)
diff (diff)
Dockerfile (docker, dockerfile)
Generic (generic, standard) - default highlighting scheme
Groovy (groovy)
Go (go, golang)
HTML (html)
Ini (ini, conf)
Java (java)
Javascript (js, javascript, jquery, mootools, ext.js)
JSON (json)
JSX (jsx)
Kotlin (kotlin)
LATEX (latex)
LESS (less)
lighttpd (lighttpd)
LUA (lua)
MariaDB (mariadb)
Markdown (gfm, md, markdown)
Matlab/Octave (octave, matlab)
MSSQL (mssql)
NGINX (nginx)
NSIS (nsis)
Oracle Database (oracledb)
PHP (php)
Powerhsell (powershell)
Prolog (prolog)
Python (py, python)
PureBasic (purebasic, pb)
QML (qml)
R (r)
RAW (raw) - raw code without highlighting with EnlighterJS container styles!
RouterOS/SwitchOS (routeros)
Ruby (ruby)
Rust (rust)
Scala (scala)
SCSS (scss, sass)
Shellscript (shell, bash)
Generic SQL (sql)
Squirrel (squirrel)
Swift (swift)
Typescript (typescript)
VHDL (vhdl)
VisualBasic (visualbasic, vb)
Verilog (verilog)
XML (xml, html)
YAML (yaml)
```
