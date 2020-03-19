-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT Product.ProductName, Category.CategoryName
  FROM Product
  JOIN Category ON Product.CategoryId = Category.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT Id, OrderDate, s.CompanyName
  FROM [Order]
  JOIN [Shipper] as s ON s.Id = [Order].ShipVia
  WHERE OrderDate < '2012-08-09'
  ORDER by OrderDate;
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT d.Quantity, p.ProductName
  FROM [OrderDetail] as d
  join [Product] as p
      on p.id = d.ProductId
      where d.OrderId = '10251'
      order by p.ProductName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT distinct od.OrderId, c.CompanyName, e.LastName
  FROM [OrderDetail] as od
  JOIN [Order] as o
      on od.OrderId = o.id
  JOIN [Customer] as c
      on o.CustomerId = c.id
  JOIN [Employee] as e
      on o.EmployeeId = e.id;
--   Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT COUNT(*) TotalCount, p.CategoryId, c.Id
  FROM [Product] as p
  join [Category] as c
      on c.Id = p.CategoryId
  where p.CategoryId = c.Id
  group by p.CategoryId, c.Id;