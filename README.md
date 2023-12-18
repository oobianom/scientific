# Experimental scientific theme for Rmarkdown
Report science intelligently

Take 2, a rebuild of sciRmdTheme


```
---
title: "Scientific Report Example"
highlighter: "godzilla" 
codelang: "R" #default is R, you may add js php python and so on
runningheader: "Scientific Report Example" # only for pdf output
subtitle: "An implementation in R Markdown" # only for html output
author: "Obinna Obianom"
date: "`r Sys.Date()`"
output:
  scientific::tufte_html: 
    toc: TRUE
    self_contained: TRUE
bibliography: skeleton.bib
link-citations: yes
---


# Introduction

The Tufte handout style is a style that Edward Tufte uses in his books and handouts. Tufte's style is known for its extensive use of sidenotes, tight integration of graphics with text, and well-set typography. This style has been implemented in LaTeX and HTML/CSS

```
