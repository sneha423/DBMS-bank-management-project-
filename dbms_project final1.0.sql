


-- 1. Create BANK Table
CREATE TABLE BANK (
    B_Code VARCHAR2(10) PRIMARY KEY,
    City VARCHAR2(50) NOT NULL,
    B_Name VARCHAR2(100) NOT NULL,
    Address VARCHAR2(255)
);

-- 2. Create BRANCH Table
CREATE TABLE BRANCH (
    Branch_code VARCHAR2(10) PRIMARY KEY,
    Branch_name VARCHAR2(100) NOT NULL,
    Address VARCHAR2(255),
    B_Code VARCHAR2(10) NOT NULL,
    FOREIGN KEY (B_Code) REFERENCES BANK(B_Code)
);

-- 3. Create CUSTOMERX Table 
CREATE TABLE CUSTOMERX (
    C_ID VARCHAR2(10) PRIMARY KEY,
    Customerx VARCHAR2(100) NOT NULL,
    Address VARCHAR2(255),
    Mobile_No VARCHAR2(15) UNIQUE
);

-- 4. Create EMPLOYEE Table
CREATE TABLE EMPLOYEE (
    E_ID VARCHAR2(10) PRIMARY KEY,
    E_Name VARCHAR2(100) NOT NULL,
    Position VARCHAR2(50),
    Salary NUMBER(10, 2),
    Hire_Date DATE,
    Branch_code VARCHAR2(10) NOT NULL,
    Mobile_No VARCHAR2(15) UNIQUE,
    FOREIGN KEY (Branch_code) REFERENCES BRANCH(Branch_code)
);

-- 5. Create BANK_ACCOUNT Table
CREATE TABLE BANK_ACCOUNT (
    Account_No VARCHAR2(20) PRIMARY KEY,
    Balance NUMBER(15, 2) DEFAULT 0 CHECK (Balance >= 0),
    Branch_code VARCHAR2(10) NOT NULL,
    C_ID VARCHAR2(10) NOT NULL,
    Account_Type VARCHAR2(20) CHECK (Account_Type IN ('Saving', 'Current', 'Fixed Deposit')),
    FOREIGN KEY (Branch_code) REFERENCES BRANCH(Branch_code),
    FOREIGN KEY (C_ID) REFERENCES CUSTOMERX(C_ID) 
);

-- 6. Create LOANS Table
CREATE TABLE LOANS (
    Loan_No VARCHAR2(10) PRIMARY KEY,
    Amount NUMBER(15, 2) NOT NULL CHECK (Amount > 0),
    Interest_Rate NUMBER(5, 4) NOT NULL CHECK (Interest_Rate > 0),
    C_ID VARCHAR2(10) NOT NULL,
    E_ID VARCHAR2(10), 
    FOREIGN KEY (C_ID) REFERENCES CUSTOMERX(C_ID), 
    FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID)
);

-- 7. Create PAYMENT Table
CREATE TABLE PAYMENT (
    P_Account VARCHAR2(20),
    P_Date DATE,
    Loan_No VARCHAR2(10) NOT NULL,
    Amount NUMBER(15, 2) NOT NULL CHECK (Amount > 0),
    PRIMARY KEY (P_Account, P_Date), 
    FOREIGN KEY (P_Account) REFERENCES BANK_ACCOUNT(Account_No),
    FOREIGN KEY (Loan_No) REFERENCES LOANS(Loan_No)
);

-- 8. Create CARD Table
CREATE TABLE CARD (
    Card_No VARCHAR2(20) PRIMARY KEY,
    Card_Type VARCHAR2(20) CHECK (Card_Type IN ('Debit Card', 'Credit Card', 'Prepaid')),
    C_ID VARCHAR2(10) NOT NULL,
    FOREIGN KEY (C_ID) REFERENCES CUSTOMERX(C_ID) 
);

