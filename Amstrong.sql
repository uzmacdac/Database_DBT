delimiter //
create procedure abc()
begin 
	declare x int default 1;
    declare sm int ;
    declare rem int ;
    declare num int;
    while x < 1000 do
		set num = x;
        set sm =0;
        set rem = 0;
		while num != 0 do
			set rem = mod(num,10);
			set sm = sm+(rem*rem*rem);
			set num=(num div 10);
        end while;
      
        if sm=x then
				insert into tempp values(x,'Armstrong');
		end if;
		set x = x+1;
	end while;    
end;
// delimiter ;