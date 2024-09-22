## ----knitr-options, echo = FALSE, message = FALSE, warning = FALSE------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

# Use exact BSPARAM to avoid warnings
options(BiocSingularParam.default = BiocSingular::ExactParam())

## ----install-bioc, eval = FALSE-----------------------------------------------
#  BiocManager::install("splatter")

## ----install-github, eval = FALSE---------------------------------------------
#  BiocManager::install(
#      "Oshlack/splatter",
#      dependencies = TRUE,
#      build_vignettes = TRUE
#  )

## ----quickstart---------------------------------------------------------------
# Load package
suppressPackageStartupMessages({
    library(splatter)
    library(scater)
})

input <- function(inputfile) {}

run <- function() {}

output <- function(outputfile) {

# Create mock data
set.seed(1)
sce <- mockSCE()

# Estimate parameters from mock data
params <- splatEstimate(sce)
# Simulate data using estimated parameters
sim <- splatSimulate(params)

## ----SplatParams--------------------------------------------------------------
params <- newSplatParams()
params

## ----getParam-----------------------------------------------------------------
getParam(params, "nGenes")

## ----setParam-----------------------------------------------------------------
params <- setParam(params, "nGenes", 5000)
getParam(params, "nGenes")

## ----getParams-setParams------------------------------------------------------
# Set multiple parameters at once (using a list)
params <- setParams(params, update = list(nGenes = 8000, mean.rate = 0.5))
# Extract multiple parameters as a list
getParams(params, c("nGenes", "mean.rate", "mean.shape"))
# Set multiple parameters at once (using additional arguments)
print(params)
}
