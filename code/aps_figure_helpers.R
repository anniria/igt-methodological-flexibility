# -----------------------------------------------------------------------------
# shared helpers for the figures formatted to the aps figure format and style
# guidelines (figures 1-3 and supplemental figures s1-s2)
# (https://www.psychologicalscience.org/publications/aps-figure-format-style-guidelines)
#
# - font: arial (aps-sanctioned substitute for helvetica neue 57 condensed),
#   variable symbols (r, p) in arial italic
# - 9 pt tick labels, key text and annotations; 10 pt axis titles;
#   18 pt lowercase panel letters at the upper left; no figure titles
# - two axes only (no panel border), no box around the key, key at the top
# - title case in all labels, true minus signs (u+2212), spaced operators
# - 600 ppi png (manuscript file) + svg vector file with text kept as text
#
# source after ggplot2 is attached:
#   source(here::here("code", "aps_figure_helpers.R"))
# -----------------------------------------------------------------------------

font_family <- "Arial"

# true minus signs (u+2212) need a utf-8 locale
for (loc in c("en_US.UTF-8", "C.UTF-8")) {
  if (!l10n_info()$`UTF-8`) invisible(suppressWarnings(Sys.setlocale("LC_CTYPE", loc)))
}
stopifnot(l10n_info()$`UTF-8`)

# numbers with a true minus sign and fixed decimals
label_minus <- function(digits = 1) {
  function(x) {
    out <- formatC(x, format = "f", digits = digits)
    out <- sub("^-", "−", out)
    out[is.na(x)] <- NA
    out
  }
}

# integers with a thousands separator (apa)
label_count <- function(x) {
  out <- formatC(x, format = "d", big.mark = ",")
  out[is.na(x)] <- NA
  out
}

theme_aps <- function() {
  theme_classic(base_size = 9, base_family = font_family) +
    theme(
      text              = element_text(colour = "black"),
      axis.text         = element_text(size = 9, colour = "black"),
      axis.title        = element_text(size = 10, colour = "black"),
      axis.line         = element_line(colour = "black", linewidth = 0.4),
      axis.ticks        = element_line(colour = "black", linewidth = 0.4),
      axis.ticks.length = unit(2, "pt"),
      legend.title      = element_text(size = 9),
      legend.text       = element_text(size = 9),
      legend.position   = "top",
      legend.background = element_blank(),
      legend.key        = element_blank(),
      legend.box.background = element_blank(),
      plot.title        = element_text(size = 10, hjust = 0, margin = margin(b = 4)),
      plot.tag          = element_text(size = 18, face = "plain"),
      plot.tag.position = "topleft",
      plot.margin       = margin(4, 8, 4, 4)
    )
}

# svglite sets black strokes, unfilled shapes and preserved spaces only in an
# embedded css stylesheet; viewers that ignore it (e.g. microsoft office) drop
# black lines and spaces, so these defaults are written into every element
svg_inline_styles <- function(path) {
  shape_defaults <- c(
    "fill"              = "none",
    "stroke"            = "#000000",
    "stroke-linecap"    = "round",
    "stroke-linejoin"   = "round",
    "stroke-miterlimit" = "10.00"
  )

  # adds each default property that the style attribute of a shape lacks
  add_missing_styles <- function(tag) {
    style <- stringr::str_match(tag, "style='([^']*)'")[, 2]
    for (property in names(shape_defaults)) {
      if (!stringr::str_detect(style, paste0("(^|[;\\s])", property, ":"))) {
        style <- paste0(style, " ", property, ": ", shape_defaults[[property]], ";")
      }
    }
    stringr::str_replace(tag, "style='[^']*'", paste0("style='", stringr::str_trim(style), "'"))
  }

  svg <- readr::read_file(path)
  svg <- stringr::str_replace_all(
    svg,
    "<(line|polyline|polygon|path|rect|circle) [^>]*?style='[^']*'",
    function(tags) purrr::map_chr(tags, add_missing_styles)
  )
  svg <- stringr::str_replace_all(svg, "<text ", "<text xml:space='preserve' ")
  readr::write_file(svg, path)
}

# 600 dpi png (ragg) and svg vector file (svglite) with the same name
# out_dir defaults to the knit working directory, i.e. the folder of the rmd
save_figure <- function(plot, name, width, height, out_dir = ".") {
  ggsave(file.path(out_dir, paste0(name, ".png")), plot,
         width = width, height = height, units = "in", dpi = 600,
         device = ragg::agg_png, bg = "white")
  svg_path <- file.path(out_dir, paste0(name, ".svg"))
  ggsave(svg_path, plot,
         width = width, height = height, units = "in",
         device = svglite::svglite)
  svg_inline_styles(svg_path)
}
