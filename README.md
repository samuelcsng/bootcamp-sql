# bootcamp-sql

***
## Week-7 Day-4 20240919
- DBMS + SQL

- Data redundancy and inconsistency
- Database:
  - the low level side highly probably to be written in C code
  - the higher side may be java or others
  - DBMS
- DATA DEFINITION LANGUAGE (DLL)
  - Table scope processing
- DATA MANIPULATION LANGUAGE (DML)
  - Data scope processing

***
## Week-7 Day-5 20240920

- GROUP BY + HAVING (AGG FUNCTIONS)
  - WHERE FILTER DATA (BEFORE GROUP BY)
  - HAVING FILTER GROUP (AFTER GROUP BY)

- WHERE + GROUP BY + HAVING

- UPDATE

- BETWEEN, EXISTS, IN, LIKE

- CASE + WHEN + THEN + ELSE + END AS ...

- SET

- DISTINCT (1 COLUMN VS 2 COLUMNS)
  - VS GROUP BY

- BETWEEN + AND
  - INCLUSIVE

- LIMIT

- WHERE IN

- JOIN
  - INNER JOIN ON CONDITION

- EXISTS / NOT EXISTS

- SUBQUERY
  - Scalar Subquery
  - Single row Subquery
  - multi row Subquery
    - usually used with IN, ANY, ALL
  - Correlated Subquery
  - Subquery with Aggregates
  - EXISTS Subquery
  - NOT EXISTS Subquery

- Common Table Expression(CTE) + WITH
  - Readability
  - Code Reusability
  - Simpler Debugging
  - Optimization
  - Recursive Queries

- Subquery Limitation
  - on number of subqueries (depends on DBMS)
    - general cases use 2 - 3 is enough
  - on Computational (inefficient)
    - JOIN is preferred as being optimized in most DBMS

***
## Week-8 Day-1 20240923
- Tables Keys & Relationships
  - Super Key
  - Candidate Key
  - Primary Key
  - Foreign Key
    - prevent the presence of invalid data
    - by checking if the key is present in the target table (linked by relationship)
    - ADD FOREIGN_KEY AFTER CREATING THE TABLE
      - ALTER TABLE ... ADD CONSTRAINT FOREIGN_KEY (...) REFERENCES TABLE2(PRIMARY_KEY)
  - CHECK
  - DEFAULT
  - TYPES OF TABLE
    1. SETUP TABLE (ADMIN SYSTEM CONTROL) *** VIP
    2. TRANSACTION TABLE (USER ACTION)
    3. CUSTOMER BASED TABLE (USER ACTION) 
  - Table Relations
    - One-to-One
      - UNIQUE syntax
        - to ensure one-to-one relationship
    - One-to-Many
    - Many-to-Many

- Table Constraints
  - NOT NULL
  - UNIQUE

- DLL
  - Creating primary key
    - AUTO_INCREMENT syntax
  - Creating foreign key
  - Creating a UNIQUE constraint
  - Creating a CHECK Constraint
  - Creating an Index
  - Creating a View

### Week 8 Stuffs
- Database Normalization
  - Problem
    - Update Anomaly
    - Insertion Anomaly
    - Delete Anomaly 
  - Normalization
    - BCNF
    - First Normal Form (1NF)
    - Second Normal Form (2NF) 
    - Third Normal Form (3NF)
    - Setup Table
  - Why Normalization?
    - Advantages
      - Data Integrity
      - Efficient Updates
      - Reduced Redundancy
      - Easier Maintenance
      - Improved Query Performance
    - Downsides
      - Increased Complexity
      - Additional Joins
      - Design Trade-offs
      - Performance Trade-offs
      - Maintaining Relationships







***
## Week-8 Day-2 20240924

***
## Week-8 Day-3 20240925

***
## Week-8 Day-4 20240926

***
## Week-8 Day-5 20240927



