<?php
  // 読み込むファイル名の指定
  $file_name = "data/items_reformed.csv";
  $file_name2 = "data/livedoor_posted";
  // ファイルポインタを開く
  $fp = fopen( $file_name, 'r' );
  $fp2 = fopen( $file_name2, 'a' );

  // データが無くなるまでファイル(CSV)を１行ずつ読み込む
  while( $ret_csv = fgetcsv( $fp ) ) {
    // 読み込んだ行(CSV)を表示する

    $item_title = " ";
    $item_code  = " ";
    $item_sells_day = " ";
    $item_brand1 = " ";
    $item_brand2 = " ";
    $item_series1 = " ";
    $item_series2 = " ";
    $item_origin  = " ";
    $item_chara1  = " ";
    $item_chara2  = " ";
    $item_chara3  = " ";
    $item_modeler = " ";
    $item_image1  = " ";
    $item_afili   = " ";
    $item_body1   = " ";
    $item_body2   = " ";

    $item_title = $ret_csv[0];
    $item_code  = $ret_csv[6];
    $item_sells_day = $ret_csv[8];
    $item_brand1 = $ret_csv[10];
    $item_brand2 = $ret_csv[11];
    $item_series1 = $ret_csv[13];
    $item_series2 = $ret_csv[14];
    $item_origin  = $ret_csv[16];
    $item_chara1  = $ret_csv[18];
    $item_chara2  = $ret_csv[19];
    $item_chara3  = $ret_csv[20];
    $item_modeler = $ret_csv[22];
    echo("[".$item_code."]");

    echo("\n");
    
    //タイトルが空なら何もしない
    if($item_title == "" ){
      echo("skip\n");
      continue;
    }
    //すでに投稿済みであれば何もしない
    $cmd = "grep ".$item_code." ". $file_name2;
    exec( $cmd, $output, $exit);
    if( ! $exit ){
      echo("already posted\n");
      continue;
    }
    
    //すでに投稿済みフラグを記入する
    fprintf($fp2, "%s\n",$item_code);

    //画像リンクを取得
    $cmd = "curl -siXGET http://www.amiami.jp/top/detail/detail?gcode=$item_code | grep http://img.amiami.jp/images/product/review/ | grep $item_code | awk -F '[<> =]' '{print $4}' | tr -d \"\\\"\" ";
    $item_image1 = exec( $cmd );

    //アフィリエイトコード取得
    $item_afili   = "http://px.a8.net/svt/ejp?a8mat=2NI1KA+80R9Y2+NA2+BW8O2&amp;a8ejpredirect=http%3A%2F%2Fwww.amiami.jp%2Ftop%2Fdetail%2Fdetail%3Fgcode%3D" . $item_code;
    
    //本文取得
    $cmd = "curl -siXGET http://www.amiami.jp/top/detail/detail?gcode=$item_code | grep -A 2 製品仕様 | sed  -e 's/製品仕様/<b>【製品仕様】<\/b>/g' -e 's/ class=\"box_01\"//g' -e 's/ \\///g' -e 's/ class=\"heading_07\"//g' -e 's/\\t//g' -e 's/<br>/<br \/>/g' -e '/^$/d' | tr -d '\\n'";
    $item_body1 = shell_exec( $cmd );


    require_once 'HTTP/Request2.php';
   
    $pwd = 'yv4zjHvMgB';
    $id = 'shop_sakuya';
    $url= 'https://livedoor.blogcms.jp/atompub/' . $id . '/article';
 
#    $title = 'APIテスト投稿タイトル';
    $title = $item_title;
    $text = '<p>' . $item_title . '</p>' ;
    $text = $text . '<a href="' . $item_afili . '">' . '<img src="' . $item_image1 . '"' . ' alt="" width="600"/></a>';
    $text = $text . $item_body1 ;
#    $text = $text . '<a href="' . $item_image1 . '">' . '<img src="' . $item_image1 . '"' . ' alt="" height="640"/></a>';
    echo $text;
    $category1 = 'フィギュア';
    $category2 = $item_brand1;
    $category3 = $item_brand2;
    $category4 = $item_series1;
    $category5 = $item_series2;
    $category6 = $item_origin;
    $category7 = $item_chara1; 
    $category8 = $item_chara2;
    $category9 = $item_chara3;
   
    $xml = '';
    $xml = $xml . '<?xml version="1.0"?>';
    $xml = $xml . '<entry xmlns="http://www.w3.org/2007/app" xmlns:atom="http://www.w3.org/2005/Atom">';
    $xml = $xml . '<title type="text/html" mode="escaped">' . $title . '</title>';
    $xml = $xml . '<content type="application/xhtml+xml">' . $text . '</content>';
    $xml = $xml . '<category term="' . $category1 . '"/>';
    $xml = $xml . '</entry>';
     
    try{
      $req = new HTTP_Request2();
      $req->setUrl($url);
      $req->setConfig(array('ssl_verify_host' => false,
                          'ssl_verify_peer' => false
                       ));
      $req->setMethod(HTTP_Request2::METHOD_POST);
      $req->setAuth($id, $pwd);
      $req->setBody($xml);
      $req->send();
      sleep (3600);
    } catch (HTTP_Request2_Exception $e) {
      die($e->getMessage());
    } catch (Exception $e) {
      die($e->getMessage());
    }
  } 
  // 開いたファイルポインタを閉じる
  fclose( $fp );
?>
