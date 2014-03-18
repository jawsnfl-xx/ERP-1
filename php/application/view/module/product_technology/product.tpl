{if $parameters['1'] eq 'page' }
<div class="panel panel-default">
	<div class="panel-heading">
		<p>Nunc luctus, lacus id aliquet bibendum, nunc mauris imperdiet
			urna</p>
	</div>
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
			<a href="/module/product_technology/product/add/1"
				class="btn btn-default">Dodaj ...</a>
		</div>
	</div>
	<table class="table table-bordered">
		<tr>
			<th>L.p.</th>
			<th>Nazwa</th>
			<th>id units</th>

			<th>id units1</th>
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
{elseif $parameters['1'] eq 'add' }
<div class="panel panel-default">
	<div class="panel-heading">Dodawanie nowego produktu</div>
	<div class="panel-body">
		{if $parameters['2'] eq '1' }
		<p>Aby dodać do systemu nowy produkt, w pierwszym kroku wprowadź
			jego unikalny numer identyfikacyjny:</p>

		{if $table['product']['error'] eq 'idIsExists' }
		<div class="alert alert-warning">
			{foreach from=$table['product']['link'] item=row name=row}
			<h4>Uwaga!</h4>
			<p>
				Produkt o identyfikatorze <strong>{$row.products_name}</strong>
				znajduje się już w bazie danych.
			</p>
			<p>
				Możesz zobaczyć szczegóły dotyczące tego produktu <a
					class="alert-link"
					href="/module/product_technology/product/view/{$row.id_products}">tutaj</a>.
			</p>
			{/foreach}
		</div>

		{elseif $table['product']['error'] eq 'emptyValueName' }
		<div class="alert alert-danger">
			<h4>Nic nie wpisano</h4>
			<p>Aby prawidłowo dodać produkt do bazy danych należy wprowadzić
				jego numer identyfikacyjny.</p>
		</div>

		{/if}

		<form role="form" method="post"
			action="/module/product_technology/product/_add/1">
			<div class="input-group">
				<input type="text" class="form-control" id="number"
					placeholder="Wprowadź numer" name="number"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="submit">Dodaj</button>
				</span>
			</div>
		</form>
		{elseif $parameters['2'] eq '2' }
		<p>Aby kontynuować proces dodania produktu do bazy danych, proszę
			uzupełnić poniższe informacje.</p>

		<form role="form" method="post"
			action="/module/product_technology/product/_add/2">
			<ul class="list-group">
				<li class="list-group-item"><h4>Jednostka miary:</h4> <select
					class="form-control" name="units_id_units">
						<!--  dodać foreach z jednostkami miary -->
						<option>--</option>{foreach from=$table['product']['units']
						item=row name=row}
						<option>{$row.name}</option> {/foreach}
				</select></li>
				<li class="list-group-item"><h4>Kategoria produktu:</h4> <select
					class="form-control" name="category_product">
						<!--  dodać foreach z kategormiami produktu -->
						<option>--</option>{foreach from=$table['product']['category']
						item=row name=row}
						<option>{$row.category_name}</option> {/foreach}
				</select></li>
			</ul>
			<button class="btn btn-default" type="submit">Dodaj</button>
		</form>
		{elseif $parameters['2'] eq '3' }
		<p>Można już to podsumować...</p>
		{/if}
	</div>
