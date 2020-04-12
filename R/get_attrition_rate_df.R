#' @importFrom rlang "!!"
#' @importFrom magrittr "%>%"
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
