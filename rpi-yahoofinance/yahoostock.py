# -*- coding: utf-8 -*-

import urllib2
from bs4 import BeautifulSoup


def main():
    """
    Yahooファイナンスから株価を抽出する関数
    """
    code = u"998407.o"
    url = u"http://stocks.finance.yahoo.co.jp/stocks/detail/?code=" + code
    html = urllib2.urlopen(url)
    soup = BeautifulSoup(html, "lxml")
    
    # 株価を取得
    # td class="stoksPrice"を検索
    for price in soup.find_all("td", class_="stoksPrice"):
        if price.string:
            print "Yahoo! ファイナンスから株価を取得しました。"
            # 抽出結果を文字列として格納、桁区切りを削除
            stockPrice = str(price.string).replace(',', '')
            if stockPrice.replace('.', '', 1).isdigit():
                stockPrice = float(stockPrice)
                print "株価を数値として格納しました。"
                print "株価：" + str(stockPrice)
            else:
                print "株価を数値として格納できませんでした。"


if __name__ == '__main__':
    main()
