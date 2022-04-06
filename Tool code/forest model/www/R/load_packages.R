# Dependencies (https://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them)
list.of.packages <- c("adaptivetau", "bsplus", "data.table", "deSolve", "DT", "highcharter",
                      "Rcpp", "readxl", "shiny", "shinyBS", "shinycssloaders", "shinythemes",
                      "shinyWidgets", "sortable", "RColorBrewer", "scales", "shinyhelper",
                      "tidyverse", "TSA", "vov")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
# Some packages need version pinning (eg tidyr1.0.0 for pivot_wider), which I got around using this function:
is.version.ok <- function(pkgName, minVersion) {
  require(dplyr)
  minVersionParts <- sapply(strsplit(minVersion, "\\.")[[1]], as.integer)
  pkg <- installed.packages() %>% as.data.frame() %>% filter(Package==pkgName)
  if (dim(pkg)[1]==0) {
    warning("Package not installed: ", pkgName)
    return(FALSE)
  }
  pkgVersion <- levels(pkg$Version)[[pkg$Version]]
  versionParts <- sapply(strsplit(pkgVersion, "\\.")[[1]], as.integer)
  for (i in 1:length(minVersion)) {
    mv <- minVersionParts[i]
    av <- versionParts[i]
    if (av < mv) { # leftmost actual version is less than leftmost min version so needs updating
      return(FALSE)
    } else if (av > mv) { # leftmost actual version is greater than leftmost min version so up to date
      return(TRUE)
    } # else leftmost actual version same as leftmost min version so look at next version part
  }
  return(TRUE) # exhausted the search and all parts matched, so current version same as min version
}

if (!is.version.ok("tidyverse", "1.3.0")) { # This also ensures tidyr>=1.0.0 which provides pivot_wider
  install.packages("tidyverse")
}

library(adaptivetau)  # ssa.maketrans()
library(bsplus)  # bs_accordion(), use_bs_accordion_sidebar()
library(data.table)  # rbindlist()
library(deSolve)  # ode()
library(DT)  # DTOutput()
library(highcharter)  # hchart()
library(Rcpp)  # sourceCpp()
library(readxl)  # read_excel()
library(shiny)
library(shinyBS)  # bsModal()
library(shinycssloaders)  # withSpinner()
library(shinythemes)  # shinytheme()
library(shinyWidgets)  # progressBar()
library(sortable)  #  bucket_list()
library(RColorBrewer)  # brewer.pal()
library(scales)  # scales()
library(shinyhelper)  # helper()
library(tidyverse)  # mutate()
library(TSA)
library(vov)  # blur_in()