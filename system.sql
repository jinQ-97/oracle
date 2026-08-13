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

--like : 특정 문자 또는 특정 문자열을 포함하는 데이터를 조회
-- _ : 한개의 문자 데이터를 의미 
-- % : 길이와 상관없이 모든 문자 데이터를 의미

-- 사원 이름이 s로 시작하는 사원 정보 조회
SELECT *
FROM EMP e
WHERE e.ENAME LIKE 'S%'

-- 사원 이름의 두번째 글자가 L인 사원 정보 조회
SELECT *
FROM EMP e
WHERE e.ENAME LIKE '_L%'

-- 사원 이름에 AM이 포함되어 있는 사원만 조회
SELECT *
FROM EMP e
WHERE e.ENAME LIKE '%Am%'

--사원 이름에 AM이 포함되어 있지 않는 사원만 조회
SELECT *
FROM EMP e
WHERE e.ENAME NOT LIKE '%AM%'


-- IS NULL
-- COMM 이 NULL 인 직원 조회
SELECT * FROM EMP e WHERE e.COMM IS NULL 

SELECT *FROM EMP e WHERE e.MGR IS NULL 

--NULL 에 산술, 비교 연산시 결과값은 모두 NULL이다.
SELECT E.SAL, E.COMM, E.SAL * E.COMM, E.SALL + E.COMM
FROM EMP e

--집합 연산자
--UNION(합집합), UNION ALL(중복인 결과값도 출력), MINUS(차집합), INTERSECT(교집합)
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
FROM EMP e WHERE E.DEPTNO = 10
UNION ALL
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
FROM EMP e WHERE E.DEPTNO = 10

SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
FROM EMP e 
MINUS
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
FROM EMP e WHERE E.DEPTNO = 10

SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
FROM EMP e 
INTERSECT 
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
FROM EMP e WHERE E.DEPTNO = 10

-- 오라클 함수
--1. 문자함수
-- UPPER(), LOWER(), INITCAP()

SELECT E.ENAME, UPPERE(E.ENAME), LOWER(E.ENAME), INITCAP(E.ENAME)
FROM EMP e 

--job 이 salesman인 직원조회
SELECT	* FROM EMP e WHERE LOWER(e.Job) = salesman

--length(), lengthb() : 바이트 수 변환
SELECT E.ENAME, LENGTH(E.ENAME), LENGTHB(E.ENAME) 
FROM EMP e 

-- dual : 더미 테이블
SELECT LENGTH('한글'), LENGTHB('한글') 
FROM dual


--직책 이름이 6자리 이상인 사원 조회
SELECT	* FROM EMP e WHERE LENGTH(e.Job) >= 6

--substr(문자열데이터, 시작위치, 추출길이) : 부분 물자열 추출
SELECT e.Job SUBSTR(e.Job,1,2), SUBSTR(e.Job,3,2).SUBSTR(e.Job,5) FROM EMP e 

