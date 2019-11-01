--Employee
use Training_13Aug19_Pune
go
create schema taxi_booking
go
create table taxi_booking.employee
(
	employee_id int identity(1000,1) primary key,
	employee_name varchar(50),
	available bit,
	ratings float,
	govt_id bigint
)

go
create table taxi_booking.taxi
(
	taxi_id int identity(2000,1) primary key,
	taxi_no varchar(50),
	model varchar(50),
	taxi_type varchar(20),
	employee_id int references taxi_booking.employee
)
go
create table taxi_booking.customer
(
    customer_id int identity(4000,1) primary key,
    customer_name varchar(50) ,
    customer_mailid varchar(50) unique,
    customer_mobileno bigint unique
)
go
create table taxi_booking.employee_log
(
	log_id int identity(3000,1) primary key,
	employee_id int references taxi_booking.employee,
	booking_id int references taxi_booking.booking
)
go

create table taxi_booking.users
(
    user_id int identity(1,1) primary key,
    user_name varchar(50) ,
    user_role int 
)
go
create table taxi_booking.feedback
(
    feedback_id int identity(1,1) primary key,
    customer_id int references taxi_booking.customer,
    feedback_message varchar(200),
    feedback_rating int  
)
go
create table taxi_booking.employee_roster
(
	roster_id  int identity(1,1) primary key,
	employee_id int references taxi_booking.employee,
	in_time datetime,
	out_time datetime,
	work_hours as datediff (hour,out_time,in_time)
)
go
create table taxi_booking.booking
(
	booking_id int identity(1,1) primary key,
	customer_id int references taxi_booking.customer,
	employee_id int references taxi_booking.employee,
	source varchar(100),
	destination varchar(100),
	hours float,
	fare money
)
go
create table taxi_booking.leave
(
	leave_id int identity(1,1) primary key,
	employee_id int references taxi_booking.employee,
	from_date datetime,
	to_date datetime,
	reason varchar(200)
)
go
create table taxi_booking.leave_approve
(
	leave_approval_id int identity(1,1) primary key,
	leave_id int references taxi_booking.leave,
	approval_status bit
)




