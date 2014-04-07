{if $parameters['1'] neq '' }
<div class="container-liquid">
	<ul class="list-inline row">
		<li class="col-md-2 col-md-offset-1"><a
			class="btn btn-info col-md-9 disabled">Informacja</a><span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a {if $parameters['1'] ===
			'step1' } class="btn btn-primary col-md-9"
			{elseif $parameters['1'] === 'step2' or $parameters['1'] ===
			'step3' or $parameters['1'] === 'step3' or $parameters['1'] ===
			'summary'} class="btn btn-success col-md-9"
			{/if}
			href="/module/quality_management/add/step1">Wstęp</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a {if $parameters['1'] ===
			'step2' } class="btn btn-primary col-md-9"
			{elseif $parameters['1'] ===
			'step1' } class="btn btn-default col-md-9"
			{elseif $parameters['1'] === 'step3' or $parameters['1'] ===
			'summary'} class="btn btn-success col-md-9"
			{/if}
			href="/module/quality_management/add/step2">Wymiary</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a {if $parameters['1'] ===
			'step3' } class="btn btn-primary col-md-9"
			{elseif $parameters['1'] === 'step1' or $parameters['1'] ===
			'step2'} class="btn btn-default col-md-9"
			{elseif $parameters['1'] ===
			'summary'} class="btn btn-success col-md-9"
			{/if}
			href="/module/quality_management/add/step3">Geometria</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a {if $parameters['1'] ===
			'summary' } class="btn btn-primary col-md-9"
			{elseif $parameters['1'] === 'step1' or $parameters['1'] ===
			'step2' or $parameters['1'] ===
			'step3'} class="btn btn-default col-md-9"
			{/if}
			href="/module/quality_management/add/summary">Podsumowanie</a></li>
	</ul>
</div>
{/if} {if $parameters['1'] eq '' }
<div class="container-liquid">
	<div class="row">
		<div class=" col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">Przygotowanie informacji:</div>
				<div class="panel-body">
					<p>Proces dodawania badania kontrolnego wymaga posiadania
						określonych informacji:</p>
					<ul>
						<li>Przy założeniu przechowywana w bazie danych informacji o
							magazynie (bieżących):</li>
						<ol>
							<li>nazwę produktu / detalu</li>
							<li>numeru zlecenia</li>
						</ol>
						<li>Przy założeniu nie prowadzenia magazynu oraz nie
							posiadania informacji o detalach, zleceniach itp.</li>
						<ol>
							<li>nazwę produktu / detalu</li>
							<li>numeru zlecenia</li>
							<li>ilość sztuk w zleceniu</li>
							<li>ilość sztuk w skrzyni</li>
						</ol>
					</ul>
					<p>Niektóre informacje można dodać korzystając z możliwości
						edytowania istniejących arkuszy. :D</p>
				</div>
			</div>
			<div class="alert alert-info">
				W razie wątpliwości, tu jest link do <a
					href="/content/about_modules" class="alert-link">informacji o
					modułach</a>, takich jak kontrola jakości.
			</div>
		</div>
		<div class=" col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">Przygotowanie narzędzi pomiarowych:</div>
				<div class="panel-body">
					<p>Przed rozpoczęciem wykonywania kontroli jakości produktu,
						należy przygotować niezbędne narzędzia i przyrządy pomiarowe.</p>
					<img
						src="http://www.stalco.pl/produkt/suwmiarka_elektroniczna_s11215.jpg"
						alt="..." class="img-rounded img-responsive">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<a class="btn btn-primary btn-block"
			href="/module/quality_management/add/step1" data-toggle="tooltip"
			data-placement="top" title="Tooltip on top">Wykonaj nowe badanie</a>
	</div>