SELECT e.Job SUBSTR(e.Job,-LENGTH(e.Job), SUBSTR(e.Job,-LENGTH(e.Job),2).SUBSTR(e.Job,-3) FROM EMP e 

--INSTR(원본문자열,찾을문자,시작위치,찾으려는 문자가 몇번째인지) : 문자열 데이터 안에서 특정 문자 위치 찾기

SELECT INSTR('HELLO ORACLE!','L') AS INSTR1, INSTR('HELLO ORACLE!','L',5)AS INSTR2,INSTR('HELLO ORACLE!','L',2,2)AS INSTR3
FROM dual

--REPLACE(원본,찾는문자,대체문자)
--010-1234-5678에서 -를 찾아서 공백으로 변경
SELECT '010-1234-5678', REPLACE('010-1234-5678','-',' '),REPLACE('010-1234-5678','-')
FROM DUAL

-- CONCAT(문자1,문자2) : 두 문자열 데이터 연결
SELECT e.EMPNO, e.ENAME, CONCAT(e.EMPNO,e.ENAME), CONCAT(e.EMPNO,CONCAT(':',e.ENAME))
FROM EMP e

-- ||
SELECT e.EMPNO, e.ENAME, e.EMPNO || e.ENAME, e.EMPNO || ':'||e.ENAME
FROM EMP e

--데이터의 공간을 특정 문자로 채우는 LPAD, RPAD 
SELECT 'Oracle', LAPD('Oracle',10,'#'),RAPD('Oracle',10,'*'),LAPD('Oracle',10),RAPD('Oracle',10)
FROM dual

SELECT RPAD('971225-',14,'*')
FROM DUAL

-- 특정 문자를 지우는 TRIM, LTRIM, RTRIM
-- 삭제할 문자 미지정 시 공백 제거
SELECT '['||TRIM(' __Oracle__ ')||']' AS trim, '['||RTRIM(' __Oracle__ ')||']' AS rtrim, '['||LTRIM(' __Oracle__ ')||']' AS ltrim
FROM DUAL

SELECT '['||TRIM('_'FROM'__Oracle__')||']' AS trim, '['||RTRIM('<_Oracle_>','_<')||']' AS rtrim, '['||LTRIM('<_Oracle_>','>_')||']' AS ltrim
FROM DUAL

-- [숫자함수] 
-- ROUND(반올림), TRUNC(버림), CEIL(), FLOOR(), MOD()
SELECT ROUND(1234.5678) AS RONUD0, ROUND(1234.5678,0) AS RONUD1, ROUND(1234.5678,1) AS RONUD2, ROUND(1234.5678,2) AS RONUD3, ROUND(1234.5678,-1) AS RONUD4
FROM DUAL

SELECT TRUNC(1234.5678) AS RONUD0, TRUNC(1234.5678,0) AS RONUD1, TRUNC(1234.5678,1) AS RONUD2, TRUNC(1234.5678,2) AS RONUD3, TRUNC()(1234.5678,-1) AS RONUD4
FROM DUAL

--CEIL() : 지정한 숫자와 가까운 큰 정수
--FLOOR() : 지정한 숫자와 가까운 작은 정수
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL

--MOD(나머지) : %  
SELECT MOD(15,6), MOD(10,2), MOD(11,2)
FROM DUAL

--[날짜함수]
--SYSDATE
SELECT SYSDATE, SYSDATE-1, SYSDATE+1
FROM DUAL

-- 현재 날짜를 기준으로 3개월 이후 날짜 조회 : ADD_MONTHS()
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3)
FROM DUAL

--두 날짜간의 개월 수 차이 : MONTHS_BETWEEN()
SELECT  e.empno, e.HIREDATE, SYSDATE, MONTHS_BETWEEN(e.HIREDATE,SYSDATE) AS MONTH1, MONTHS_BETWEEN(SYSDATE,E.HIREDATE) AS MONTH2 TRUNC(MONTHS_BEETWEEN(SYSDATE,E.HIREDATE)) AS MONTH3 
FROM EMP e

--LAST_DAY(날짜) : 날짜가 속한 달의 마지막 날짜 출력
--NEXT_DAY(날짜, 요일) : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력

SELECT SYSDATE, LAST_DAY(SYSDATE), NEXT_DAY(SYSDATE,'금요일')
FROM DUAL

-- 입사 10주년이 되는 날짜 출력 -사원번호,이름(F.L),입사일 ADD_MONTHS(,120)
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, ADD_MONTHS(e.HIREDATE,120)
FROM EMP e

-- 형변환 함수
-- TO_CHAR() : 숫자, 날짜 데이터 => 문자 데이터 변환
-- TO_NUMBER() : 문자 데이터 => 숫자 데이터 변환
-- TO_DATE() : ANSWKEPDLXJ => 날짜 데이터 변환

SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY/MM/DD')FROM DUAL

SELECT SYSDATE, TO_CHAR(SYSDATE,'MM'),TO_CHAR(SYSDATE,'MON'),TO_CHAR(SYSDATE,'MONTH'),TO_CHAR(SYSDATE,'DD'), TO_CHAR(SYSDATE,'DY'),TO_CHAR(SYSDATE ,'DAY')
FROM DUAL

SELECT SYSDATE, TO_CHAR(SYSDATE,'HH24:MI:SS'),TO_CHAR(SYSDATE,'HH24:MI:SS AM'),TO_CHAR(SYSDATE,'HH24:MI:SS P.M.')
FROM DUAL

SELECT 1300-'1500', '1300'+1500
FROM DUAL

SELECT '1,300'-'1,500', '1,300'+'1,500'
FROM DUAL

SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999')
FROM DUAL

--널처리함수
--NVL(널값,넓일때변경할값), NVL2(널값,널이 아닐때,널일때값)
SELECT e.EMPNO, e.ENAME, e.SAL NVL(E.COMM,0), E.SAL+NVL(E.COMM,0) 
FROM EMP e


SELECT e.EMPNO, e.ENAME, e.SAL NVL2(E.COMM,'O','X'), NVL2(E.COMM,E.SAL*12+E.COMM,E.SAL*12)
FROM EMP e

