# -----------------------------------------------------------------------------
# runs all analyses of the project in the order described in the readme
#
# usage, from the project root (open igt-project.Rproj):
#   renv::restore()
#   source("run_all.R")
#
# - each rmd is rendered with rmarkdown::render() in a fresh environment and
#   with the folder of the rmd as working directory
# - each render runs in its own r process, so packages and options set by one
#   script cannot leak into the next one (same as knitting each file by hand)
# - the files in data/raw are checksummed before the run and after each rmd,
#   the run stops if any of them was changed, added or removed
# -----------------------------------------------------------------------------

# rmd files in run order
rmd_files <- c(
  # 1 sampling
  "code/sampling/scrambler.Rmd",
  # 2 inter rater reliability
  "code/inter rater reliability/IRR_analysis_procedure.Rmd",
  "code/inter rater reliability/IRR_analysis_scoring.Rmd",
  # 3 meta-methods review, distinct_scores writes the input of scoring_methods
  "code/meta-methods review/distinct_scores.Rmd",
  "code/meta-methods review/scoring_methods.Rmd",
  "code/meta-methods review/procedures.Rmd",
  "code/meta-methods review/study_sample.Rmd",
  "code/meta-methods review/indeterminables_per_sample_type.Rmd",
  # 4 multiverse, processing writes the input of analyses
  "code/multiverse/processing.Rmd",
  "code/multiverse/analyses.Rmd",
  # 5 hayes 2020 example, scoring_processing writes the input of the other two
  "code/example hayes2020/scoring_processing.Rmd",
  "code/example hayes2020/scoring_multiverse.Rmd",
  "code/example hayes2020/scr_correlations.Rmd",
  # 6 hierarchical clustering, uses the output of multiverse processing
  "code/hierarchical-clustering/hierarchical_clustering.Rmd"
)

raw_data_dir <- "data/raw"

# checks before the run --------------------------------------------------------

# relative paths below only work from the project root
if (!file.exists("igt-project.Rproj")) {
  stop("run_all.R must be run from the project root (the folder with igt-project.Rproj)",
       call. = FALSE)
}

missing_rmd_files <- rmd_files[!file.exists(rmd_files)]
if (length(missing_rmd_files) > 0) {
  stop("rmd files not found: ", paste(missing_rmd_files, collapse = ", "), call. = FALSE)
}

# pandoc ships with rstudio and is needed to build the html reports
if (!rmarkdown::pandoc_available()) {
  stop("pandoc not found, run this script from rstudio or install pandoc", call. = FALSE)
}

# helpers ----------------------------------------------------------------------

# md5 checksum of every file in data/raw, hidden files are ignored
checksum_raw_data <- function() {
  raw_files <- list.files(raw_data_dir, recursive = TRUE, full.names = TRUE)
  tools::md5sum(raw_files)
}

# raw data files that were changed, added or removed since the first checksum
changed_raw_files <- function(checksums_before, checksums_after) {
  all_files <- union(names(checksums_before), names(checksums_after))
  is_changed <- purrr::map_lgl(all_files, function(file) {
    !identical(unname(checksums_before[file]), unname(checksums_after[file]))
  })
  all_files[is_changed]
}

# renders one rmd in a new r process and returns the console output
# a failed render is marked by the status attribute of the output
render_rmd <- function(rmd_file) {
  # the rmd path is passed as an argument so spaces in folder names are safe
  render_call <- "rmarkdown::render(commandArgs(trailingOnly = TRUE)[1], envir = new.env(), quiet = TRUE)"
  suppressWarnings(
    system2(
      file.path(R.home("bin"), "Rscript"),
      args = c("-e", shQuote(render_call), shQuote(rmd_file)),
      stdout = TRUE,
      stderr = TRUE
    )
  )
}

# run --------------------------------------------------------------------------

raw_checksums_before <- checksum_raw_data()
run_start <- Sys.time()
render_seconds <- numeric(length(rmd_files))

for (file_index in seq_along(rmd_files)) {
  rmd_file <- rmd_files[file_index]
  cat(sprintf("[%2d/%d] %s ... ", file_index, length(rmd_files), rmd_file))
  flush.console()

  render_start <- Sys.time()
  render_output <- render_rmd(rmd_file)
  render_seconds[file_index] <- as.numeric(difftime(Sys.time(), render_start, units = "secs"))

  # stop and show the end of the r output if the render failed
  if (!is.null(attr(render_output, "status"))) {
    cat("failed\n\n")
    cat(utils::tail(render_output, 40), sep = "\n")
    stop("rendering failed for ", rmd_file, ", see the r output above. ",
         "the remaining rmd files were not run.", call. = FALSE)
  }

  # stop if this rmd touched the raw data
  changed_files <- changed_raw_files(raw_checksums_before, checksum_raw_data())
  if (length(changed_files) > 0) {
    cat("failed\n\n")
    stop("files in ", raw_data_dir, " were changed, added or removed while rendering ",
         rmd_file, ": ", paste(changed_files, collapse = ", "),
         ". restore them with git before you continue.", call. = FALSE)
  }

  cat(sprintf("done (%.0f s)\n", render_seconds[file_index]))
}

total_minutes <- as.numeric(difftime(Sys.time(), run_start, units = "mins"))

# summary ----------------------------------------------------------------------

cat("\n--- summary ---\n")
cat("files rendered:", length(rmd_files), "of", length(rmd_files), "\n")
print(tibble::tibble(file = rmd_files, seconds = round(render_seconds)), n = Inf)
cat(sprintf("total run time: %.1f minutes\n", total_minutes))
cat("r version:", R.version.string, "\n")
cat(raw_data_dir, "unchanged,", length(raw_checksums_before), "files checked\n")

cat("\nrenv status:\n")
if (requireNamespace("renv", quietly = TRUE)) {
  renv::status()
} else {
  cat("renv is not installed, package versions were not checked\n")
}
