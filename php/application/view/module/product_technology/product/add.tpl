<div class="panel panel-default">
	<div class="panel-heading">Dodawanie nowego produktu</div>
	<div class="panel-body">
		{if $parameters['2'] eq '1' }
		<p>Aby dodać do systemu nowy produkt, w pierwszym kroku wprowadź
			jego unikalny numer identyfikacyjny:</p>

		{if $table['product']['add']['error'] eq 'idIsExists' }
		<div class="alert alert-warning">
			{foreach from=$table['product']['add']['value']['numer'] item=row
			name=row}
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

		{elseif $table['product']['add']['error'] eq 'emptyValueName' }
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
					class="input-group-btn" required autofocus>
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
						<option>--</option>{foreach
						from=$table['product']['add']['value']['units'] item=row name=row}
						<option>{$row.name}</option> {/foreach}
				</select></li>
				<li class="list-group-item"><h4>Kategoria produktu:</h4> <select
					class="form-control" name="category_product">
						<!--  dodać foreach z kategormiami produktu -->
						<option>--</option>{foreach
						from=$table['product']['add']['value']['category'] item=row
						name=row}
						<option>{$row.category_name}</option> {/foreach}
				</select></li>
			</ul>
			<button class="btn btn-default" type="submit">Dodaj</button>
		</form>
		{elseif $parameters['2'] eq '3' }
		<p>Można już to podsumować...</p>
		<div class="alert alert-info">
			<p>Wyświetlić ładnie dane przed akceptacją dodania do bazy</p>
		</div>
		<ul>
			<li>{$table['product']['add']['value']['number']}</li>
			<li>{$table['product']['add']['select']['units']}</li>
			<li>{$table['product']['add']['select']['category']}</li>
		</ul>

		<div class="modal fade bs-example-modal-sm" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Czy na pewno chcesz porzucić
							wprowadzone informacje?</h4>
					</div>
					<div class="modal-body">
						<p>
							Wybierająć przycisk <em>Odrzuć zmiany</em> spowodujesz
							nieodwracalne skasowanie danych, jakie wprowadziłeś w poprzednich
							krokach.
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Anuluj</button>
						<a href="/module/product_technology/product/_add/4" type="button"
							class="btn btn-danger">Odrzuć zmiany</a>

					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2 col-md-offset-8">
				<button class="btn btn-danger btn-block" data-toggle="modal"
					data-target=".bs-example-modal-sm" role="button">
					Odrzuć <span class="glyphicon glyphicon-remove"></span>
				</button>
			</div>
			<div class="col-md-2">
				<a class="btn btn-success btn-block"
					href="/module/product_technology/product/_add/5" role="button">Dodaj
					<span class="glyphicon glyphicon-ok"></span>
				</a>
			</div>
		</div>
		{/if}
	</div>
</div>