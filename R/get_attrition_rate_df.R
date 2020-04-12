#' Get attrition rate dataframe
#'
#' @param data dataframe
#' @param entry_year string
#' @param tenure integer
#' @param attrition_flg interger
#'
#' @importFrom rlang "!!"
#' @importFrom magrittr "%>%"
#'
#' @return dataframe
#' @export
#'
#' @examples
#' set.seed(123)
#' df <- data.frame(
#'   entry_year = rep(c("FY17", "FY18", "FY19"), 3),
#'   tenure = c(0, 0, 0, 1, 1, 0, 2, 1, 0),
#'   attrition_flg = sample(c(0, 1), 9, replace = TRUE),
#'   stringsAsFactors = FALSE
#' )
#' get_attrition_rate_df(df, entry_year, tenure, attrition_flg)
get_attrition_rate_df <- function(data, entry_year, tenure,  attrition_flg) {
  entry_year <- rlang::enquo(entry_year)
  tenure <- rlang::enquo(tenure)
  attrition_flg <- rlang::enquo(attrition_flg)

  rate_df <- data %>%
    dplyr::group_by(!!entry_year, !!tenure, !!attrition_flg) %>%
    dplyr::summarise(n = dplyr::n()) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(!!entry_year) %>%
    dplyr::mutate(
      total_num = sum(n)
    ) %>%
    dplyr::filter(!!attrition_flg == 1) %>%
    dplyr::mutate(
      cumsum_n = cumsum(n),
      cumsum_freq = paste0(round(cumsum_n / total_num * 100, 1), "%"),
      n_freq = paste0(cumsum_n, "\n(", cumsum_freq, ")"),
    ) %>%
    dplyr::select(!!entry_year, !!tenure, n_freq) %>%
    tidyr::pivot_wider(names_from = !!tenure, values_from = n_freq) %>%
    dplyr::ungroup()

  count <- data %>%
    dplyr::group_by(!!entry_year) %>%
    dplyr::summarise(n = dplyr::n()) %>%
    dplyr::ungroup()

  out <- rate_df %>%
    dplyr::full_join(count, by = rlang::quo_name(entry_year))

  dplyr::arrange(out, !!entry_year)
}
