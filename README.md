# Experimental scientific theme for Rmarkdown
Report science intelligently

Take 2, a rebuild of sciRmdTheme


## Example .Rmd
```
---
title: "Scientific Report Example"
highlighter: "godzilla" 
codelang: "R" #default is R, you may add js php python and so on
author: "Obinna Obianom"
date: "`r Sys.Date()`"
output:
  scientific::tufte_html: 
toc: TRUE
self_contained: TRUE
link-citations: yes
---


# Introduction

The Tufte handout style is a style that Edward Tufte uses in his books and handouts. Tufte's style is known for its extensive use of sidenotes, tight integration of graphics with text, and well-set typography. This style has been implemented in LaTeX and HTML/CSS

```{r fig-margin, fig.margin = TRUE, fig.cap = "MPG vs horsepower, colored by transmission.", fig.width=3.5, fig.height=3.5, cache=TRUE, message=FALSE}
library(ggplot2)
mtcars2 <- mtcars
mtcars2$am <- factor(
  mtcars$am, labels = c('automatic', 'manual')
)
ggplot(mtcars2, aes(hp, mpg, color = am)) +
  geom_point() + geom_smooth() +
  theme(legend.position = 'bottom')
```

```


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
