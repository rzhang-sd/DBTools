/* remove duplciate records from table

the idea is 

DELETE FROM 
   table_name A
   WHERE 
     a.rowid > 
        ANY (
	  SELECT 
	     B.rowid
	  FROM 
             table_name B
	  WHERE 
	     A.col1 = B.col1
	  AND 
             A.col2 = B.col2
             );

*/

delete from roi_track where rowid in (

    with orders as (select rowid, tracked_id, mes_cont_id, amount, orderid, purchase_date, TO_CHAR( purchase_date, 'YYYY-MM-DD HH24:MI:SS'), time_processed from roi_track where tracked_id in 
        (select tracked_id from CLICK_THROUGH_URL c inner join message m on c.mess_id = m.mess_id where m.client_id = 66292 and mdate between to_date('2013-04-01', 'YYYY-MM-DD') and to_date('2013-04-30', 'YYYY-MM-DD')) order by roi_track.PURCHASE_DATE, roi_track.ORDERID)
    select rowid from orders A where a.rowid > ANY (select b.rowid from orders B where A.tracked_id = B.tracked_id and A.orderid = B.orderid and A.mes_cont_id = B.mes_cont_id and A.amount = B.amount and A.purchase_date = B.purchase_date)
);
