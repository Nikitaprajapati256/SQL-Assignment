select * from dept
select * from emp

----1. Inner joins - select the records that have matching values in both table

select ep.* , dp.deptname from emp ep 
inner join dept dp on dp.deptid=ep.deptid

select ep.* ,dp.deptname from emp ep
inner join dept dp on dp.deptid=ep.deptid
where deptname in('development','Finance')
order by ep.ename
--display  emp  who is from pune city and hr dept
select ep.*,dp.deptname from emp ep
inner join dept dp on dp.deptid=ep.deptid
where ep.city = 'pune ' and dp.deptname='hr'

--disply emp from hr dept  & salary is less than 30000
select ep.* , dp.deptname from emp ep
inner join dept dp on dp.deptid=ep.deptid
where dp.deptname = 'hr' and ep.salary <30000

-- Display emp from development & hr desc of their salary
select ep.* , dp.deptid from emp ep
inner join dept dp on dp.deptid=ep.deptid
where dp.deptname in('development ','hr')
order by salary desc

--left join 
select ep.* , dp.deptname from emp ep
left join dept dp on dp.deptid=ep.deptid

--right join 
select dp.deptname ,ep.* from emp ep
right join dept dp on dp.deptid=ep.deptid 