</div>
{elseif $parameters['1'] eq 'view' and $parameters['2'] neq '' }
<div class="panel panel-default">
	<div class="panel-heading">Informacje o produkcie</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<tr>
					<th>nazwa</th>
					<th colspan="2">specyfikacja</th>
					<th>coś tu się wsadzi <!-- serio. można znaleźć jakąś informację. ja póki co nie mam pomysłu --></th>
				</tr>
				<tr>
					<td>485729</td>
					<td>Parametr 1</td>
					<td>Wartość parametru</td>
					<td>@up <!-- czyli jakaś potencjalnie przydatna informacja --></td>
				</tr>
			</table>
		</div>
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
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-6">
					<div class="panel panel-success">
						<div class="panel-heading">Ostatnio wykonane badania</div>
						<div class="panel-body">
							<p>Aliquam erat volutpat. Vivamus ac ornare nunc. Ut
								vestibulum sem t volutpat. Vivamus ac ornare nunc. Ut vestibulum
								sem a accumsan vehicula. Vestibulu</p>
						</div>
						<table class="table table-condensed table-hover">
							<tr>
								<th>L.p.</th>
								<th>Data wykonania</th>
								<th>Pracownik</th>
								<th>Nr wysyłki</th>
								<th>Nr skrzyni</th>
							</tr>
							<tbody>
								{foreach from=$table['packages']['list'] item=row name=row}
								<tr>
									<td>{$smarty.foreach.row.iteration}</td>
									<td><a href="#"></a></td>
									<td>Lorem Nowak</td>
									<td>{$row.id_packages}</td>
									<td>{$row.packages_number}</td>
								</tr>
								{/foreach}
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-6">
					<div class="row">
						<div class="col-sm-12 col-md-6 col-lg-6">
							<div class="panel panel-warning">
								<div class="panel-heading">Partie produktu z niekompletnym
									badaniem</div>
								<div class="panel-body">
									<p>Aliquam erat volutpat. Vivamus ac ornare nunc. Ut
										vestibulum sem t volutpat.</p>
								</div>
								<table class="table table-condensed table-hover">
									<tr>
										<th>L.p.</th>
										<th>Nr wysyłki</th>
										<th>Nr skrzyni</th>
										<th>Magazyn</th>
									</tr>
									<tbody>
										{foreach from=$table['packages']['list'] item=row name=row}
										<tr>
											<td>{$smarty.foreach.row.iteration}</td>
											<td>{$row.id_packages}</td>
											<td>{$row.packages_number}</td>
											<td>{$row.warehouse_id_warehouse}</td>
										</tr>
										{/foreach}

									</tbody>
								</table>
							</div>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-6">
							<div class="panel panel-danger">
								<div class="panel-heading">Partie produktu bez
									przeprowadzonego badania</div>
								<div class="panel-body">
									<p>Aliquam erat volutpat. Vivamus ac ornare nunc. Ut
										vestibulum sem t volutpat. Vivamus ac ornare nunc. Ut
										vestibulum sem a accumsan vehicula. Vestibulu</p>
								</div>
								<table class="table table-condensed table-hover">
									<tr>
										<th>L.p.</th>
										<th>Nr wysyłki</th>
										<th>Nr skrzyni</th>
										<th>Magazyn</th>
									</tr>
									<tbody>
										{foreach from=$table['packages']['list'] item=row name=row}
										<tr>
											<td>{$smarty.foreach.row.iteration}</td>
											<td>{$row.id_packages}</td>
											<td>{$row.packages_number}</td>
											<td>{$row.warehouse_id_warehouse}</td>
										</tr>
										{/foreach}

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
		<li class="list-group-item list-group-item-header"><span>Technologia</span></li>
		<li class="list-group-item">

			<table class="table table-bordered table-hover">
				<tr>
					<th>L.p.</th>
					<th>Nazwa</th>
					<th>Dział</th>
					<th>Numer technologii</th>
					<th>Data wdrożenia</th>
					<th>Stanowisko</th>
					<th>Technolog</th>
					<th>Sprawdzający</th>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="/module/product_technology/view/1"></a></td>
					<td></td>
					<td></td>
					<td><a href="#">2000-01-01 12:00:00</a></td>
					<td></td>
					<td>Imperdiet Kowalski</td>
					<td>Jan Bibendum</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="/module/product_technology/view/2">651232</a></td>
					<td>produkcja</td>
					<td>23</td>
					<td></td>
					<td></td>
					<td>Imperdiet Kowalski</td>
					<td>Jan Bibendum</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="/module/product_technology/view/3">123512</a></td>
					<td>produkcja</td>
					<td>14</td>
					<td></td>
					<td></td>
					<td>Imperdiet Kowalski</td>
					<td>Jan Bibendum</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href="/module/product_technology/view/4">900212</a></td>
					<td>produkcja</td>
					<td>13</td>
					<td></td>
					<td></td>
					<td>Imperdiet Kowalski</td>
					<td>Jan Bibendum</td>
				</tr>
				<tr>
					<td>5</td>
					<td><a href="/module/product_technology/view/5">587212</a></td>
					<td>produkcja</td>
					<td>11</td>
					<td></td>
					<td></td>
					<td>Imperdiet Kowalski</td>
					<td>Jan Bibendum</td>
				</tr>
				</tbody>
			</table>
</div>
<div class="col-md-4">
	<table class="table table-bordered table-hover">

		</tbody>
	</table>
</div>
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
			href="/module/product_technology/product/view/{$row.id_products}">{$row.products_name}</a></td>
		<td>{$row.units_id_units_primary}</td>
		<td>{$row.units_id_units_secondary}</td>
	</tr>
	{/foreach}
</table>
{else}
<p>Nie znaleziono wyników</p>
{/if} {/if}
