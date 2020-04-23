/* this sql can be executed from command line or from SQLPlus
Connect to oracle DB via sqlPlus: 

/usr/lib/oracle/12.1/client64/bin/sqlplus '$userid/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=$hostname)(Port=$port))(CONNECT_DATA=(SID=$sid)))'

/usr/lib/oracle/12.1/client64/bin/sqlplus '$userid/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=$hostname)(Port=$port))(CONNECT_DATA=(SERVICE_NAME=$service_name)))' */


set head off; /* turn off head line */
set feed off;
set trimspool on;
set linesize 100;
set pagesize 32767;
set echo off;
set termout off;

spool output.csv;  /* specify the export file inside current path, the result of following query will be stored in the file */

select 'Email' from dual; /* This can be customized head line*/

/* The requery to create the report*/

select email from emtadmin_e3.contacts where client_id = 67085 and contact_id in (select contact_id from emtadmin_e3.contactgroups where client_id = 67085 and group_id = 4322662);

spool off;
exit;


