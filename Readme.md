# W07-D01-HW

## Store Database Diagram

![database Diagram](store.svg "Store Tables Diagram")

## The database content

### Countries Table

| code | name         | continent_name |
| :--- | :----------- | :------------- |
| 1    | America      | America        |
| 966  | Saudi Arabia | Eroupe         |

### Users Table

| id        | full_name         | email            | gender | date_of_birth | created_at          | country_code |
| :-------- | :---------------- | :--------------- | :----- | :------------ | :------------------ | :----------- |
| 123876541 | Rayan Zeyd Jowair | rayan@gmail.com  | m      | 1999-12-12    | 2023-02-27 00:00:00 | 966          |
| 123876550 | Sara jacson       | sara.j@gmail.com | f      | 1995-06-24    | 2023-02-27 00:00:00 | 1            |

### Products Table

| id        | name    | price | status  | created_at          |
| :-------- | :------ | :---- | :------ | :------------------ |
| 500121224 | $50 PSN | 50    | valid   | 2023-02-27 00:00:00 |
| 500121225 | $20 PSN | 20    | valid   | 2023-02-27 00:00:00 |
| 500121226 | $10 PSN | 10    | valid   | 2023-02-27 00:00:00 |
| 500121227 | $5 PSN  | 5     | expired | 2023-02-27 00:00:00 |

### Orders Table

| id         | user_id   | status | created_at          |
| :--------- | :-------- | :----- | :------------------ |
| 1010151520 | 123876541 | start  | 2023-02-27 00:00:00 |
| 1010151530 | 123876550 | finish | 2023-02-27 00:00:00 |

### Order_Products Table

| order_id   | product_id | quantity |
| :--------- | :--------- | :------- |
| 1010151520 | 500121224  | 1        |
| 1010151530 | 500121226  | 1        |

---

# Update Countries Table

```sql
UPDATE countries SET continent_name='Asia' WHERE code='966';
```

### Before updating

| code | name         | continent_name |
| :--- | :----------- | :------------- |
| 1    | America      | America        |
| 966  | Saudi Arabia | Eroupe         |

### After updating

| code | name         | continent_name |
| :--- | :----------- | :------------- |
| 1    | America      | America        |
| 966  | Saudi Arabia | **Asia**       |

# Delete From Products Table

```sql
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM products WHERE id=500121227;
SET FOREIGN_KEY_CHECKS=1;
```

### Before deleting

| id        | name    | price | status  | created_at          |
| :-------- | :------ | :---- | :------ | :------------------ |
| 500121224 | $50 PSN | 50    | valid   | 2023-02-27 00:00:00 |
| 500121225 | $20 PSN | 20    | valid   | 2023-02-27 00:00:00 |
| 500121226 | $10 PSN | 10    | valid   | 2023-02-27 00:00:00 |
| 500121227 | $5 PSN  | 5     | expired | 2023-02-27 00:00:00 |

### After deleting

| id        | name    | price | status | created_at          |
| :-------- | :------ | :---- | :----- | :------------------ |
| 500121224 | $50 PSN | 50    | valid  | 2023-02-27 00:00:00 |
| 500121225 | $20 PSN | 20    | valid  | 2023-02-27 00:00:00 |
| 500121226 | $10 PSN | 10    | valid  | 2023-02-27 00:00:00 |
