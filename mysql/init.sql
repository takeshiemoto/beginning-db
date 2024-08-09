-- 担当者テーブルの作成
CREATE TABLE agents
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(100),
    phone      VARCHAR(15)
);

-- 自動車メーカーのマスターテーブルの作成
CREATE TABLE car_makers
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 車のテーブルの作成
CREATE TABLE cars
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    maker_id INT,
    model    VARCHAR(50),
    year     INT,
    price    INT,
    FOREIGN KEY (maker_id) REFERENCES car_makers (id)
);

-- 顧客テーブルの作成
CREATE TABLE customers
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(100),
    phone      VARCHAR(15),
    address    VARCHAR(255)
);

-- 販売実績テーブルの作成
CREATE TABLE sales
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    car_id      INT,
    agent_id    INT,
    sale_date   DATE,
    sale_price  INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id),
    FOREIGN KEY (car_id) REFERENCES cars (id),
    FOREIGN KEY (agent_id) REFERENCES agents (id)
);

-- メンテナンス履歴（来店）テーブルの作成 
CREATE TABLE maintenance
(
    id               INT AUTO_INCREMENT PRIMARY KEY,
    customer_id      INT,
    car_id           INT,
    maintenance_date DATE,
    details          TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers (id),
    FOREIGN KEY (car_id) REFERENCES cars (id)
);
