# global reference to scipy (will be initialized in .onLoad)
# scipy <- NULL
#
# .onLoad <- function(libname, pkgname) {
#   # use superassignment to update global reference to scipy
#   scipy <<- reticulate::import("matplotlib", delay_load = TRUE)
# }

install_matplotlib <- function(method = "auto", conda = "auto") {
  reticulate::py_install("matplotlib", method = method, conda = conda)
}

install_matplotlib()

example1 <- data.frame(
  flows = c(0.25, 0.15, 0.60, -0.20, -0.15, -0.05, -0.50, -0.10),
  labels = c("", "", "", "First", "Second", "Third", "Fourth", "Fifth"),
  orientations = c(-1, 1, 0, 1, 1, 1, 0, -1),
  pathlengths=10
)


sankey <- function(x,
                   settings_scale=0.01,
                   settings_offset=0.2,
                   settings_head_angle=90,
                   settings_format='%.0f',
                   settings_unit='%',
                   fig_title,
                   sankey_label = "",
                   sankey_color = FALSE,
                   center_text_bold = FALSE){
  if (!"pathlengths" %in% names(x)) x$pathlengths <- 0.25
  if (!"colors" %in% names(x)) x$colors <- "black"
  ddf <- x
  # ddf <- reticulate::r_to_py(x)
  # fig_title <- reticulate::r_to_py(fig_title)
  #ddf <- reticulate::r_to_py(x)
  reticulate::source_python("R/plotter.py")
  fun3(ddf, x, settings_scale, settings_offset, settings_head_angle, settings_format,
       settings_unit, fig_title, sankey_label, sankey_color, center_text_bold)
}

example2 <- data.frame(
  flows = c(15, 0, 60, -10, -20, -5, -15, -30, -20),
  labels = c('', '', '', 'First', 'Second', 'Third', 'Looooooong Fourth',
             'Fifth', 'Hurray!'),
  orientations = c(-1, 1, 0, 1, 1, 1, -1, 1, 0),
  pathlengths = c(0.25, 0.25, 0.25, 0.25, 0.25, 0.1, .5, 0.25,
                  0.25),
  color='r'
)

sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system")
