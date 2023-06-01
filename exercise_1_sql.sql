/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.Name as ProductName,c.Name as CategoryName
from products as P
 inner join categories as C
on P.categoryID=C.categoryID
where c.name="computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.NAME,p.price,r.rating
from products as p
inner join reviews as r
on p.productID=r.productID
where r.rating=5;
 /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName,e.LastName ,sum(s.Quantity) as total
from sales as s 
inner join employees as e on e.EmployeeID=s.EmployeeID
group by e.EmployeeID
order by total desc
limit 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
select c.name,d.name
from categories as c
inner join departments as d
on c.DepartmentID=d.DepartmentID
where c.Name= "appliances" or  c.Name="games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name,sum(s.Quantity) as 'total sold',sum(s.Quantity*s.PricePerUnit) as 'total sale'
from products as p
inner join sales as s
on s.ProductID=p.ProductID
where p.ProductID=97;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name,r.Reviewer,r.rating as rating,r.Comment
from products as p inner join reviews as r
on p.productID=r.productID
where p.name like'%visio tv' and r.rating= 1;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.EmployeeID,e.FirstName,e.LastName, p.Name, sum(s.quantity) as totalsold
from  sales as s
inner join  employees as e on s.employeeid=e.employeeid
inner join products as p on p.ProductID=s.ProductID
group by e.EmployeeID, p.ProductID
order by totalsold desc;