</div>
{elseif $parameters['1'] eq 'step1' }
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Utwórz nowy formularz</strong>
	</div>
	<div class="panel-body">

		<p>W poniższych polach należy podać podstawowe informacje o
			produkcie, którego pomiary będą przeprowadzane.</p>
	</div>
	<ul class="list-group">
		<form action="/module/quality_management/add/_step1" method="post"
			class="form-horizontal" role="form">
			<li class="list-group-item"><p></p></li>
			<li class="list-group-item">
				<div
					class="form-group {if in_array( 'name', $table['form_err']) } has-error has-feedback{/if}">
					<label class="control-label col-sm-3" for="inputSuccess3">Nazwa
						/ numer</label>
					<div class="col-sm-9">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="Wpisz nazwe produktu" name="name"
							type="text"
							placeholder="Wpisz nazwę detalu lub numer pod który występuje"
							{if $table['form_name'] }value="{$table['form_name']}"
							{/if}
							required>
					</div>
				</div>
				<div
					class="form-group {if in_array( 'amount', $table['form_err']) }  has-error has-feedback{/if}">
					<label class="control-label col-sm-3" for="inputSuccess3">Ilość
						sztuk w skrzyni</label>
					<div class="col-sm-9">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="Wpisz ilość elementów w partii"
							name="amount" type="text"
							placeholder="Wpisz ilość detali w partii"
							{if $table['form_amount'] }value="{$table['form_amount']}"
							{/if}
							required>
					</div>
				</div>
				<div
					class="form-group {if in_array( 'quan', $table['form_err']) } has-error has-feedback{/if}">
					<label class="control-label col-sm-3" for="inputSuccess3">Ilość
						sztuk w zamównieniu</label>
					<div class="col-sm-9">
						<input class="form-control " data-toggle="tooltip"
							data-placement="left" title="Ile sztuk zamówiono" name="quan"
							type="text" placeholder="Ilość w zamówieniu"
							{if $table['form_quan'] }value="{$table['form_quan']}"
							{/if}
							required>
					</div>
				</div>
			</li>
			<li class="list-group-item">

				<div class="alert alert-warning">
					<p>
						<strong>UWAGA!</strong> Wartości z pól poniżej nie są przekazywane
						dalej
					</p>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="inputSuccess3">Dodatkowe
						informacje 1</label>
					<div class="col-sm-9">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="" name="addt_01" type="text"
							placeholder="">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="inputSuccess3">Dodatkowe
						informacje 2</label>
					<div class="col-sm-9">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="" name="addt_02" type="text"
							placeholder="">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="inputSuccess3">Dodatkowe
						informacje 3, 4 i 5</label>
					<div class="col-sm-3">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="" name="addt_03" type="text"
							placeholder="">
					</div>
					<div class="col-sm-3">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="" name="addt_04" type="text"
							placeholder="">
					</div>
					<div class="col-sm-3">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="" name="addt_05" type="text"
							placeholder="">
					</div>
				</div>
			</li>
			<li class="list-group-item"><a
				href="/module/quality_management/add/step1" class="btn btn-default"
				role="button">Wyczyść formularz</a>
				<button class="btn btn-primary pull-right" type="submit"
					value="Przejdź do kolejnego kroku">Przejdź do kolejnego
					kroku</button></li>
		</form>
	</ul>
</div>
{elseif $parameters['1'] eq 'step2' }
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Kontrola wymiarów</strong>
	</div>
	<div class="panel-body">
		<p></p>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th>Wymiary</th>
				<th>Tolerancja</th>
				<th>1</th>
				<th>2</th>
				<th>3</th>
				<th>5</th>
				<th>6</th>
			</tr>
			<tbody>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<a class="btn btn-primary btn btn-block"
	href="/module/quality_management/add/step3"> Block level button</a>
{elseif $parameters['1'] eq 'step3' }

