---# newdb.sh 스크립트----------
--- APPOWNER=newappo
--- APPUSER=newsvc
--- DBNAME=newdb
--- PASSWORD=pass1234
 
--- echo -- db 접근 권한 및 public schema 접근 권한 revoke
revoke all on database newdb from public ;
revoke all on schema public from public ;
 
--- echo -- 신규db에 schema 생성
create schema newappo authorization newappo ;
 
--- echo -- 서비스용 유저에 최소한의 권한만 부여
grant connect,TEMPORARY on database newdb to newsvc ;
grant usage on schema newappo to newsvc ;
grant select, insert, update, delete on all tables in schema newappo to newsvc ;
alter default privileges in schema newappo grant select, insert, update, delete on tables to newsvc ;
grant usage on all sequences in schema newappo to newsvc ;
alter default privileges in schema newappo grant usage on sequences to newsvc ;
 
--- echo -- 기본 스키마 변경 : public - schema
alter role newsvc set search_path to newappo ;


