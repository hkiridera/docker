#!/bin/bash

LAST_MOUNTH=`date -d "1 month ago" +"%Y-%m-%d"`
NEXT_YEAR=`date -d "1 next year" +"%Y-%m-%d"`

rm search_items/*

for i in `seq 1 15`
do
#  URL=`echo "https://b2b.mile-stone.jp/p/search?page=${i}&select_date=reservation&amp;date_from=${LAST_MOUNTH}&amp;date_to=${NEXT_YEAR}"`
   URL=`echo "http://slist.amiami.jp/top/search/list?s_cate2=459&s_preorderitem=1&pagemax=40&getcnt=0&pagecnt=${i}"`
  echo $URL

  curl -b cookie.txt "$URL" > search_items/${i}
done
