bc_palettes <- list(
  # https://www.bc.edu/bc-web/styles/bc-web-style-guide/color.html
  main_brand   = c("#8a100b", "#b29d6c", "#726158"),

  primary      = c("#501315", "#8a100b", "#b30000",
                   "#8a6b46", "#b99b73", "#dccaa0",
                   "#ac6d37", "#d79713", "#c9ba99"),

  secondary    = c("#8a100b", "#b29d6c", "#726158",
                   "#b7b3a5", "#c5cfac", "#7fa7a4",
                   "#b2c0b9", "#799fa4", "#7a787c",
                   "#929b90", "#d5cfb5"),

  news_channel = c("#6296a8", "#c23148", "#ff9673", 
                   "#9fab78", "#dfad58", "#d48554", 
                   "#0873ae", "#938479")
)


bc_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  pal <- bc_palettes[[name]]

  if (is.null(pal)) {
    stop(paste("Palette \'", name, "\' not found.", sep = ""))
  }

  if (missing(n)) {
    n <- length(pal)
  }

  return_palette <- switch(
    type,
    # Recycles palette colors to desired discrete length
    "discrete"   = rep(pal, length.out = n),
    # Interpolates colors
    "continuous" = grDevices::colorRampPalette(pal)(n)
  )

  structure(
    return_palette,
    class = "palette",
    name  = name
  )
}


print.bc_palette <- function(palette) {
  scales::show_col(palette)
}
