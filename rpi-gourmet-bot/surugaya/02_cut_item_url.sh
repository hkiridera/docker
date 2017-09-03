#1/bin/bash
# TOPページから商品リンク抽出

rm data/url_lists
for i in `seq 1 15`
do
  grep 'FIGURE-[0-9]\{6\}' search_items/${i} | tr -d ' ' | awk -F'[<|>]' '{print $4}'  | tr -d '"\"'  | cut -c7- | grep -v page >> data/url_lists
done

rm data/url_lists_uniq
cat data/url_lists | sort | uniq  >> data/url_lists_uniq
