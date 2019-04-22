This repository contains an R application for previewing and theming sample plots related to Ginhoven & Lincoln provenance research project.

# Theming ggplot2

## ggplot2 theme docs

<https://ggplot2.tidyverse.org/reference/theme.html>

## Required to implement theme:

We'll need specifications for any of the following where we're going to diverge from the built-in ggplot2 themes.

- plot background color and color for graph grid, if different from background
- grid, axis, and major/minor ticks color/weight/spacing
- desired fonts for axes
- size and placement
- color palettes for data a-la http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3
  - Categorical color palettes for up to 8 different categorical variables (specify distinct hex values)
  - At least 1 sequential color palette definition (start & stop hex value, or a graduated list of 12 hex values)
  - At least 1 diverging color palette definition (start, middle, stop hex values, or a graduated list of 12 hex values)
  
# Running this code

There are two ways to run this code:

## Easy but Slightly Limited: Use the free web-based RStudio via Binder

For the purposes of this workshop, we'll have a web interface version of RStudio available at:

<http://mybinder.org/v2/gh/thegetty/quire_ggplot_theme/master?urlpath=rstudio>

**Note: this can take a few minutes to open up the first time that you load it; if it goes for a very long time, you can try reloading your browser window.**

This will give you virtually the same interface as you would have if you had R and RStudio installed on your local laptop, and will come with all the packages, scripts, and data files you need. However, this does have two drawbacks: 

1. Because we're sharing space on this server, it's not very powerful

2. Binder's servers are temporary and read-only! As long as you are working in the browser window, you'll be able to edit and run code. However if you close the window, or go for more than 10 minutes without interacting with it, Binder will reclaim your space (remember, we're sharing when we use this!) and any changes you made will be discarded. You CAN download your customized code files by selecting the files you want to download from the "Files" tab in the lower right, and then clicking More... > Export... and it will download them to your laptop.

## Difficult but Powerful: Install R and R Studio yourself on your own laptop ahead of time

A bit more involved than clicking one link. To do this:

1. Install R: https://cran.r-project.org/

2. Install RStudio Desktop (the FREE open source version): https://www.rstudio.com/products/rstudio/download/

3. Download the plot code at https://github.com/thegetty/quire_pplot_theme

3. Install required R packages one time by running the code in the `setup.R` file in the base directory.

Contact: [Matthew Lincoln](https://matthewlincoln.net) - mlincoln@andrew.cmu.edu
