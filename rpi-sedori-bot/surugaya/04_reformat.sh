#!/bin/bash -x

rm data/items_reformed.csv
cat data/items.csv |
#cat items.csv |
awk -F , '
{
  if($2 == "商品コード"){
    i=26;while(i>2){
      $(i) = $(i-1);i--
    } $2=""
  }
  if($3 == "商品コード"){
    i=26;while(i>3){
      $(i) = $(i-1);i--
    } $3=""
  }
  if($4 == "商品コード"){
    i=26;while(i>4){
      $(i) = $(i-1);i--
    } $4=""
  }
  if($5 == "商品コード"){
    i=26;while(i>5){
      $(i) = $(i-1);i--
    } $5=""
  }
  if($10 == "シリーズ名"){
    i=26;while(i>10){
      $(i) = $(i-1);i--
    } $10=""
  }
  if($11 == "シリーズ名"){
    i=26;while(i>11){
      $(i) = $(i-1);i--
    } $11=""
  }
  if($12 == "シリーズ名"){
    i=26;while(i>12){
      $(i) = $(i-1);i--
    } $12=""
  }
  if($10 == "原作名"){
    i=26;while(i>10){
      $(i) = $(i-1);i--
    } $10=""
  }
  if($11 == "原作名"){
    i=26;while(i>11){
      $(i) = $(i-1);i--
    } $11=""
  }
  if($12 == "原作名"){
    i=26;while(i>12){
      $(i) = $(i-1);i--
    } $12=""
  }
  if($13 == "原作名"){
    i=26;while(i>13){
      $(i) = $(i-1);i--
    } $13=""
  }
  if($14 == "原作名"){
    i=26;while(i>14){
      $(i) = $(i-1);i--
    } $14=""
  }
  if($15 == "原作名"){
    i=26;while(i>15){
      $(i) = $(i-1);i--
    } $15=""
  }
  if($18 == "キャラ名"){
    i=26;while(i>18){
      $(i) = $(i-1);i--
    } $18=""
  }
  if($19 == "キャラ名"){
    i=26;while(i>19){
      $(i) = $(i-1);i--
    } $19=""
  }
  if($12 == "造型師"){
    i=26;while(i>12){
      $(i) = $(i-1);i--
    } $12=""
  }
  if($13 == "造型師"){
    i=26;while(i>13){
      $(i) = $(i-1);i--
    } $13=""
  }
  if($14 == "造型師"){
    i=26;while(i>14){
      $(i) = $(i-1);i--
    } $14=""
  }
  if($15 == "造型師"){
    i=26;while(i>15){
      $(i) = $(i-1);i--
    } $15=""
  }
  if($16 == "造型師"){
    i=26;while(i>16){
      $(i) = $(i-1);i--
    } $16=""
  }
  if($17 == "造型師"){
    i=26;while(i>17){
      $(i) = $(i-1);i--
    } $17=""
  }
  if($18 == "造型師"){
    i=26;while(i>18){
      $(i) = $(i-1);i--
    } $18=""
  }
  if($19 == "造型師"){
    i=26;while(i>19){
      $(i) = $(i-1);i--
    } $19=""
  }
  if($20 == "造型師"){
    i=26;while(i>20){
      $(i) = $(i-1);i--
    } $20=""
  }
  if($21 == "造型師"){
    i=26;while(i>21){
      $(i) = $(i-1);i--
    } $21=""
  }
  if($22 == "造型師"){
    i=26;while(i>22){
      $(i) = $(i-1);i--
    } $22=""
  }
  if($23 == "造型師"){
    i=26;while(i>23){
      $(i) = $(i-1);i--
    } $23=""
  }
  i = 0
  while ( i < 26 ){
    if($i ~ /<[^ ]*/){
      $i=""
    }
   i++
  }
}
{print $1","$2","$3","$4","$5","$6","$7","$8","$9","$10","$11","$12","$13","$14","$15","$16","$17","$18","$19","$20","$21","$22","$23","$24","$25","$26}
'|
tee data/items_reformed.csv
#sed -e 's/ /,/g' |
#>> data/items_reformed.csv
