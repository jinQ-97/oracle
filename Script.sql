-- scott 데이터베이스에 접속(녹색아이콘)

--select : read
-- select * from "테이블명" : 테이블의 모든 내용 보기
SELECT *FROM "AQ$_INTERNET_AGENT_PRIVS" aiap  ; --ctrl + enter

--조회할 때 특정 행 단위로 조회 (selection)

--조회할 때 특정 열 단위로 조회(projection)

SELECT aiap.AGENT_NAME, aiap.DB_USERNAME 
FROM "AQ$_INTERNET_AGENT_PRIVS" aiap --별명 