# DDL - Create
CREATE TABLE countries (
    code INT(3) ,
    name VARCHAR(20) ,
    continent_name VARCHAR(255) NOT NULL , # 1. added not null constraint
    PRIMARY KEY(code),
    CONSTRAINT name UNIQUE (name) # 2. added unique constraint
);


CREATE TABLE users (
    id INT(10) ,
    full_name VARCHAR(20),
    email varchar(20) ,
    gender CHAR(1),
    date_of_birth DATE,
    created_at DATETIME,
    country_code INT(5),

    PRIMARY KEY (id),
    FOREIGN KEY(country_code) REFERENCES countries(code),
    CONSTRAINT email UNIQUE (email), # 1. added unique constraint
    CONSTRAINT gender CHECK (`gender` = 'm' or `gender` = 'f') # 2. added check constraint
);


CREATE TABLE orders (
    id INT(10) ,
    user_id INT(10) ,
    status varchar(6) ,
    created_at DATETIME,

    PRIMARY KEY (id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT status CHECK ( status = 'start' or status = 'finish' ) # 1. added check constraint
);


CREATE TABLE order_products (
    order_id INT(10) ,
    product_id INT(10) ,
    quantity INT DEFAULT 0, # 1. added default value
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);


CREATE TABLE products (
    id INT(10) ,
    name VARCHAR(10) NOT NULL , # 1. added not null constraint
    price INT DEFAULT 0, # 2. added default value
    status VARCHAR(10) ,
    created_at DATETIME DEFAULT CURRENT_DATE,
    PRIMARY KEY(id),
    CONSTRAINT status CHECK ( status = 'valid' or status = 'expired') # 3. added check constraint
);


# DML - Insert
INSERT INTO countries VALUES (966,'Saudi Arabia','Eroupe');
INSERT INTO countries VALUES (1,'America','America');

INSERT INTO users VALUES (123876541, 'Rayan Zeyd Jowair', 'rayan@gmail.com', 'm', '1999-12-12' , CURRENT_DATE, 966);
INSERT INTO users VALUES (123876550, 'Sara jacson', 'sara.j@gmail.com', 'f', '1995-6-24' , CURRENT_DATE, 1);

INSERT INTO orders VALUES (1010151520,123876541,'start',CURRENT_DATE);
INSERT INTO orders VALUES (1010151530,123876550,'finish',CURRENT_DATE);

INSERT INTO products VALUES (500121224,'$50 PSN', 50, 'valid',CURRENT_DATE);
INSERT INTO products VALUES (500121225,'$20 PSN', 20,'valid',CURRENT_DATE);
INSERT INTO products VALUES (500121226,'$10 PSN', 10,'valid',CURRENT_DATE);
INSERT INTO products VALUES (500121227,'$5 PSN', 5,'expired',CURRENT_DATE);

INSERT INTO order_products VALUES (1010151520, 500121224,1);
INSERT INTO order_products VALUES (1010151530, 500121226,1);

# DML - Select
Select * FROM countries;
Select * FROM users;
Select * FROM products;
Select * FROM orders;
Select * FROM order_products;

# DML - Update
UPDATE countries SET continent_name='Asia' WHERE code='966';

# DML - Delete
DELETE FROM products WHERE id=500121227;