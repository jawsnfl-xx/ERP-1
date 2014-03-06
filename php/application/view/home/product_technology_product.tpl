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
				action="/home/product_technology/product/search">
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
			<a href="/home/product_technology/product/add"
				class="btn btn-default">Dodaj ...</a>
		</div>
	</div>
	<table class="table table-bordered">
		{foreach from=$table['product']['list'] item=row name=row}
		<tr>
			<th>{$smarty.foreach.row.iteration}</th>
			<td><a
				href="/home/product_technology/product/view/{$row.id_products}">{$row.products_name}</a></td>
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
				href="/home/product_technology/product/page/{$pager.page}/{$pager.limit}">{$pager.page}</a></li>
			{/foreach}
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
</div>
{elseif $parameters['1'] eq 'add' }
<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>jksdf hgksjdhf gkshdgk jhsdfkjg hsdkjfhg ksjdfhg kjsdfhg
			lkjafdhgl ksjdfhglk jsdhf glkjshdlkfjgh sdlkfj hg</p>
		<form role="form" method="post"
			action="/home/product_technology/product/_add">
			<div class="input-group">
				<input type="text" class="form-control" id="number"
					placeholder="Wprowadź numer" name="number"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="submit">Dodaj</button>
				</span>
			</div>
		</form>
	</div>
</div>
{elseif $parameters['1'] eq 'view' and $parameters['2'] neq '' }
<div class="panel panel-default">
	<div class="panel-heading">Informacje o produkcie</div>
	<div class="panel-body">
		<p>lorem enean et nunc pulvinar, ornare nisl nec, tempor elit.
			Aliquam erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a
			accumsan vehicula. Vestibulum nec ultenean et nunc pulvinar, ornare
			nisl nec, tempor elit. Aliquam erat volutpat. Vivamus ac ornare nunc.
			Ut vestibulum sem a accumsan vehicula. Vestibulum nec ultenean et
			nunc pulvinar, ornare nisl nec, tempor elit. Aliquam erat volutpat.
			Vivamus ac ornare nunc. Ut vestibulum sem a accumsan vehicula.
			Vestibulu</p>
		<p>m nec ultenean et nunc pulvinar, ornare nisl nec, tempor elit.
			Aliquam erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a
			accumsan vehicula. Vestibulum nec ultenean et nunc pulvinar, ornare
			nisl nec, tempor elit. Aliquam erat volutpat. Vivamus ac</p>
	</div>
	<ul class="list-group">
		<li class="list-group-item"><p>nisl nec, tempor elit. Aliquam
				erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
				vehicula. Vestibulum nec ultenean et nunc pulvinar, ornare nisl nec,
				tempor elit. Aliquam erat vol</p></li>
		<li class="list-group-item list-group-item-header"><span>Kontrola
				jakości</span></li>
		<li class="list-group-item">
			<div class="container-fluid">
				<div class="row">
					<div class="alert alert-success">
						<h4>Arkusz jest poprawny</h4>
						<p>lorem enean et nunc pulvinar, ornare nisl nec, tempor elit.
							Aliquam erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem
							a accumsan vehicula. Vestibulum nec ultenean et nunc pulvinar,
							ornare nisl nec, tempor elit. Aliquam erat volutpat. Vivamus ac
							ornare nunc. Ut vestibulum sem a accumsan vehicula. Vestibulum
							nec ultenean et nunc pulvinar, ornare nisl nec, tempor elit.
							Aliquam erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem
							a accumsan vehicula. Vestibulu</p>
					</div>
					<div class="alert alert-warning">
						<h4>Istniejący arkusz kontroli jakości jest niekompletny lub
							nieaktualny</h4>
						<p>Aliquam erat volutpat. Vivamus ac ornare nunc. Ut
							vestibulum sem a accumsan vehicula. Vestibulum nec ultenean et
							nunc pulvinar, ornare nisl nec, tempor elit. Aliquam erat
							volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
							vehicula. Vestibulu</p>
						<a href="#" class="btn btn-warning">format</a>
					</div>
					<div class="alert alert-danger">
						<h4>Brak arkusza kontroli jakości</h4>
						<p>Aliquam erat volutpat. Vivamus ac ornare nunc. Ut
							vestibulum sem a accumsan vehicula. Vestibulu</p>
						<a href="#" class="btn btn-danger">zrób coś</a>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="panel panel-default">
					<div class="panel-heading">Ostatnio wykonane badania</div>
					<div class="panel-body">
						<p>Aliquam erat volutpat. Vivamus ac ornare nunc. Ut
							vestibulum sem t volutpat. Vivamus ac ornare nunc. Ut vestibulum
							sem a accumsan vehicula. Vestibulu</p>
					</div>
					<table class="table">
						<tr>
							<th>L.p.</th>
							<th>Data wykonania</th>
							<th>Pracownik</th>
							<th>Nr wysyłki</th>
							<th>Nr skrzyni</th>
						</tr>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="#">2000-01-01 12:00:00</a></td>
								<td>Lorem Nowak</td>
								<td>666870</td>
								<td>123213</td>
							</tr>
							<tr>
								<td>2</td>
									<td><a href="#">2000-01-01 12:00:00</a></td>
								<td>Lorem Nowak</td>
								<td>566870</td>
								<td>123213</td>
							</tr>
							<tr>
								<td>3</td>
									<td><a href="#">2000-01-01 12:00:00</a></td>
								<td>Lorem Nowak</td>
								<td>166870</td>
								<td>723213</td>
							</tr>
							<tr>
								<td>4</td>
									<td><a href="#">2000-01-01 12:00:00</a></td>
								<td>Lorem Nowak</td>
								<td>966870</td>
								<td>923213</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a href="#">2000-01-01 12:00:00</a></td>
								<td>Lorem Nowak</td>
								<td>766870</td>
								<td>823213</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</li>
		<li class="list-group-item list-group-item-header"><span>Technologia</span></li>
		<li class="list-group-item"><p>nisl nec, tempor elit. Aliquam
				erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
				vehicula. Vestibulum nec ultenean et nunc pulvinar, ornare nisl nec,
				tempor elit. Aliquam erat vol</p></li>
	</ul>

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
			href="/home/product_technology/product/view/{$row.id_products}">{$row.products_name}</a></td>
		<td>{$row.units_id_units_primary}</td>
		<td>{$row.units_id_units_secondary}</td>
	</tr>
	{/foreach}
</table>
{else}
<p>Nie znaleziono wyników</p>
{/if} {/if}
