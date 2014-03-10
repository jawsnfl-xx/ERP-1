{if $parameters['1'] eq 'page' }
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
				action="/module/product_technology/product/search">
				<div class="input-group">
					<input type="text" class="form-control" id="number"
						placeholder="Wprowadź numer" name="number"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="submit">Szukaj ...</button>
					</span>
				</div>
			</form>
		</div>
		<div class="col-lg-6">
			<a href="/module/product_technology/product/add"
				class="btn btn-default">Dodaj ...</a>
		</div>
	</div>
	<table class="table table-bordered">
		<tr>
			<th>L.p.</th>
			<th>Nazwa</th>
			<th>id units</th>
			<th>id units1</th>
			<th></th>
		</tr>
		{foreach from=$table['product']['list'] item=row name=row}

		<th>{$smarty.foreach.row.iteration}</th>
		<td><a
			href="/module/product_technology/product/view/{$row.id_products}">{$row.products_name}</a></td>
		<td>{$row.units_id_units}</td>
		<td>{$row.units_id_units1}</td>
		</tr>
		{/foreach}
	</table>
	<div class="panel-footer">
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li> {foreach
			from=$table['product']['pager'] item=pager}
			<li><a
				href="/module/product_technology/product/page/{$pager.page}/{$pager.limit}">{$pager.page}</a></li>
			{/foreach}
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
</div>