--입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
--사원이 정직원이 되는 날짜를 YYYY-MM-DD 형식으로 출력 (R-JOB)
--단, 추가수당이 없는 사원의 추가수당은 N/A로 출력(COMM)
-- 사번,이름,고용일
SELECT e.ENPNO,e.ENAME,HIREDATE, TO_CHAR((NEXT_DAY(ADD_MONTHS(E.HIREDATE,3),'월요일'),'YYYY-MM-DD') AS R_JOB NVL(TO_CHAR(E.COMM),'N/A') AS COMM
FROM EMP e


-- MGR을 기준으로 CHG_MGR  칼럼에 출력
--직속상관 번호가 없는 경우 0000
--직속상관 앞 번호가 2자리가 75 5555
--직속상관 앞 번호가 2자리가 76 6666
--직속상관 앞 번호가 2자리가 77 7777
--직속상관 앞 번호가 2자리가 78 8888
--그 외는 본래 직속상관의 사번 그대로 출력

SELECT e.ENPNO,e.ENAME,e.JOB,e.MGR
CASE SUBSTR(TO_CHAR(NVL(E.MGR,0)),1,2)
	WHEN '0' THEN '00000'
	WHEN '75' THEN '5555'
	WHEN '76' THEN '6666'
	WHEN '77' THEN '7777'
	WHEN '78' THEN '8888'
	ELSE TO_CHAR(E.MGR)
END AS CHR_MGR
FROM EMP e


--다중행 함수
--sum(), avg(), count(), max(), min()

--추가 수당 총계
SELECT sum(e.COMM) FROM	EMP e

SELECT SUM(e.SAL) FROM	EMP e

SELECT SUM(e.SAL), SUM(DISTINCT e.SAL), SUM(ALL e.SAL) FROM	EMP e

--개수
SELECT COUNT(e.COMM), count(*),COUNT(e.SAL), COUNT(DISTINCT e.SAL), COUNT(ALL e.SAL) FROM	EMP e

--최대,최소값
SELECT MAX(e.SAL), MIN(e.SAL) FROM	EMP e

--10 번 부서의 최고급여, 최저급여 조회
SELECT MAX(e.SAL), MIN(e.SAL) FROM	EMP e WHERE e.DEPTNO =10

SELECT MAX(e.HIREDATE), MIN(e.HIREDATE) FROM EMP e

--평균
SELECT AVG(e.SAL), AVG(DISTINCT e.SAL), AVG(ALL e.SAL) FROM EMP e

-- Error
SELECT e.DEPTNO, AVG(e.SAL) FROM EMP e 

--부서별 급여 평균 구하기
SELECT e.DEPTNO, AVG(e.SAL) FROM EMP e GROUP BY e.DEPTNO

--부서별, 직책별 급여 평균 구하기
SELECT e.DEPTNO, e.JOB, AVG(e.SAL) FROM EMP e GROUP BY e.DEPTNO, e.JOB ORDER BY e.DEPTNO, e.JOB

--GROUP BY ~~HAVING
-- WHERE 절에 그룹함수 사용 불가
-- WHERE 절과 HAVING 이 존재 시 WHERE 가 먼저 실행 됨
-- HAVING : 만든 그룹을 조건별로 출력할 때 사용

--SQL Error [934] [42000]: ORA-00934: 그룹 함수는 허가되지 않습니다
SELECT e.DEPTNO, e.JOB, AVG(e.SAL) FROM EMP e WHERE AVG(E.SAL) > 200 GROUP BY e.DEPTNO, e.JOB 

-- 부서별, 직책별 급여 평균 구하기 (단, 급여가 2000이상인 평균그룹만 출력)

SELECT e.DEPTNO, e.JOB, AVG(e.SAL) FROM EMP e  GROUP BY e.DEPTNO, e.JOB HAVING AVG(E.SAL) > 2000 ORDER BY e.DEPTNO, e.JOB

-- 급여가 3000 이하인 직원들의 부서별, 직책별 급여 평균 구하기 (단, 급여가 2000이상인 평균그룹만 출력)
SELECT e.DEPTNO, e.JOB, AVG(e.SAL) FROM EMP e WHERE E.SAL <= 3000 GROUP BY e.DEPTNO, e.JOB HAVING AVG(E.SAL) > 2000 ORDER BY e.DEPTNO, e.JOB

--같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력 

--사원들의 입사년도를 기준으로 부서별로 몇명이 입사했는지 출력




--데이터베이스 설계
--데이터를 효율적으로 저장하고 관리하기 위해 테이블의 구조를 미리 정하는 것

--JOIN : 여러 테이블을 하나의 테이블처럼 사용
--1) 내부조인 (INNER JOIN)
--1) 외부조인 (OUTER JOIN)
--  LEFT OUTER JOIN
--  RIGHT OUTER JOIN
--  FULL OUTER JOIN

