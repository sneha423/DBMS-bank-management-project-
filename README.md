
# 🏦 Bank Management System (DBMS Project)

This is a relational database project for a bank management system implemented using SQL. It includes schema design, data population, and stored procedures to manage core banking operations like creating accounts, handling transactions, retrieving balances, and managing customers.

## 📌 Features

- Relational schema modeling core entities: Customers, Accounts, Employees, Transactions, Loans, Cards, Branches
- Stored procedures to deposit, withdraw, create accounts and customers
- Balance checking and logging mechanisms
- Includes sample data and table relationships

## 🧰 Tech Stack

- **Database:** MySQL / Oracle SQL
- **Language:** SQL (DDL, DML, PL/SQL)
- **Tool:** MySQL Workbench or any SQL-compatible IDE

## 📁 Project Structure

```
bank-management-db/
├── projectx.sql               # Full schema, sample data, and procedures
└── README.md                  # This file
```

## 🧱 Key Tables

- `BANK`
- `BRANCH`
- `CUSTOMERX` (renamed to avoid conflicts with reserved words)
- `EMPLOYEE`
- `BANK_ACCOUNT`
- `LOANS`
- `CARD`
- `PAYMENT`
- `TRANSACTION`

## 🔁 Procedures & Functions

- `GET_ACCOUNT_BALANCE(account_no)` — returns the balance of a given account
- `DEPOSIT_TO_ACCOUNT(account_no, amount, mode)` — adds amount to specified account
- `WITHDRAW_FROM_ACCOUNT(account_no, amount, mode, card_no)` — deducts amount using a valid card
- `CREATE_NEW_CUSTOMER(...)` — inserts a new customer record
- `CREATE_NEW_ACCOUNT(...)` — opens a new bank account

## 🏁 How to Run

1. Open **MySQL Workbench** (or your SQL IDE)
2. Load `projectx.sql`
3. Execute the script to:
   - Create all tables
   - Populate them with data
   - Define the required procedures and functions

You can then test transactions or modify the structure as needed.


## 🏷 License

This project is provided for academic purposes under the MIT License or as otherwise specified.
#   D B M S - b a n k - m a n a g e m e n t - p r o j e c t -  
 