-- 9. Create TRANSACTION Table
CREATE TABLE TRANSACTION (
    T_ID VARCHAR2(20) PRIMARY KEY,
    Account_No VARCHAR2(20) NOT NULL,
    T_Date DATE NOT NULL,
    Amount NUMBER(15, 2) NOT NULL CHECK (Amount >= 0),
    Modex VARCHAR2(50),
    Status VARCHAR2(20) CHECK (Status IN ('success', 'failed', 'pending')),
    Card_No VARCHAR2(20),
    FOREIGN KEY (Account_No) REFERENCES BANK_ACCOUNT(Account_No),
    FOREIGN KEY (Card_No) REFERENCES CARD(Card_No)
);
DROP TABLE TRANSACTION;
DROP TABLE PAYMENT;
DROP TABLE CARD;
DROP TABLE LOANS;
DROP TABLE BANK_ACCOUNT;
DROP TABLE EMPLOYEE;
DROP TABLE CUSTOMERX; 
DROP TABLE BRANCH;
DROP TABLE BANK;

-- Insert into BANK
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B101', 'Patiala', 'State Bank', 'Near Bus Stand, Patiala');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B102', 'Chandigarh', 'Punjab Bank', 'Sector 17, Chandigarh');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B103', 'Ludhiana', 'Central Bank', 'Civil Lines, Ludhiana');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B104', 'Amritsar', 'Union Bank', 'Hall Bazaar, Amritsar');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B105', 'Patiala', 'Axis Bank', 'Mall Road, Patiala');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B106', 'Jalandhar', 'HDFC Bank', 'Model Town, Jalandhar');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B107', 'Chandigarh', 'ICICI Bank', 'Sector 9, Chandigarh');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B108', 'Ludhiana', 'PNB Bank', 'Sarabha Nagar, Ludhiana');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B109', 'Amritsar', 'Bank of India', 'Lawrence Road, Amritsar');
INSERT INTO BANK (B_Code, City, B_Name, Address) VALUES ('B110', 'Patiala', 'Canara Bank', 'Adalat Bazaar, Patiala');

-- Insert into BRANCH
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR001', 'Patiala Main', 'The Mall, Patiala', 'B101');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR002', 'CHD Sector 17', 'Sector 17 Market, Chandigarh', 'B102');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR003', 'LDH Civil Lines', 'Civil Lines Area, Ludhiana', 'B103');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR004', 'ASR Hall Gate', 'Hall Bazaar Entry, Amritsar', 'B104');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR005', 'PTL Model Town', 'Model Town Extension, Patiala', 'B105');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR006', 'JAL City', 'Near Railway Station, Jalandhar', 'B106');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR007', 'CHD Sector 11', 'Sector 11 Inner Road, Chandigarh', 'B107');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR008', 'LDH Sarabha', 'Sarabha Nagar Market, Ludhiana', 'B108');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR009', 'ASR Golden', 'Golden Temple Road, Amritsar', 'B109');
INSERT INTO BRANCH (Branch_code, Branch_name, Address, B_Code) VALUES ('BR010', 'PTL Adalat', 'Inside Adalat Bazaar, Patiala', 'B110');

-- Insert into CUSTOMERX -- Changed from CUSTOMER to CUSTOMERX
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST01', 'Aman Singh', '123 Green Avenue, Patiala', '9876543210');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST02', 'Priya Verma', 'H.No. 45, Sector 18, Chandigarh', '8765432109');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST03', 'Rohan Gill', '56 Link Road, Ludhiana', '7654321098');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST04', 'Simran Kaur', '78 Mall Road, Amritsar', '6543210987');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST05', 'Vivek Sharma', '90 Rose Lane, Patiala', '5432109876');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST06', 'Neha Gupta', '21 Model Town, Jalandhar', '4321098765');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST07', 'Arjun Mehra', '34 Sector 10, Chandigarh', '3210987654');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST08', 'Sneha Rani', '67 Ferozepur Road, Ludhiana', '2109876543');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST09', 'Tarun Bajaj', '89 Circular Road, Amritsar', '1098765432');
INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No) VALUES ('CUST10', 'Anjali Devi', '101 New Colony, Patiala', '9012345678');