<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Kontrola geometrii</strong>
	</div>
	<div class="panel-body"></div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th>Wymiary</th>
				<th>Tolerancja</th>
				<th>1</th>
				<th>2</th>
				<th>3</th>
				<th>5</th>
				<th>6</th>
			</tr>
			<tbody>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
				<tr>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Wymiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Tolerancja" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
					<td><input type="email" class="form-control" id="inputEmail3"
						placeholder="Pomiar" style="border: 0; box-shadow: none;"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<a class="btn btn-primary btn btn-block"
	href="/module/quality_management/add/summary"> Block level button</a>
{elseif $parameters['1'] eq 'summary' }
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Podsumowanie kontroli jakości</strong>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class=" col-md-3">Z.P.U.H. Rolmech</div>
			<div class=" col-md-3">652953</div>
			<div class=" col-md-3">
				<a href="#">2000-01-01 12:00:00</a>
			</div>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th>Wymiary</th>
				<th>Tolerancja</th>
				<th>1</th>
				<th>2</th>
				<th>3</th>
				<th>4</th>
				<th>5</th>
			</tr>
			<tr>
				<td>Row:1 Cell:1</td>
				<td>Row:1 Cell:2</td>
				<td>Row:1 Cell:3</td>
				<td>Row:1 Cell:4</td>
				<td>Row:1 Cell:5</td>
				<td>Row:1 Cell:6</td>
				<td>Row:1 Cell:7</td>
			</tr>
			<tr>
				<td>Row:2 Cell:1</td>
				<td>Row:2 Cell:2</td>
				<td>Row:2 Cell:3</td>
				<td>Row:2 Cell:4</td>
				<td>Row:2 Cell:5</td>
				<td>Row:2 Cell:6</td>
				<td>Row:2 Cell:7</td>
			</tr>
			<tr>
				<td>Row:3 Cell:1</td>
				<td>Row:3 Cell:2</td>
				<td>Row:3 Cell:3</td>
				<td>Row:3 Cell:4</td>
				<td>Row:3 Cell:5</td>
				<td>Row:3 Cell:6</td>
				<td>Row:3 Cell:7</td>
			</tr>
			<tr>
				<td>Row:4 Cell:1</td>
				<td>Row:4 Cell:2</td>
				<td>Row:4 Cell:3</td>
				<td>Row:4 Cell:4</td>
				<td>Row:4 Cell:5</td>
				<td>Row:4 Cell:6</td>
				<td>Row:4 Cell:7</td>
			</tr>
			<tr>
				<td>Row:5 Cell:1</td>
				<td>Row:5 Cell:2</td>
				<td>Row:5 Cell:3</td>
				<td>Row:5 Cell:4</td>
				<td>Row:5 Cell:5</td>
				<td>Row:5 Cell:6</td>
				<td>Row:5 Cell:7</td>
			</tr>
			<tr>
				<td>Row:6 Cell:1</td>
				<td>Row:6 Cell:2</td>
				<td>Row:6 Cell:3</td>
				<td>Row:6 Cell:4</td>
				<td>Row:6 Cell:5</td>
				<td>Row:6 Cell:6</td>
				<td>Row:6 Cell:7</td>
			</tr>
		</table>
	</div>
	<ul class="list-group">
		<li class="list-group-item">
			<div class="row">
				<label class="control-label col-sm-3" for="inputSuccess3">Uwagi
					i zakończenie</label>
				<div class="col-sm-3">
					<input class="form-control" data-toggle="tooltip"
						data-placement="left" title="" name="addt_01" type="text"
						placeholder="">
				</div>
				<div class="col-sm-3">
					<a class="btn btn-primary btn btn-block"
						href="javascript:window.print()">DRUKUJ </a>
				</div>

				<div class="col-sm-2">
					<a class="btn btn-primary btn btn-block"
						href="/module/quality_management">NIE KOŃCZ</a>
				</div>
			</div>
		</li>
		<li class="list-group-item">
			<div class="row">
				<label class="control-label col-sm-3" for="inputSuccess3">Kontroler</label>
				<div class="col-sm-3">
					<input class="form-control" data-toggle="tooltip"
						data-placement="left" title="" name="addt_01" type="text"
						placeholder="">
				</div>
				<div class="col-sm-5">
					<a class="btn btn-primary btn btn-block"
						href="/module/quality_management">ZAKOŃCZ</a>
				</div>
			</div>
		</li>
	</ul>
</div>

{/if}
