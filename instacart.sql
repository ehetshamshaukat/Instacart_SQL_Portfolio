# selecting tables

select * from aisles;
select * from departments;
select * from order_product_prior;
select * from orders;
select * from products


# number of products in each department

select department,count(product_name) as total_product_in_each_department
from departments
inner join products
using (department_id)
group by department;

# number of products with missing department labels

select department,count(product_name) as product_with_missing_department_labels
from departments
inner join products
using (department_id)
where department = 'missing'
group by department

# number of order place by each users

select user_id , count(order_number) as number_of_total_order_by_each_user
from orders
group by user_id;

# number of orders total made on each day of week

select order_dow , count(order_id) as total_order
from orders
group by order_dow;

# order made on each hour

select order_hour_of_day,count(order_hour_of_day) as order_on_each_hour
from orders
group by order_hour_of_day;

# how many aisles in each department

select department_id , count(aisle_id) as number_of_aisles_in_department
from products
group by department_id
order by department_id;

# most reorderd products
select product_id , count(reordered) as most_reorderd_products
from order_product_prior
where reordered = 1
group by product_id
order by most_reorderd_products desc;

# most reorder product with alway first on add_to_cart in each department
select product_name , count(reordered) as most_reorderd_product_with_first_add_to_cart
from order_product_prior
inner join products
    using (product_id)
where add_to_cart_order = 1
group by product_name;

# total number of aisles
select count(*) as total_number_of_aisles
from aisles;

# total number of department
select count(*) as total_number_of_department
from departments;

# number of product in each aisles
select aisle ,count(product_name) as number_of_product_in_each_aisle
from products
inner join aisles
using (aisle_id)
group by aisle
order by 1;
