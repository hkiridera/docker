#!/bin/bash


rm data/items.csv

for URL in `cat data/url_lists_uniq`
#for URL in `echo "http://www.amiami.jp/top/detail/detail?gcode=FIGURE-012863"`
do

#  curl -si -b cookie.txt "$URL"  | tr -d ' []'  | grep -A 1000 "primary" | grep -B 1000 "/.primary"  | sed -e 's/新商品/ /g' -e 's/再販/ /g' -e 's/<..>//g' -e 's/<\/..>//g' -e 's/<....>//g' -e 's/<\/....>//g' -e 's/<dlclass=\"clearfix\">//g' -e 's/<[^ ]*>//g'  -e 's/<!--//g' -e 's/-->//g' -e 's/&nbsp;//g' -e 's/&lt;&lt;//g' -e 's/円(税別)//g' -e '1d' -e 's/会員ランクについて//g' -e 's/各画像をクリックすると拡大します。//g' -e 's/前のページへ戻る//g' -e '/販売単位/d' -e '/入数/d' -e '/個/d' -e '/^$/d' | tr -d ',' | tr '\n' ',' >> data/items.csv

  curl -si -b cookie.txt "$URL" > test
  TITLE=`cat test | grep "heading_10" | sed -e "s/ //g" |  awk -F '[<>]' '{print $3}'`
  OTHER_INFO=`cat test | grep -A 1000 "spec_data" | grep -B 1000 "おまかせ！ログレコメンダー" | sed -e 's/購入制限//g' -e 's/<dl class=\"spec_data\">//g' -e 's/<..>//g' -e 's/<\/..>//g' -e 's/<....>//g' -e 's/<\/....>//g' -e '/<[^ ]*>/d'  -e 's/<!--//g' -e 's/-->//g' -e 's/&nbsp;//g' -e 's/&lt;&lt;//g' | sed -e  's/\t/,/g' | tr -d ',,' | sed -e '/^$/d' | sed -e 's/<a href=\"[^ ]*>//g' | sed -e '14,30d' | tr '\n' ',' `


  echo ${TITLE},${OTHER_INFO} >> data/items.csv

done
