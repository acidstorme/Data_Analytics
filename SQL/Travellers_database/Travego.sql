CREATE DATABASE Travego;
USE Travego;
CREATE TABLE Passenger(
Passenger_id int,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_city varchar(20),
Destination_city varchar(20),
Distance int,
Bus_type varchar(20)
);
CREATE TABLE Prices(
id int,
Bus_type varchar(20),
Distance int,
Price int
);
insert into Passenger values (1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
insert into Passenger values (2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into Passenger values (3, 'Pallavi' , 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
insert into Passenger values (4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper');
insert into Passenger values (5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper');
insert into Passenger values (6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
insert into Passenger values (7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper');
insert into Passenger values (8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into Passenger values (9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');


insert into Prices values (1, 'Sleeper', 350, 770);
insert into Prices values (2, 'Sleeper' ,500, 1100);
insert into Prices values (3, 'Sleeper', 600, 1320);
insert into Prices values (4, 'Sleeper', 700, 1540);
insert into Prices values (5, 'Sleeper', 1000, 2200);
insert into Prices values (6, 'Sleeper', 1200, 2640);
insert into Prices values (7, 'Sleeper', 1500, 2700);
insert into Prices values (8, 'Sitting', 500, 620);
insert into Prices values (9, 'Sitting', 600, 744);
insert into Prices values (10, 'Sitting', 700, 868);
insert into Prices values (11, 'Sitting', 1000, 1240);
insert into Prices values (12, 'Sitting', 1200, 1488);
insert into Prices values (13, 'Sitting', 1500, 1860);

select count(Gender) as 'Number of Male Passengers' from Passenger where Distance >= 600 and Gender = 'M';
select count(Gender) as 'Number of Female Passengers' from Passenger where Distance >= 600 and Gender = 'F';

select min(Price) as 'Minimum ticket price for Sleeper bus' from Prices where Bus_type = 'Sleeper';

select Passenger_name from Passenger where Passenger_name like 'S%';

select Passenger.Passenger_name, Passenger.Boarding_city, Passenger.Destination_city, Passenger.Bus_type, Prices.Distance, Prices.Price from Passenger join Prices on Passenger.Distance = Prices.Distance and Passenger.Bus_type = Prices.Bus_type;

select pa.Passenger_name, pr.Price from Passenger pa join Prices pr on pa.Distance = pr.Distance and pa.Bus_type = pr.Bus_type where pa.Distance >= 1000 and pa.Bus_type = 'Sitting';

select Price as 'Price for Sitting type from Bangalore to Panaji' from Prices where Distance = (select Distance from Passenger where Boarding_city = 'Panaji' and Destination_city = 'Bengaluru') and Bus_type = 'Sitting';
select Price as 'Price for Sleeper type from Bangalore to Panaji' from Prices where Distance = (select Distance from Passenger where Boarding_city = 'Panaji' and Destination_city = 'Bengaluru') and Bus_type = 'Sleeper';

select distinct(Distance) from Passenger order by Distance desc;

select Passenger_name, Distance*100/(select sum(Distance) from Passenger) as 'Percentage travelled' from Passenger;