-- Insert into EMPLOYEE
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP001', 'Rajesh Kumar', 'Manager', 50000, TO_DATE('2020-08-15', 'YYYY-MM-DD'), 'BR001', '9988776655');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP002', 'Seema Verma', 'Clerk', 25000, TO_DATE('2021-01-20', 'YYYY-MM-DD'), 'BR002', '8899776655');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP003', 'Harpreet Singh', 'Accountant', 35000, TO_DATE('2022-05-10', 'YYYY-MM-DD'), 'BR003', '7788996655');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP004', 'Priya Sharma', 'Loan Officer', 40000, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'BR004', '6677889955');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP005', 'Amit Patel', 'Branch Manager', 55000, TO_DATE('2019-11-22', 'YYYY-MM-DD'), 'BR005', '5566778899');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP006', 'Kiran Bedi', 'Teller', 22000, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'BR006', '4455667788');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP007', 'Sanjay Gupta', 'Assistant Manager', 45000, TO_DATE('2021-09-18', 'YYYY-MM-DD'), 'BR007', '3344556677');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP008', 'Ritu Singh', 'Cashier', 28000, TO_DATE('2022-12-05', 'YYYY-MM-DD'), 'BR008', '2233445566');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP009', 'Vikas Khanna', 'IT Officer', 48000, TO_DATE('2023-06-25', 'YYYY-MM-DD'), 'BR009', '1122334455');
INSERT INTO EMPLOYEE (E_ID, E_Name, Position, Salary, Hire_Date, Branch_code, Mobile_No) VALUES ('EMP010', 'Pooja Joshi', 'Customer Service', 30000, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'BR010', '9182736450');

-- Insert into BANK_ACCOUNT
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1001', 15000, 'BR001', 'CUST01', 'Saving');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1002', 250000, 'BR002', 'CUST02', 'Current');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1003', 7500, 'BR003', 'CUST03', 'Saving');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1004', 120000, 'BR004', 'CUST04', 'Current');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1005', 50000, 'BR005', 'CUST05', 'Saving');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1006', 300000, 'BR006', 'CUST06', 'Current');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1007', 9000, 'BR007', 'CUST07', 'Saving');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1008', 180000, 'BR008', 'CUST08', 'Current');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1009', 60000, 'BR009', 'CUST09', 'Saving');
INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type) VALUES ('ACC1010', 220000, 'BR010', 'CUST10', 'Current');

-- Insert into LOANS
-- Assigning EMP004 (Loan Officer) to all loans for sample data
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2001', 50000, 0.10, 'CUST01', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2002', 150000, 0.12, 'CUST03', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2003', 75000, 0.09, 'CUST05', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2004', 200000, 0.11, 'CUST07', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2005', 100000, 0.105, 'CUST09', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2006', 60000, 0.13, 'CUST02', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2007', 180000, 0.115, 'CUST04', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2008', 90000, 0.095, 'CUST06', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2009', 250000, 0.125, 'CUST08', 'EMP004');
INSERT INTO LOANS (Loan_No, Amount, Interest_Rate, C_ID, E_ID) VALUES ('LN2010', 120000, 0.10, 'CUST10', 'EMP004');

-- Insert into PAYMENT
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1001', TO_DATE('2025-05-10', 'YYYY-MM-DD'), 'LN2001', 5000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1003', TO_DATE('2025-05-12', 'YYYY-MM-DD'), 'LN2002', 15000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1005', TO_DATE('2025-05-15', 'YYYY-MM-DD'), 'LN2003', 7500);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1007', TO_DATE('2025-05-08', 'YYYY-MM-DD'), 'LN2004', 20000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1009', TO_DATE('2025-05-11', 'YYYY-MM-DD'), 'LN2005', 10000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1002', TO_DATE('2025-05-13', 'YYYY-MM-DD'), 'LN2006', 6000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1004', TO_DATE('2025-05-16', 'YYYY-MM-DD'), 'LN2007', 18000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1006', TO_DATE('2025-05-09', 'YYYY-MM-DD'), 'LN2008', 9000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1008', TO_DATE('2025-05-14', 'YYYY-MM-DD'), 'LN2009', 25000);
INSERT INTO PAYMENT (P_Account, P_Date, Loan_No, Amount) VALUES ('ACC1010', TO_DATE('2025-05-17', 'YYYY-MM-DD'), 'LN2010', 12000);

