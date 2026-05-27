CREATE TABLE brands (
    id int identity PRIMARY KEY,
    name varchar(100),
    contact varchar(200),
    website varchar(200)
)
GO

INSERT INTO brands(name, contact, website) VALUES
    ('FPT Aptech', 'FPT', 'fptaptech.com.vn'),
    ('Viettel', 'Viettel HCMC', 'viettel.vn'),
    ('VNPT', 'VNPT Group', 'vnpt.com.vn'),
    ('Vingroup', 'Vin Customer Care', 'vingroup.net'),
    ('FPT Software', 'FPT Software HN', 'fpt-software.com')
GO