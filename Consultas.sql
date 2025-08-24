--Lista de todos os Clientes que não realizaram compras
Select * 
from customers a
where (select count(*) from orders b where a.customer_id = b.customer_id) = 0


--Lista de todos os Produtos que não foram comprados
select *
from products a
where(select count(*) from order_items b where a.product_id = b.product_id) = 0


--Lista dos produtos sem estoque
Select a.product_id, a.product_name 
from products a
	left join stocks b 
		on a.product_id = b.product_id
where isnull(b.quantity,0) = 0


--Agrupando a quantidade de vendas por marca e loja
Select d.brand_id, d.brand_name, a1.store_name, sum(b.quantity) as quantity
from orders a
	join stores a1
		on a.store_id = a1.store_id
	join order_items b 
		on b.order_id = a.order_id
	join products c
		on c.product_id = b.product_id
	join brands d
		on d.brand_id = c.brand_id
group by d.brand_id, d.brand_name, a1.store_name


-- Lista dos funcionarios não relacionados com Pedidos, levando em consideração que o funcionario pode não esta relacionado diretamente, mas de forma indireta quando é manager
select * 
from staffs a
where(select count(*) from orders b where a.staff_id = b.staff_id) = 0
and (select count(*) from orders d where d.staff_id in (select c.staff_id from staffs c where c.manager_id = a.staff_id)) = 0