-- Insert into CARD
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD001', 'Debit Card', 'CUST01');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD002', 'Credit Card', 'CUST02');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD003', 'Prepaid', 'CUST03');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD004', 'Debit Card', 'CUST04');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD005', 'Credit Card', 'CUST05');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD006', 'Prepaid', 'CUST06');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD007', 'Debit Card', 'CUST07');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD008', 'Credit Card', 'CUST08');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD009', 'Prepaid', 'CUST09');
INSERT INTO CARD (Card_No, Card_Type, C_ID) VALUES ('CARD010', 'Debit Card', 'CUST10');

-- Insert into TRANSACTION
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS001', 'ACC1001', TO_DATE('2025-05-16', 'YYYY-MM-DD'), 500, 'ATM', 'success', 'CARD001');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS002', 'ACC1002', TO_DATE('2025-05-16', 'YYYY-MM-DD'), 1000, 'Online Banking', 'success', 'CARD002');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS003', 'ACC1003', TO_DATE('2025-05-15', 'YYYY-MM-DD'), 200, 'POS', 'success', 'CARD003');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS004', 'ACC1004', TO_DATE('2025-05-15', 'YYYY-MM-DD'), 1500, 'ATM', 'success', 'CARD004');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS005', 'ACC1005', TO_DATE('2025-05-14', 'YYYY-MM-DD'), 750, 'Online Banking', 'success', 'CARD005');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS006', 'ACC1006', TO_DATE('2025-05-14', 'YYYY-MM-DD'), 300, 'POS', 'failed', 'CARD006');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS007', 'ACC1007', TO_DATE('2025-05-13', 'YYYY-MM-DD'), 1200, 'ATM', 'success', 'CARD007');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS008', 'ACC1008', TO_DATE('2025-05-13', 'YYYY-MM-DD'), 900, 'Online Banking', 'pending', 'CARD008');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS009', 'ACC1009', TO_DATE('2025-05-12', 'YYYY-MM-DD'), 400, 'POS', 'success', 'CARD009');
INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No) VALUES ('TRANS010', 'ACC1010', TO_DATE('2025-05-12', 'YYYY-MM-DD'), 1800, 'ATM', 'success', 'CARD010');

COMMIT;
-- PL/SQL Functions and Procedures for Bank Database

-- 1. Function to get Account Balance

CREATE OR REPLACE FUNCTION GET_ACCOUNT_BALANCE (
    p_account_no IN VARCHAR2
)
RETURN NUMBER
IS
    v_balance NUMBER(15, 2);
BEGIN
    SELECT Balance
    INTO v_balance
    FROM BANK_ACCOUNT
    WHERE Account_No = p_account_no;

    -- Return the retrieved balance
    RETURN v_balance;

EXCEPTION
    WHEN NO_DATA_FOUND THENaq
        DBMS_OUTPUT.PUT_LINE('Error: Account number ' || p_account_no || ' not found.');
        RETURN NULL; 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RAISE; 
END GET_ACCOUNT_BALANCE;
/

-- 2. Procedure for Deposit
CREATE OR REPLACE PROCEDURE DEPOSIT_TO_ACCOUNT (
    p_account_no IN VARCHAR2,
    p_amount IN NUMBER,
    p_mode IN VARCHAR2
)
IS
    v_current_balance NUMBER(15, 2);
    v_t_id VARCHAR2(20);
BEGIN
    IF p_amount <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Deposit amount must be positive.');
        RETURN;
    END IF;
    SELECT Balance INTO v_current_balance
    FROM BANK_ACCOUNT
    WHERE Account_No = p_account_no
    FOR UPDATE OF Balance; 
    UPDATE BANK_ACCOUNT
    SET Balance = Balance + p_amount
    WHERE Account_No = p_account_no;
    SELECT 'TRANS' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') || DBMS_RANDOM.STRING('U', 5) INTO v_t_id FROM dual;
    INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status)
    VALUES (v_t_id, p_account_no, SYSDATE, p_amount, p_mode, 'success');
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Deposit of ' || p_amount || ' to account ' || p_account_no || ' successful.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Account number ' || p_account_no || ' not found.');
        ROLLBACK; 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during deposit: ' || SQLERRM);
        ROLLBACK; 
        RAISE; -
