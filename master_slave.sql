-- PRINT THE FIRST POSITION OF THE BONLOG FILE OF THE TWO MASTER NODES

SHOW MASTER STATUS;

-- +------------------+----------+--------------+------------------+
-- | File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
-- +------------------+----------+--------------+------------------+
-- | mysql-bin.000002 |      328 |              |                  |
-- +------------------+----------+--------------+------------------+


-- REPLICATOR USER EXAMPLE

CREATE USER 'master'@'%' IDENTIFIED BY '12345';

GRANT REPLICATION SLAVE ON *.* TO 'master'@'%';

FLUSH PRIVILEGES;


-- PRINT THE SECOND POSITION OF THE BINLOG FILE OF THE TWO MASTER NODES

SHOW MASTER STATUS;

-- +------------------+----------+--------------+------------------+
-- | File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
-- +------------------+----------+--------------+------------------+
-- | mysql-bin.000002 |      782 |              |                  |
-- +------------------+----------+--------------+------------------+


-- SLAVE CONFIGURATION EXAMPLE (MASTER_1 TO MASTER_2)

CHANGE MASTER TO
    MASTER_HOST = 'master_2',
    MASTER_USER = 'master',
    MASTER_PASSWORD = '12345',
    MASTER_PORT = 3306,
    MASTER_LOG_FILE = 'mysql-bin.000002',
    MASTER_LOG_POS = 782;

START SLAVE;

SHOW SLAVE STATUS;


-- SLAVE CONFIGURARIO EXAMPLE (MASTER_2 TO MASTER_1)

CHANGE MASTER TO
    MASTER_HOST = 'master_1',
    MASTER_USER = 'master',
    MASTER_PASSWORD = '12345',
    MASTER_PORT = 3306,
    MASTER_LOG_FILE = 'mysql-bin.000002',
    MASTER_LOG_POS = 782;

START SLAVE;

SHOW SLAVE STATUS;

-- DATABASE FOR TESTS EXAMPLE

CREATE DATABASE znuny DEFAULT CHARSET UTF8;

CREATE USER 'znuny'@'%' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON znuny.* TO 'znuny'@'%';

FLUSH PRIVILEGES;


