{include file='../layouts/navigation.tpl'}
<ol class="breadcrumb">
	<li><a href="/home/index"><span>Główna</span></a></li>
	<li>{if $parameters['0'] neq ''} <a
		href="/home/product_technology"><span>Produkt i technologia</span></a>
		{else} <span>Produkt i technologia</span> {/if} {if $parameters['0']
		eq 'product'}
	</li>

	<li class="active">{if $parameters['1'] neq ''} <a
		href="/home/product_technology/product">Produkt</a> {else} <span>Produkt</span>
		{/if}
	</li> {elseif $parameters['0'] eq 'technology'}
	<li class="active"><span>Technologia</span></li> {else} {/if} {if
	$parameters['1'] eq 'view'}
	<li class="active"><span>Szczegóły</span></li> {else} {/if}
</ol>
{if $parameters['0'] eq 'product' } {include
file='./product_technology_product.tpl'} {elseif $parameters['0'] eq
'technology'} {include file='./product_technology_technology.tpl'}
{else}
<div class="col-md-3">
	<div class="list-group">
		<a href="/home/product_technology/product" class="list-group-item">Produkt
			<span class="badge pull-right">666</span>
		</a> <a href="/home/product_technology/technology" class="list-group-item">Technologia
			<span class="badge pull-right">23</span>
		</a>
	</div>
</div>
{/if}
<script src="/public/js/jquery.js"></script>
<script src="/public/js/bootstrap.js"></script>
</body>
</html>