--대소문자 구별 안함 
-- 비밀번호만 대소문자 구별함
ALTER SESSION SET "_oracle_script"=TRUE;

@C:\Users\soldesk\Desktop\db-sample-schemas-main\human_resources\hr_install.SQL

@C:\Users\soldesk\Desktop\db-sample-schemas-main\customer_orders\co_install.SQL	

@C:\Users\soldesk\Desktop\db-sample-schemas-main\sales_history\sh_install.SQL

@C:\app\soldesk\product\21c\dbhomeXE\rdbms\admin\scott.SQL	

-- scott 데이터베이스에 접속(녹색아이콘)

--select : read
-- select * from "테이블명" : 테이블의 모든 내용 보기
SELECT *FROM "AQ$_INTERNET_AGENT_PRIVS" aiap  ; --ctrl + enter

--조회할 때 특정 행 단위로 조회 (selection)

--조회할 때 특정 열 단위로 조회(projection)

SELECT aiap.AGENT_NAME, aiap.DB_USERNAME 
FROM "AQ$_INTERNET_AGENT_PRIVS" aiap --별명 

--중복 데이터 제거 : select distinct "행,열" from "테이블명" 
SELECT DISTINCT aiap.AGENT_NAME  FROM "AQ$_INTERNET_AGENT_PRIVS" aiap 

-- as 별칭
-- as 키워드 생략가능 (별칭에 공백이 있다면 ""사용)
SELECT ls."NULL$" "별 칭" , ls."LENGTH" *12 AS 별칭
FROM	"LOGMNR_SEED$" ls 

--정렬 : order by
-- 오름차순(기본): asc 내림차순: desc
SELECT	aqt."SCHEMA" , aqt.NAME 
FROM	"AQ$_QUEUE_TABLES" aqt 
ORDER BY "SCHEMA" DESC 

-- emp 테이블의 별핑 deptno  내림, ename 오름

- ctrl + shift + f : 자동장렬

-- 조건
-- 번호가 30번인 것만 조회
SELECT	*
FROM "LOGMNR_GT_TAB_INCLUDE$" lgti 
--WHERE	lgti.SPARE1 = 30

