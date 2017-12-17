FROM elasticsearch:5.6.5

# x-pack をインストール
RUN elasticsearch-plugin  install --batch x-pack

# kuromojiをインストール
RUN elasticsearch-plugin  install analysis-kuromoji
