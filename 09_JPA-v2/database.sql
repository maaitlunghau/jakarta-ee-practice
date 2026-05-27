CREATE TABLE brands {
    id int identity PRIMARY KEY,
    name varchar(100),
    contact varchar(200),
    website varchar(200)
}
GO

INSERT INTO brands(name, contact, website) VALUES
    ('FPT Aptech', 'FPT', 'fptaptech.com.vn'),
    ('Viettel', 'Viettel HCMC', 'viettel.vn')
Go