/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select products.name, categories.name from products inner join categories on products.CategoryId = categories.CategoryId;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.name, products.price, reviews.Rating where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select sum(sales.Quantity), employees.FirstName, employees.LastName from employees inner join sales on employees.EmployeeID = sales.EmployeeID group by employees.EmployeeId order by sum(sales.quantity) desc LIMIT 1;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select categories.name, departments.name from categories inner join departments on categories.DepartmentID = departments.DepartmentID where categories.Name in ('Appliances','Games');
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.name, count(sales.SalesId), sum(sales.Quantity * sales.PricePerUnit) from products inner join sales on products.ProductID = sales.ProductID where products.Name = 'Eagles: Hotel California' group by products.Name;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.name, reviews.Reviewer, reviews.Rating, reviews.Comment 
from products 
inner join reviews
on products.ProductId = reviews.ProductId
where products.Name = 'Visio TV' 
order by reviews.Rating asc 
limit 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sod */

select count(sales.SalesId), employees.EmployeeID, employees.FirstName, employees.LastName, products.Name
from employees
inner join sales
on employees.EmployeeId = sales.EmployeeID
inner join products
on sales.ProductId = products.ProductId
group by products.ProductID, employees.EmployeeID;


