with CUSTOMER as(
 	 
 	select
 	id as customer_id,
 	first_name,
 	last_name
 	 
 	from "RAW"."JAFFLE_SHOP"."CUSTOMER"
 	 
 	)
 	 
 	select * from CUSTOMER