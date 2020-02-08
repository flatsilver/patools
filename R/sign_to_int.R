#' Replace sign with integer
#'
#' @param sign string
#'
#' @return integer
#' @export
#'
#' @examples
#' sign <- c("A+", "B", NA_character_, "N", "-", "B+", "D")
#' sign_to_int(sign)
sign_to_int <- function(sign) {
  pattern <- c("^S$"    = "10",
               "^A\\+$" = "9",
               "^A$"    = "8",
               "^A\\-$" = "7",
               "^B\\+$" = "6",
               "^B$"    = "5",
               "^B\\-$" = "4",
               "^C\\+$" = "3",
               "^C$"    = "2",
               "^C\\-$" = "1",
               "^D$"    = "0",
               "^-$"    = NA_character_,
               "^N$"    = NA_character_
  )

  as.integer(stringr::str_replace_all(sign, pattern))
}
