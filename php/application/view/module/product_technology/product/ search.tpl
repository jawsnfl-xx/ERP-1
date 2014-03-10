{elseif $parameters['1'] eq 'search' }
<h3>Wpisano w pole szukania:</h3>
<p>{$table.product.search}</p>
{if $table['product']['listSearch'] }
<table class="table table-bordered">
	{foreach from=$table['product']['listSearch'] item=row name=row}
	<tr>
		<th>{$smarty.foreach.row.iteration}</th>
		<td><a
			href="/module/product_technology/product/view/{$row.id_products}">{$row.products_name}</a></td>
		<td>{$row.units_id_units_primary}</td>
		<td>{$row.units_id_units_secondary}</td>
	</tr>
	{/foreach}
</table>
{else}
<p>Nie znaleziono wyników</p>
{/if} {/if}