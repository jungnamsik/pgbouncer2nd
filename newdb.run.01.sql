---# newdb.sh 스크립트----------
--- APPOWNER=newappo
--- APPUSER=newsvc
--- DBNAME=newdb
--- PASSWORD=pass1234
 
--- drop database newdb
--- drop user newappo
--- drop user newsvc
 
--- echo -- 신규 유저 생성
create user newappo with password 'pass1234' ;
create user newsvc with password 'pass1234' ;
 
--- echo -- 신규 DB 생성
create database newdb with OWNER=newappo ;
 