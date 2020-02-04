# 参考
# https://gist.github.com/dichika/5273e7bd540ba3d5d551
# https://gist.github.com/horihorio/9d7e557a8e4e2320916e
# http://ja.wikipedia.org/wiki/%E5%8D%8A%E8%A7%92%E3%82%AB%E3%83%8A#.E5.8D.8A.E8.A7.92.E3.82.AB.E3.83.8A.E4.B8.80.E8.A6.A7

hankana_to_zenkana <- function(string) {
  # chr 型へ変換
  if (!is.character(string)) string <- as.character(string)

  # 濁点、半濁点文字の置換
  dh <- c("ｶﾞ","ｷﾞ","ｸﾞ","ｹﾞ","ｺﾞ","ｻﾞ","ｼﾞ","ｽﾞ","ｾﾞ","ｿﾞ","ﾀﾞ","ﾁﾞ","ﾂﾞ","ﾃﾞ","ﾄﾞ","ﾊﾞ","ﾋﾞ","ﾌﾞ","ﾍﾞ","ﾎﾞ","ﾊﾟ","ﾋﾟ","ﾌﾟ","ﾍﾟ","ﾎﾟ")
  dz <- c("ガ","ギ","グ","ゲ","ゴ","ザ","ジ","ズ","ゼ","ゾ","ダ","ヂ","ヅ","デ","ド","バ","ビ","ブ","ベ","ボ","パ","ピ","プ","ペ","ポ")
  names(dz) <- dh
  string <- stringr::str_replace_all(string, dz)

  # 1 bite 文字の置換
  string <- chartr("ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝ｡｢｣､･ｦｧｨｩｪｫｬｭｮｯｰ",
                   "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン。「」、・ヲァィゥェォャュョッー",
                   string)

  string
}
