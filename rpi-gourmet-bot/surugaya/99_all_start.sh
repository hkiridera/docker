#!/bin/bash
bash 00_top_crawl.sh;
bash 01_search_item_lists.sh;
bash 02_cut_item_url.sh;
bash 03_show_item.sh;
bash 04_reformat.sh; 
sleep 60; 
php 05_livedoor.php;
