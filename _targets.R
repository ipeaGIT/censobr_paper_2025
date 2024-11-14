
# Load packages required to define the pipeline:
library(censobr)
library(geobr)
library(ggplot2)
library(dplyr)
library(sf)
library(rmarkdown)
library(duckdb)
library(DBI)
library(srvyr)
library(targets)
library(renv)


# Set target options:
tar_option_set(packages = c("rmarkdown"))



# The list of targets
list(
  tar_target(
    name = report_file, 
    command = "R/censobr_shortPaper.Rmd", 
    format = "file"
  ),
  
  tar_target(
    name = rendered_report, 
    {
      # Render the R Markdown file
      rmarkdown::render(report_file,
                        output_dir = "paper_pdf")
    },
    format = "file"
  )
)
