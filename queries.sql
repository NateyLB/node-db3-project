-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT Product.ProductName as Product, Category.CategoryName as Category
FROM Product
JOIN Category
on Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [Order].Id as OrderID, Shipper.CompanyName as Shipper, [Order].OrderDate
FROM [Order]
JOIN Shipper
on [Order].ShipVia = Shipper.Id
WHERE [Order].OrderDate < "2012-08-09"
order by [Order].OrderDate
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Product.ProductName as Product, OrderDetail.Quantity
FROM [Order]
JOIN OrderDetail
ON [Order].Id = OrderDetail.OrderId
JOIN Product
ON OrderDetail.ProductId = Product.Id
WHERE [Order].Id == "10251"
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [Order].Id as OrderID, Customer.CompanyName, Employee.LastName as EmployeeLastName
FROM [Order]
JOIN Customer
ON [Order].CustomerId = Customer.Id
JOIN Employee
ON [Order].EmployeeId = Employee.Id

--  Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT Categories.CategoryName as Category, COUNT(Products.ProductName) as NumberOfProducts
FROM Categories
JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName

--  Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT Orders.OrderID, SUM(OrderDetails.Quantity) as TotalOrdered
FROM Orders
JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID