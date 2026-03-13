INSERT INTO Customers VALUES
(1,'Ali Karimov','ali@mail.com','Uzbekistan'),
(2,'Vali Tursunov','vali@mail.com','Kazakhstan'),
(3,'John Smith','john@mail.com','USA');

INSERT INTO Branches VALUES
(1,'Tashkent Main','Uzbekistan'),
(2,'Samarkand Branch','Uzbekistan');

INSERT INTO Accounts VALUES
(1,1,1,25000,'Active'),
(2,2,1,12000,'Active'),
(3,3,2,8000,'Active');

INSERT INTO Loans VALUES
(1,1,15000,'active'),
(2,1,5000,'active'),
(3,2,7000,'closed');

INSERT INTO Transactions VALUES
(1,1,12000,'2024-01-01 10:00','Uzbekistan','completed'),
(2,1,15000,'2024-01-01 10:30','Uzbekistan','completed'),
(3,2,20000,'2024-02-01 11:00','USA','fraud');