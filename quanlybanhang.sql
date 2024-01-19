create database quanlybanhang;
use quanlybanhang;
create table customer(
cid int primary key,
cname varchar(60),
cage int);

create table order1(
oid int primary key,
cid int,
odate date,
ototalprice int,
foreign key (cid) references customer(cid)
);

create table product(
pid int primary key,
pname varchar(60),
pprice int
);

create table orderdetail(
oid int,
pid int,
odqty varchar(60),
primary key(oid,pid),
foreign key (oid) references order1(oid),
foreign key (pid) references product(pid)
);

insert into customer value(1,"Minh Quan",10),(2,"Ngoc Oanh",20),(3,"Hong Ha",50);
insert into order1(oid,cid,odate) value(1,1,"2006-03-21"),(2,2,"2006-03-23"),(3,3,"2006-03-16");
insert into product value(1,"May giat",3),(2,"Tu lanh",5),(3,"Dieu hoa",7),(4,"Quat",1),(5,"Bep dien",2);
insert into orderdetail value(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select * from customer;
select * from order1;
select * from product;
select * from orderdetail;

select cname,product.pname,o.odqty from customer join order1 on customer.cid = order1.cid join orderdetail o on order1.oid = o.oid join product on o.pid = product.pid; 
select * from customer where not exists (select * from order1 where customer.cid = order1.cid);
select order1.oid,odate,sum((o.odqty*p.pprice)) as total from order1 join orderdetail o on order1.oid = o.oid join product p on o.pid = p.pid group by order1.oid;
select order1.oid,odate,(o.odqty*p.pprice) as total from order1 join orderdetail o on order1.oid = o.oid join product p on o.pid = p.pid;
 
select odate from order1;