--같은 컬럼으로 연결 (가장 많이 씀)

SELECT *
FROM EMP e, DEPT d
WHERE e.DEPTNO = D.DEPTNO
ORDER BY e.EMPNO

-- (INNER 생략가능)JOIN ~ON : 내부조인
-- 두개의 테이블에서 일치한 정보를 기준으로 특정 열 가져오기
SELECT  e.EMPNO, E.ENAME, E.DEPTNO, D.DNAME, D.LOC
FROM EMP e JOIN DEPT d
ON e.DEPTNO = D.DEPTNO
ORDER BY e.EMPNO


--비등가 조인
--EMP+SALGRADE
-- SAL 800 => 700~ 1200 => GRADE 추출

SELECT *
FROM EMP e, SALGRADE s 
WHERE e.SAL BETWEEN  S.LOSAL AND S.HISAL
ORDER BY e.EMPNO

SELECT e.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP e INNER JOIN SALGRADE s 
ON e.SAL BETWEEN  S.LOSAL AND S.HISAL
ORDER BY e.EMPNO

-- SELF JOIN 
-- 자체조인
SELECT E.EMPNO,E.ENAME,E.MGR,E2.ENAME
FROM EMP e, EMP e2  
WHERE e.MGR = e2.EMPNO
ORDER BY e.EMPNO

SELECT E.EMPNO,E.ENAME,E.MGR,E2.ENAME
FROM EMP e JOIN EMP e2  
ON e.MGR = e2.EMPNO
ORDER BY e.EMPNO

-- 외부조인
-- LEFT OUTER JOIN(왼쪽 외부 조인)
-- 일치하지 않아도 정보를 가져온다.(단, 왼/오른 테이블 기준)

SELECT E.EMPNO,E.ENAME,E.MGR,E2.ENAME
FROM EMP e, EMP e2  
WHERE e.MGR = e2.EMPNO(+)
ORDER BY e.EMPNO

-- RIGHT (OUTER 생략가능) JOIN
SELECT E.EMPNO,E.ENAME,E.MGR,E2.ENAME
FROM EMP e, EMP e2  
WHERE e.MGR(+) = e2.EMPNO
ORDER BY e.EMPNO

SELECT E.EMPNO,E.ENAME,E.MGR,E2.ENAME
FROM EMP e LEFT OUTER JOIN N EMP e2  
ON e.MGR = e2.EMPNO
ORDER BY e.EMPNO

SELECT E.EMPNO,E.ENAME,E.MGR,E2.ENAME
FROM EMP e FULL JOIN EMP e2  
ON e.MGR = e2.EMPNO
ORDER BY e.EMPNO

-- 사원, 부서 정보 출력 (단, 급여가 2000초과인 사원만)
SELECT  e.EMPNO, E.ENAME, E.DEPTNO, D.DNAME, D.LOC
FROM EMP e JOIN DEPT d
ON e.DEPTNO = D.DEPTNO
WHERE E.SAL > 2000
ORDER BY e.EMPNO

-- 서브쿼리 
-- SELECT
-- FROM EMP e
-- WHERE e.EMPNO = (SELECT e.EMPNO FROM emp e)
-- 왼쪽이 메인쿼리 오른쪽 (서브쿼리)

-- 단일행 서브쿼리 
-- =, >=, <= , [ <>, ^= ,!= ]

-- jonse 의 급여보다 높은 급여를 받는 사원 조회
SELECT * FROM EMP e WHERE E.SAL > (SELECT E2.SAL FROM EMP E2 WHERE E2.ENAME = 'JONES') 

-- WARD 의 입사일보다 빨리 입사한 사원 조회
SELECT * FROM EMP e WHERE E.HIREDATE < (SELECT E2.HIREDATE FROM EMP E2 WHERE E2.ENAME = 'WARD')

--20번 부서에 속한 사원 중 전체 사원의 평균급여보다 높은 급여를 받는 사원 조회
--부서정보(부서명,위치) 조회
SELECT * FROM EMP e JOIN DEPT d ON E.DEPTNO = D.DEPTNO WHERE E.DEPTNO = 20 AND E.SAL > (SELECT AVG(E2.SAL) FROM EMP E2)

--ERROR 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
SELECT * FROM EMP e WHERE E.SAL > (SELECT E2.SAL FROM EMP E2 WHERE E2.JOB = 'MANAGER')






































