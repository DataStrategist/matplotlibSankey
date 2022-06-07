### Functions

#' @title install python library matplotlib
#' @description This function (and package) depend on the Python library
#'   matplotlib. The simplest way this could work would be for users to use
#'   miniconda, and then just run this function to install that library within
#'   their environment. For context, Python uses virtual environments a lot more
#'   than R does, so this could be important if you do a lot of Python work.
#'   Since this is only one library, it is probably safest to just leave the
#'   settings as per the defaults.
#' @param method method is passed to python installer. Default values are
#'   probably what beginners want, although experienced might refer to the
#'   reticulate documentation:
#'   https://rstudio.github.io/reticulate/articles/package.html, Default: 'auto'
#' @param conda conda is passed to python installer. Default values are probably
#'   what beginners want, although experienced might refer to the reticulate
#'   documentation: https://rstudio.github.io/reticulate/articles/package.html,
#'   Default: 'auto'
#' @importFrom reticulate py_install
#' @return nothing, but the matplotlib Python library will be installed in your
#'   current environment, enabling you to run the `sankey` function.
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#' install_matplotlib()
#'  }
#' }
#' @seealso \code{\link[reticulate]{py_install}}
#' @rdname install_matplotlib
#' @export
install_matplotlib <- function(method = "auto", conda = "auto") {
  reticulate::py_install("matplotlib", method = method, conda = conda)
}

#' @title create sankey visual
#' @description This is the main function of this package, and allows for the
#'   creation of a Sankey visual that is one arrow with flows flowing from it
#'   FUNCTION_DESCRIPTION
#' @param x a dataframe with at least two columns: `flows`, `orientations`. All
#'   other fields are optional
#' @param settings_scale How "tall" the plot should be, and by extension, how
#'   wide or compact the plot looks. Lower numbers imply the San is not very
#'   tall, resulting in more definition in the arrow flows. Default: 0.01
#' @param settings_offset How far should labels be from their arrows. Lower
#'   numbers are closer, Default: 0.2
#' @param settings_head_angle angle of each arrow's head. Results above 180 will
#'   look wonky, Default: 90
#' @param settings_format unsure, Default: "\%.0f"
#' @param settings_unit units for labels, Default: "\%"
#' @param fig_title Title for the visual (on top of the frame), Default: ""
#' @param sankey_label Text to visualize within the arrow's body, Default: ""
#' @param sankey_color The fill color of the Sankey, Default: FALSE
#' @param center_text_bold Should the `sankey_label` be bold? Default: FALSE
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  example1 <- data.frame(
#'  flows = c(15, 0, 60, -10, -20, -5, -15, -30, -20.004),
#'  labels = c('', '', '', 'First', 'Second', 'Third', 'Looooooong Fourth',
#'  'Fifth', 'Hurray!'),
#'    orientations = c(-1, 1, 0, 1, 1, 1, -1, 1, 0),
#'  pathlengths = c(0.25, 0.25, 0.25, 0.25, 0.25, 0.1, .5, 0.25,
#'  0.25),
#'  color='r'
#'  )
#'
#'  sankey(x = example1, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system")
#'
#'  ## settings_scale changes how the plot looks. Compare the following:
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_scale = 0.01)
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_scale = 0.1)
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_scale = 0.001)
#'
#'  ## settings_offset moves labels
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_offset = 0.0001)
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_offset = 0.1)
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_offset = 1)
#'
#'  ## settings_head_angle changes the angles of the arrows
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_head_angle = 180)
#'  sankey(x = example2, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system", settings_head_angle = 30)
#'
#'  }
#' }
#' @testexamples{
#' sankey(x = example1, fig_title = "Boom?", sankey_color = "lightblue", sankey_label = "the whole system")
#' }
#' @seealso \code{\link[reticulate]{source_python}}
#' @rdname sankey
#' @export
#' @importFrom reticulate source_python
sankey <- function(x,
                   settings_scale=0.01,
                   settings_offset=0.2,
                   settings_head_angle=90,
                   settings_format='%.0f',
                   settings_unit='%',
                   fig_title = "",
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

