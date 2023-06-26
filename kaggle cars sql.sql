create database if not exists Automobile_database;
use Automobile_database;

set sql_mode="";

-- Task-1) The top 10 automobiles with the highest fuel efficiency (MPG).
select name, mpg, origin from car_data order by mpg desc limit 10;

-- Task-2) Find the top 10  automobile with the maximum displacement (engine capacity)

select car_data.name , displacement, origin from car_data group by name 
having displacement > avg(displacement) order by displacement desc limit 10;

-- Task-3) Group the automobiles by origin country and find the avg  fuel efficiency (MPG)

select origin as "Country_of_origin", count(name) as "Number_of_cars",
 round(avg(mpg),2) as "Avg_mileage" from car_data group by origin;
 
 -- Task-4) Number of cars produced in each year?
 -- 4.2) Number of cars produced in each year having mpg greater than average mpg
 
select model_year as "Year_of_production" , count(car_data.name) as "Number_of_cars_produced" , round(avg(mpg),2) as "Avg_mileage" 
from car_data group by model_year order by Avg_mileage desc;

select model_year as "Year_of_production" , count(car_data.name) as "Number_of_cars_produced" , round(avg(mpg),2) as "Avg_mileage"
from car_data group by model_year having Avg_mileage > (select avg(mpg) from car_data);

-- Task-5 ) Calculate the average acceleration for automobiles produced in different decades.
select model_year, round(avg(acceleration),2) as "avg_accleration" from car_data group by model_year 
having avg_accleration > (select avg(acceleration) from car_data);

-- Task-6)  Calculate the average horsepower for each number of cylinders in the engine.
select cylinders , round(avg(horsepower)) as "avg_horsepower", round(avg(mpg)) as "avg_mpg" from car_data group by cylinders order by cylinders ;





 
 
 
 