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
WHERE	lgti.SPARE1 = 30

SELECT *
FROM "AQ$_QUEUE_TABLES" aqt 
WHERE aqt.NAME = 'AQ' AND aqt.OBJNO =21000

사원번호가 7499 이고 부서번호가 30인 사원 조회
SELECT	*
FROM EMP e
WHERE e.EMPNO = 7499 AND e.DEPTNO = 30


사원번호가 7499 이거나(OR) 부서번호가 30인 사원 조회
SELECT	*
FROM EMP e
WHERE e.EMPNO = 7499 OR e.DEPTNO = 30


--SAL(월급)일때 
--연봉이 36000 인 사원의 전체 정보 조회
SELECT * FROM EMP e WHERE e.SAL * 12 = 36000

--월급여가 3000초과인 사원의 전체 정보 조회
SELECT * FROM EMP e WHERE e.SAL > 3000

--월급여가 2500이상이고 사원직책이 ANALYST인 사원정보 조회
SELECT * FROM EMP e WHERE e.SAL >= 2500 AND e.JOB = 'ANALYST'

--사원직책이 MANAGER, SALESMAN,CLERK 인 사원정보 조회
SELECT * FROM EMP e WHERE e.JOB 'MANAGER'OR e.JOB 'SALESMAN' OR e.JOB 'CLERK' 


--ename의 시작이 f 이후의 문자로 시작하는 사원정보 조회
SELECT * FROM EMP e WHERE e.ENAME >= 'F'

-- = 같다, != 같지않다
SELECT * FROM EMP e WHERE e.SAL != 3000
SELECT * FROM EMP e WHERE e.SAL <> 3000
SELECT * FROM EMP e WHERE e.SAL ^= 3000

-- IN (OR 여러개)
SELECT * FROM EMP e WHERE e.JOB IN('MANAGER','SALESMAN','CLERK')

--NOT IN 
SELECT * FROM EMP e WHERE NOT IN ('MANAGER','SALESMAN','CLERK')

--부서번호가 10이거나 20인 사원조회
SELECT * FROM EMP e WHERE e.DEPTNO IN (10,20)

--특정 범위 있는 값 추출할 때 사용 : BETWEEN A AND B
--급여가 2000이상 3000이하인 사원 정보 조회
SELECT *
FROM EMP e
WHERE E.SAL >=2000 AND e.SAL <=3000

SELECT *
FROM EMP e
WHERE E.SAL BETWEEN 2000 AND 3000

-- 2000이상 3000이하가 아닌
SELECT *
FROM EMP e
WHERE E.SAL NOT BETWEEN 2000 AND 3000























