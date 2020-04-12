#' @importFrom rlang "!!"
#' @importFrom magrittr "%>%"
get_attrition_rate_df <- function(data, entry_year) {
  entry_year <- rlang::enquo(entry_year)

  rate_df <- data %>%
    dplyr::select(!!entry_year)

  rate_df
}