END DEPOSIT_TO_ACCOUNT;
/

-- 3. Procedure for Withdrawal
CREATE OR REPLACE PROCEDURE WITHDRAW_FROM_ACCOUNT (
    p_account_no IN VARCHAR2,
    p_amount IN NUMBER,
    p_mode IN VARCHAR2,
    p_card_no IN VARCHAR2 DEFAULT NULL 
)
IS
    v_current_balance NUMBER(15, 2);
    v_t_id VARCHAR2(20);
BEGIN
    IF p_amount <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Withdrawal amount must be positive.');
        RETURN;
    END IF;
    SELECT Balance INTO v_current_balance
    FROM BANK_ACCOUNT
    WHERE Account_No = p_account_no
    FOR UPDATE OF Balance; 
    IF v_current_balance < p_amount THEN
        DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds in account ' || p_account_no);
         SELECT 'TRANS' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') || DBMS_RANDOM.STRING('U', 5) INTO v_t_id FROM dual;
         INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No)
         VALUES (v_t_id, p_account_no, SYSDATE, p_amount, p_mode, 'failed', p_card_no);
         COMMIT;
        RETURN;
    END IF;
    UPDATE BANK_ACCOUNT
    SET Balance = Balance - p_amount
    WHERE Account_No = p_account_no;
    SELECT 'TRANS' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') || DBMS_RANDOM.STRING('U', 5) INTO v_t_id FROM dual;
    INSERT INTO TRANSACTION (T_ID, Account_No, T_Date, Amount, Modex, Status, Card_No)
    VALUES (v_t_id, p_account_no, SYSDATE, p_amount, p_mode, 'success', p_card_no);
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Withdrawal of ' || p_amount || ' from account ' || p_account_no || ' successful.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Account number ' || p_account_no || ' not found.');
        ROLLBACK; 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during withdrawal: ' || SQLERRM);
        ROLLBACK; 
        RAISE; 
END WITHDRAW_FROM_ACCOUNT;
/

-- 4. Procedure to Create a New Customer
CREATE OR REPLACE PROCEDURE CREATE_NEW_CUSTOMER (
    p_c_id IN VARCHAR2,
    p_customerx_name IN VARCHAR2,
    p_address IN VARCHAR2,
    p_mobile_no IN VARCHAR2
)
IS
BEGIN
    INSERT INTO CUSTOMERX (C_ID, Customerx, Address, Mobile_No)
    VALUES (p_c_id, p_customerx_name, p_address, p_mobile_no);
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('New customer ' || p_customerx_name || ' with ID ' || p_c_id || ' created successfully.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Customer ID or Mobile Number already exists.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during customer creation: ' || SQLERRM);
        ROLLBACK;
        RAISE;
END CREATE_NEW_CUSTOMER;
/

-- 5. Procedure to Create a New Bank Account
CREATE OR REPLACE PROCEDURE CREATE_NEW_ACCOUNT (
    p_account_no IN VARCHAR2,
    p_branch_code IN VARCHAR2,
    p_c_id IN VARCHAR2,
    p_account_type IN VARCHAR2
)
IS
    v_customer_exists NUMBER;
    v_branch_exists NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_customer_exists
    FROM CUSTOMERX
    WHERE C_ID = p_c_id;

    IF v_customer_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Customer with ID ' || p_c_id || ' does not exist.');
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO v_branch_exists
    FROM BRANCH
    WHERE Branch_code = p_branch_code;

    IF v_branch_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Branch with code ' || p_branch_code || ' does not exist.');
        RETURN;
    END IF;
    INSERT INTO BANK_ACCOUNT (Account_No, Balance, Branch_code, C_ID, Account_Type)
    VALUES (p_account_no, 0, p_branch_code, p_c_id, p_account_type); 
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('New account ' || p_account_no || ' created successfully for customer ' || p_c_id || ' at branch ' || p_branch_code);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Account number ' || p_account_no || ' already exists.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during account creation: ' || SQLERRM);
        ROLLBACK;
        RAISE;
