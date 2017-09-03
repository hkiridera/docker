#curl -c cookie.txt -d "account=100007119" -d "password=861b2a02" "https://b2b.mile-stone.jp/login"
curl -b cookie.txt "https://b2b.mile-stone.jp/p/500466294/" > data/top_page.html
