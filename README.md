For Mysql/MariaDB, use mysqldump to export/import data, for example: 

mysqldump, mysql can be copied from MySQLWrokBench folder. 

Export data from a table: 
./mysqldump -P 3306 -h <HOST> -u <userId> -p <password> <TABLENAME> > <tablename>.sql

Import data into a table:
./mysql -u <userId> -p -h <HOST> -P 3306 -D <Database> < ./<tablename>.sql