END CREATE_NEW_ACCOUNT;
/
-- Trigger to update the account balance after a transaction is inserted

CREATE OR REPLACE TRIGGER TRG_UPDATE_ACCOUNT_BALANCE
AFTER INSERT ON TRANSACTION
FOR EACH ROW
WHEN (NEW.Status = 'success') 
DECLARE
    v_account_type VARCHAR2(20);
BEGIN
    SELECT Account_Type
    INTO v_account_type
    FROM BANK_ACCOUNT
    WHERE Account_No = :NEW.Account_No; 

    IF :NEW.Amount > 0 THEN
        UPDATE BANK_ACCOUNT
        SET Balance = Balance + :NEW.Amount
        WHERE Account_No = :NEW.Account_No;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error in trigger: Account ' || :NEW.Account_No || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in trigger: ' || SQLERRM);
        RAISE_APPLICATION_ERROR(-20001, 'Error updating account balance: ' || SQLERRM);
END TRG_UPDATE_ACCOUNT_BALANCE;
/



-- Trigger to prevent withdrawal if account balance is insufficient

CREATE OR REPLACE TRIGGER TRG_PREVENT_INSUFFICIENT_WITHDRAWAL
BEFORE INSERT ON TRANSACTION
FOR EACH ROW
WHEN (NEW.Modex = 'Withdrawal')
DECLARE
    v_current_balance BANK_ACCOUNT.Balance%TYPE;
BEGIN
    SELECT Balance
    INTO v_current_balance
    FROM BANK_ACCOUNT
    WHERE Account_No = :NEW.Account_No; 
    IF v_current_balance < :NEW.Amount THEN
        RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds for withdrawal from account ' || :NEW.Account_No);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Account number ' || :NEW.Account_No || ' not found for withdrawal.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'An unexpected error occurred during withdrawal check: ' || SQLERRM);
END TRG_PREVENT_INSUFFICIENT_WITHDRAWAL;
/
-- PL/SQL block using a cursor to apply interest to savings accounts

DECLARE
    CURSOR savings_accounts_cur IS
        SELECT Account_No, Balance
        FROM BANK_ACCOUNT
        WHERE Account_Type = 'Saving';
    v_account_no BANK_ACCOUNT.Account_No%TYPE;
    v_balance BANK_ACCOUNT.Balance%TYPE;
    v_interest_rate NUMBER := 0.005; 
    v_interest_amount NUMBER(15, 2);

BEGIN
    OPEN savings_accounts_cur;
    LOOP
        FETCH savings_accounts_cur INTO v_account_no, v_balance;
        EXIT WHEN savings_accounts_cur%NOTFOUND;
        v_interest_amount := v_balance * v_interest_rate;
        UPDATE BANK_ACCOUNT
        SET Balance = Balance + v_interest_amount
        WHERE Account_No = v_account_no;
        DBMS_OUTPUT.PUT_LINE('Applied interest of ' || v_interest_amount || ' to account ' || v_account_no);

    END LOOP;
    CLOSE savings_accounts_cur;
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest application process completed.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during interest application: ' || SQLERRM);
        ROLLBACK;
        RAISE; 
END;
/
-- PL/SQL block using a cursor to generate an account statement

DECLARE
    p_account_no BANK_ACCOUNT.Account_No%TYPE := 'ACC1001'; 
    p_start_date DATE := TO_DATE('2025-05-01', 'YYYY-MM-DD'); 
    p_end_date DATE := TO_DATE('2025-05-31', 'YYYY-MM-DD'); 
    CURSOR account_statement_cur IS
        SELECT
            T_ID,
            T_Date,
            Amount,
            Modex,
            Status,
            Card_No
        FROM
            TRANSACTION
        WHERE
            Account_No = p_account_no
            AND T_Date BETWEEN p_start_date AND p_end_date
        ORDER BY
            T_Date, T_ID; 
    v_t_id TRANSACTION.T_ID%TYPE;
    v_t_date TRANSACTION.T_Date%TYPE;
    v_amount TRANSACTION.Amount%TYPE;
    v_mode TRANSACTION.Modex%TYPE;
    v_status TRANSACTION.Status%TYPE;
    v_card_no TRANSACTION.Card_No%TYPE;
    v_current_balance BANK_ACCOUNT.Balance%TYPE;

