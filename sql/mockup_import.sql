-- cursor
SELECT gb.period_year, gb.period_num,gcc.segment1, gb.ledger_id, gb.period_name
       , SUM(gb.period_net_dr) dr
       , SUM(gb.period_net_cr) cr
       , SUM(gb.period_net_dr - gb.period_net_cr) dr_cr 
    FROM apps.gl_balances          gb
       , apps.gl_code_combinations gcc
   WHERE gb.code_combination_id = gcc.code_combination_id
     AND gb.actual_flag         = 'A'
     AND gb.period_year         = 2010 --p_period_year
     AND gcc.segment1           = '01'
    AND gb.ledger_id            = 4001
    and GB.CURRENCY_CODE = 'ARS'
  GROUP BY gcc.segment1,gb.period_year, gb.period_num, gb.period_name, gb.ledger_id--, gcc.code_combination_id
  ORDER BY gb.period_year, gb.period_num, gcc.segment1 ASC;
  ´
  
 --validacion
SELECT gs.period_name, fa.APPLICATION_ID,
       fa.application_name,
       gs.closing_status,
       DECODE (gs.closing_status,
               'C', 'Closed',
               'O', 'Open',
               'F', 'Future',
               'W', 'Closed Pending',
               'N', 'Never Opened',
               'P', 'Permanently Closed') PERIOD_CLOSING_STATUS
  FROM gl.gl_period_statuses   gs
     , apps.fnd_application_tl fa
 WHERE fa.application_id    = gs.application_id
   --AND fa.application_name IN ('Payables', 'Receivables', 'General Ledger')
   AND FA.APPLICATION_ID = 101
   AND gs.set_of_books_id   = 4001 --:set_of_books_d        -- your set of books id
   AND gs.period_name      IN ('JUL-09')    -- Period Name/s for which you want to check
   AND closing_status      IN ('O','W','C')
GROUP BY Period_name, fa.APPLICATION_ID,application_name, gs.closing_status
ORDER BY Period_name DESC



http://www.itpub.net/thread-1826304-1-1.html