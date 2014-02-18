{include file='../layouts/navigation.tpl'}
<ol class="breadcrumb">
	<li><a href="?url=home/index"><span>Główna</span></a></li>
	<li><a href="?url=home/product_technology"><span>Produkt
				i technologia</span></a></li> {if $parameters['0'] eq 'product'}
	<li class="active"><span>Produkt</span></li> {elseif $parameters['0']
	eq 'technology'}
	<li class="active"><span>Technologia</span></li> {else} {/if}
</ol>

{if $parameters['0'] eq 'product' } {include
file='./product_technology_product.tpl'} {elseif $parameters['0'] eq
'technology'} {include file='./product_technology_technology.tpl'} {/if}


<script src="../public/js/jquery.js"></script>
<script src="../public/js/bootstrap.js"></script>
</body>
</html>