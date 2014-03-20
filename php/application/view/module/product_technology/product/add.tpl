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

		<ul>
			<li>{foreach from=$table['product']['view'][0] item=view
				name=view}
				<p>{$view} {/foreach}
			</li>
		</ul>
		{/if}
	</div>
</div>