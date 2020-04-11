#' Replace hankakukatakana with zenkakukatakana
#'
#' @param string string
#'
#' @return string
#' @export
#'
#' @examples
#' string <- "ﾊﾝｶｸｶﾅﾊｱﾌﾞﾅｲ"
#' hankana_to_zenkana(string)
hankana_to_zenkana <- function(string) {
  # 参考
  # https://gist.github.com/dichika/5273e7bd540ba3d5d551
  # https://gist.github.com/horihorio/9d7e557a8e4e2320916e
  # http://ja.wikipedia.org/wiki/%E5%8D%8A%E8%A7%92%E3%82%AB%E3%83%8A#.E5.8D.8A.E8.A7.92.E3.82.AB.E3.83.8A.E4.B8.80.E8.A6.A7

  # chr 型へ変換
  if (!is.character(string)) string <- as.character(string)

  # 濁点、半濁点文字の置換
  dh <- c("\uff76\uff9e", "\uff77\uff9e", "\uff78\uff9e", "\uff79\uff9e",
          "\uff7a\uff9e", "\uff7b\uff9e", "\uff7c\uff9e", "\uff7d\uff9e",
          "\uff7e\uff9e", "\uff7f\uff9e", "\uff80\uff9e", "\uff81\uff9e",
          "\uff82\uff9e", "\uff83\uff9e", "\uff84\uff9e", "\uff8a\uff9e",
          "\uff8b\uff9e", "\uff8c\uff9e", "\uff8d\uff9e", "\uff8e\uff9e",
          "\uff8a\uff9f", "\uff8b\uff9f", "\uff8c\uff9f", "\uff8d\uff9f",
          "\uff8e\uff9f")
  dz <- c("\u30ac", "\u30ae", "\u30b0", "\u30b2", "\u30b4", "\u30b6", "\u30b8",
          "\u30ba", "\u30bc", "\u30be", "\u30c0", "\u30c2", "\u30c5", "\u30c7",
          "\u30c9", "\u30d0", "\u30d3", "\u30d6", "\u30d9", "\u30dc", "\u30d1",
          "\u30d4", "\u30d7", "\u30da", "\u30dd")
  names(dz) <- dh
  string <- stringr::str_replace_all(string, dz)

  # 1 bite 文字の置換
  string <- chartr("\uff71\uff72\uff73\uff74\uff75\uff76\uff77\uff78\uff79\uff7a\uff7b\uff7c\uff7d\uff7e\uff7f\uff80\uff81\uff82\uff83\uff84\uff85\uff86\uff87\uff88\uff89\uff8a\uff8b\uff8c\uff8d\uff8e\uff8f\uff90\uff91\uff92\uff93\uff94\uff95\uff96\uff97\uff98\uff99\uff9a\uff9b\uff9c\uff66\uff9d\uff61\uff62\uff63\uff64\uff65\uff66\uff67\uff68\uff69\uff6a\uff6b\uff6c\uff6d\uff6e\uff6f\uff70",
                   "\u30a2\u30a4\u30a6\u30a8\u30aa\u30ab\u30ad\u30af\u30b1\u30b3\u30b5\u30b7\u30b9\u30bb\u30bd\u30bf\u30c1\u30c4\u30c6\u30c8\u30ca\u30cb\u30cc\u30cd\u30ce\u30cf\u30d2\u30d5\u30d8\u30db\u30de\u30df\u30e0\u30e1\u30e2\u30e4\u30e6\u30e8\u30e9\u30ea\u30eb\u30ec\u30ed\u30ef\u30f2\u30f3\u3002\u300c\u300d\u3001\u30fb\u30f2\u30a1\u30a3\u30a5\u30a7\u30a9\u30e3\u30e5\u30e7\u30c3\u30fc",
                   string)

  string
}
