use music;
select * from album2;
select * from artist;
select * from customer;
select * from employee;
select * from genre;
select * from invoice;
select * from invoice_line;
select * from media_type;
select * from playlist;
select * from playlist_track;
select * from track;

# 1 . who is the senior most employee based on jon title
select * from employee;
select * from employee  order by levels desc limit 1;

# 2 . which contries have most invoices
select * from invoice;
select billing_country,count(invoice_id) as maximum_invoice from invoice group by billing_country order by maximum_invoice desc;

#3 . what are the top 3 total values of invoice
select * from invoice;
select total from invoice order by total desc limit 3;

#4 . which city has the best customer? we would like to throw a promotional music festival in the city we made the most money
# write a query that return one city that has the hiegest sum of invoices
select billing_city,sum(total) as higest_sum_of_invoice from invoice group by billing_city order by higest_sum_of_invoice desc limit 1;

#5. who is the best customer ? the customer who spent the most money will be decleared the best customer 
# write a query  that returns the best person who spent the most money for invoices .  
select * from customer;
select  c.customer_id,c.first_name, c.last_name ,sum(i.total) as higest_sales_customer
 from customer  c 
 inner join invoice  i on c.customer_id=i.customer_id 
 group by c.customer_id,c.first_name,c.last_name 
 order by higest_sales_customer
 desc limit 1 ;
 
 #6 . 
 select distinct email,first_name,last_name from customer 
 inner join invoice on customer.customer_id=invoice.customer_id 
 inner join invoice_line on invoice.invoice_id=invoice_line.invoice_id;
 
 #7 let's' invite who have most writte a rock music in your data set  write a query t
 # that returns the artist name and total track count of rock music
 select a.artist_id,a.name,count(a.artist_id) as number_of_songs
 from artist a
 inner join album2 on album2.artist_id = a.artist_id
 inner join track on album2.album_id = track.album_id
 inner join genre on track.genre_id = genre.genre_id
 where genre.name="Rock"
 group by a.artist_id
 order by number_of_songs desc
 limit 5;
 
 #8 return all the track name that have a songs length longer more then avrg song lenth 
 # return the name and milliseconds of each track
 select name,milliseconds from track
 where milliseconds >
 (select avg(milliseconds) from track )
 order by milliseconds;
 
 
 

 










