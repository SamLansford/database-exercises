USE bank_db;
drop table if exists transactions;
create table transactions(
    id                     INT UNSIGNED NOT NULL AUTO_INCREMENT,
    date                   DATE,
    description            VARCHAR(100),
    memo                   TEXT,
    amount                 DECIMAL(10, 2) NOT NULL,
    transaction_successful BOOLEAN,
    PRIMARY KEY (id)
);