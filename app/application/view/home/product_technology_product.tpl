{if $parameters['1'] eq '' }
<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>
		<p>Zawsze istnieje możliwość wyszukania nazwy produktu</p>
		<div class="col-lg-6">
			<form role="form" method="post"
				action="?url=home/product_technology/product/search">
				<div class="input-group">
					<input type="text" class="form-control" id="number"
						placeholder="Wprowadź numer" name="number"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="submit">szukaj ...</button>
					</span>
				</div>

			</form>
		</div>
	</div>
	<table class="table table-bordered">
		{foreach from=$table['product']['list'] item=row name=row}
		<tr>
			<th>{$smarty.foreach.row.iteration}</th>
			<td><a
				href="?url=home/product_technology/product/view/{$row.id_products}">{$row.products_name}</a></td>
			<td>{$row.units_id_units_primary}</td>
			<td>{$row.units_id_units_secondary}</td>
		</tr>
		{/foreach}
	</table>
	<div class="panel-footer">
		<ul class="pagination">
			<li><a href="#">&laquo;&laquo;</a></li> {foreach
			from=$table['product']['pager'] item=pager}
			<li><a
				href="?url=home/product_technology/product&page={$pager.page}&limit={$pager.limit}">{$pager.page}</a></li>
			{/foreach}
			<li><a href="#">&raquo;&raquo;</a></li>
		</ul>
	</div>
</div>
{elseif $parameters['1'] eq 'view' and $parameters['2'] neq '' }
<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>

		<h4>TODO:</h4>
		<ul>
			<li>podział na arkusze:
				<ul>
					<li>informacje ogólne,</li>
					<li>technologia,</li>
					<li>kontrola</li>
				</ul>
			</li>
			<li>sprawdzanie stanu wypełnienia danych dla produktu</li>
			<li>w przyszłości: obliczałkę tego, jaki jest poziom
				uzupełnienia danych dla poszczególnego produktu</li>
		</ul>
	</div>
	<div class="panel-body">
		<ul>
			{foreach from=$table['product']['view'] item=row}
			<li>{$row['id_products']}</li>
			<li>{$row['products_name']}</li>
			<li>{$row['units_id_units_primary']}</li>
			<li>{$row['units_id_units_secondary']}</li> {/foreach}
		</ul>
	</div>
	<div class="panel-footer">Nunc luctus, lacus id aliquet bibendum,
		nunc mauris imperdiet urna</div>
</div>
{elseif $parameters['1'] eq 'search' }

<h3>Wpisano w pole szukania:</h3>
<p>{$table.product.search}</p>
{if $table['product']['listSearch'] }
<table class="table table-bordered">
	{foreach from=$table['product']['listSearch'] item=row name=row}
	<tr>
		<th>{$smarty.foreach.row.iteration}</th>
		<td><a
			href="?url=home/product_technology/product/view/{$row.id_products}">{$row.products_name}</a></td>
		<td>{$row.units_id_units_primary}</td>
		<td>{$row.units_id_units_secondary}</td>
	</tr>
	{/foreach}
</table>
{else}
<p>Nie znaleziono wyników</p>
{/if} {/if}
