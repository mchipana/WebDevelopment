SELECT GB.PERIOD_YEAR, GB.PERIOD_NUM,GCC.SEGMENT1,GCC.SEGMENT2, GB.PERIOD_NAME 
      ,SUM(GB.PERIOD_NET_DR) DR
      ,SUM(GB.PERIOD_NET_CR) CR
      ,SUM(GB.PERIOD_NET_DR - GB.PERIOD_NET_CR) DR_CR 
  FROM APPS.GL_BALANCES GB
      ,APPS.GL_CODE_COMBINATIONS GCC
WHERE GB.CODE_COMBINATION_ID = GCC.CODE_COMBINATION_ID
  AND ACTUAL_FLAG = 'A'
  AND PERIOD_YEAR=2010-- IN ( '2009')
  AND GCC.SEGMENT1 = '00'
  AND GB.PERIOD_NUM IN (1,2) --IN( 11,12)
GROUP BY GCC.SEGMENT1,GCC.SEGMENT2,GB.PERIOD_YEAR, GB.PERIOD_NUM, GB.PERIOD_NAME
--HAVING SUM(GB.PERIOD_NET_DR - GB.PERIOD_NET_CR) <> 0
ORDER BY GB.PERIOD_YEAR, GB.PERIOD_NUM, GCC.SEGMENT1,GCC.SEGMENT2 ASC


SELECT GB.PERIOD_YEAR, GB.PERIOD_NUM,GCC.SEGMENT1, GB.PERIOD_NAME 
      ,SUM(GB.PERIOD_NET_DR) DR
      ,SUM(GB.PERIOD_NET_CR) CR
      ,SUM(GB.PERIOD_NET_DR - GB.PERIOD_NET_CR) DR_CR 
  FROM APPS.GL_BALANCES GB
      ,APPS.GL_CODE_COMBINATIONS GCC
WHERE GB.CODE_COMBINATION_ID = GCC.CODE_COMBINATION_ID
  AND ACTUAL_FLAG = 'A'
  AND PERIOD_YEAR=2010-- IN ( '2009')
  AND GCC.SEGMENT1 = '00'
 -- AND GB.PERIOD_NUM IN (1,2) --IN( 11,12)
GROUP BY GCC.SEGMENT1,GB.PERIOD_YEAR, GB.PERIOD_NUM, GB.PERIOD_NAME
--HAVING SUM(GB.PERIOD_NET_DR - GB.PERIOD_NET_CR) <> 0
ORDER BY GB.PERIOD_YEAR, GB.PERIOD_NUM, GCC.SEGMENT1 ASC


SELECT DISTINCT  GB.PERIOD_YEAR, GB.PERIOD_NUM,GCC.SEGMENT1,GB.PERIOD_NAME 
  FROM APPS.GL_BALANCES GB
      ,APPS.GL_CODE_COMBINATIONS GCC
WHERE GB.CODE_COMBINATION_ID = GCC.CODE_COMBINATION_ID
  AND ACTUAL_FLAG = 'A'
  AND PERIOD_YEAR IN ( '2009')
  AND GCC.SEGMENT1 = '00'
--  AND GB.PERIOD_NUM = 11 


select *
  from APPS.GL_CODE_COMBINATIONS GCC
 WHERE GCC.SEGMENT1 = '00'
 
 SELECT * FROM GL_BALANCES GB