
#1. Write a program containing a loop that iterates from 1 to 1000 using a variable I, 
#   which is incremented each time around the loop. The program should output the 
#   value of I every hundred iterations (i.e., the output should be 100, 200, etc.). 
#create table htemp
#(hno int , hnum int);a
/*delimiter // 
create procedure abc1()
begin 
	declare a int default 1 ;
   -- declare b int default 0 ;
    
    while a <= 1000 do
		if mod(a,100) = 0 then
			-- set b = b+1;
			insert into htemp values(a,a);
		end if ;
        set a = a + 1 ;
    end while ;
end ; //
delimiter ;

call abc1();

#drop procedure abc1;
select * from htemp ;*/
#delete from htemp;

#delete from htemp;












#------------------------------------------------------------------------------------------ 
# 2. Write a program that examines all the numbers from 1 to 999, displaying all those 
#    for which the sum of the cubes of the digits equal the number itself. 










#------------------------------------------------------------------------------------------ 

# 3. Write a program that Selects from any table a minimum and maximum value for a 
#radius, along with an increment factor, and generates a series of radii by repeatedly 
#adding the increment to the minimum until the maximum is reached. For each value 
#of the radius, compute and display the circumference, area, and volume of the 
#sphere. (Be sure to include both the maximum and the minimum values.). 




#------------------------------------------------------------------------------------------ 

#4. A palindrome is a word that is spelled the same forward and backward, such as 
#level, radar, etc. Write a program to Selects from any table a five letter word and 
#determine whether it is a palindrome. 
/*
create table wstring
(wno int , wwords varchar(10));
insert into wstring values(1,'abcba'),(2,'acdba'),(3,'abcdcba'),(4,'level'),(5,'radar');*/ 
/*
create table wtemp
(wstring varchar(10) , wisPalindrome varchar(30));*/
delimiter //
create procedure isPalindrome1()
begin
	declare a int ;
    declare b varchar(10);
    declare rev varchar(10) ;
    declare l int ;
    declare str varchar(10) ;
    declare y int default 0 ;
    declare c1 cursor for select * from wstring for update ;
    declare continue handler for not found 
    set y = 1;
    open c1 ;
    cursor_c1_loop : loop
		fetch c1 into a , b ; 
		if y = 1 then 
			leave cursor_c1_loop ;
        end if ;
        set l = length(b) ;
        if l = 5 then
			while l !=0 do
				set rev = substr(b,l,1);
                set str = concat(str,rev);
                set l = l-1 ;
            end while ;
        end if;
   end loop cursor_c1_loop;
   if b= str then 
		insert into wtemp values(b ,'Palindrome');
   else
		insert into wtemp values(b , 'Not Palindrome');
	end if ;
end ; //
delimiter ;

call isPalindrome1();   
select * from wtemp ;	
delete from wtemp;


	

drop procedure isPalindrome1;






#------------------------------------------------------------------------------------------ 

#5. Modify the above program to Select from any table a variable length word. This 
#requires determining how many characters are read in.