BEGIN
    DBMS_OUTPUT.ENABLE(NULL);
    DBMS_OUTPUT.PUT_LINE('--- Account Statement for Account: ' || p_account_no || ' ---');
    DBMS_OUTPUT.PUT_LINE('Period: ' || TO_CHAR(p_start_date, 'YYYY-MM-DD') || ' to ' || TO_CHAR(p_end_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('T_ID', 10) || ' | ' || RPAD('Date', 10) || ' | ' || RPAD('Amount', 10) || ' | ' || RPAD('Mode', 20) || ' | ' || RPAD('Status', 10) || ' | ' || RPAD('Card_No', 15));
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
    OPEN account_statement_cur;
    LOOP
        FETCH account_statement_cur INTO v_t_id, v_t_date, v_amount, v_mode, v_status, v_card_no;
        EXIT WHEN account_statement_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_t_id, 10) || ' | ' ||
            TO_CHAR(v_t_date, 'YYYY-MM-DD') || ' | ' ||
            RPAD(TO_CHAR(v_amount, 'FM9999999.00'), 10) || ' | ' || 
            RPAD(v_mode, 20) || ' | ' ||
            RPAD(v_status, 10) || ' | ' ||
            RPAD(NVL(v_card_no, 'N/A'), 15)
        );

    END LOOP;
    CLOSE account_statement_cur;
    BEGIN
        SELECT Balance
        INTO v_current_balance
        FROM BANK_ACCOUNT
        WHERE Account_No = p_account_no;

        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Current Balance as of ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD') || ': ' || TO_CHAR(v_current_balance, 'FM99999999.00'));
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
             DBMS_OUTPUT.PUT_LINE('Error: Account number ' || p_account_no || ' not found for final balance.');
    END;


    DBMS_OUTPUT.PUT_LINE('--- End of Statement ---');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Account number ' || p_account_no || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during statement generation: ' || SQLERRM);
        IF account_statement_cur%ISOPEN THEN
            CLOSE account_statement_cur;
        END IF;
        RAISE; 
END;
/


-- This view is intended to be queried by filtering on C_ID to show a specific customer's data.

CREATE OR REPLACE VIEW CUSTOMER_FULL_DETAILS_V AS
SELECT
    c.C_ID,
    c.Customerx AS Customer_Name,
    c.Address AS Customer_Address,
    c.Mobile_No AS Customer_Mobile,
    ba.Account_No,
    ba.Balance AS Account_Balance, 
    ba.Account_Type,
    b.Branch_code,
    b.Branch_name,
    b.Address AS Branch_Address,
    bk.B_Name AS Bank_Name,
    bk.City AS Bank_City,
    t.T_ID AS Transaction_ID, 
    t.T_Date AS Transaction_Date,
    t.Amount AS Transaction_Amount, 
    t.Modex AS Transaction_Mode,
    t.Status AS Transaction_Status,
    t.Card_No AS Transaction_Card_No, 
    card.Card_Type AS Transaction_Card_Type 
FROM
    CUSTOMERX c
JOIN
    BANK_ACCOUNT ba ON c.C_ID = ba.C_ID 
JOIN
    BRANCH b ON ba.Branch_code = b.Branch_code 
JOIN
    BANK bk ON b.B_Code = bk.B_Code 
LEFT JOIN
    TRANSACTION t ON ba.Account_No = t.Account_No 
LEFT JOIN
    CARD card ON t.Card_No = card.Card_No; 
-- SELECT * FROM CUSTOMER_FULL_DETAILS_V WHERE C_ID = 'CUST001';
