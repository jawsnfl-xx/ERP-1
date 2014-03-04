{if $parameters['1'] neq '' }
<!--
	Górny pasek z wykazaniem podstrony przy dodawaniu raportu
	W przyszłości wykazujący również statusy i informacje o nieścisłościach i błędach (być może? )

 -->

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
			href="/home/quality_management/add/step1">Wstęp</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a {if $parameters['1'] ===
			'step2' } class="btn btn-primary col-md-9"
			{elseif $parameters['1'] ===
			'step1' } class="btn btn-default col-md-9"
			{elseif $parameters['1'] === 'step3' or $parameters['1'] ===
			'summary'} class="btn btn-success col-md-9"
			{/if}
			href="/home/quality_management/add/step2">Wymiary</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a {if $parameters['1'] ===
			'step3' } class="btn btn-primary col-md-9"
			{elseif $parameters['1'] === 'step1' or $parameters['1'] ===
			'step2'} class="btn btn-default col-md-9"
			{elseif $parameters['1'] ===
			'summary'} class="btn btn-success col-md-9"
			{/if}
			href="/home/quality_management/add/step3">Geometria</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a {if $parameters['1'] ===
			'summary' } class="btn btn-primary col-md-9"
			{elseif $parameters['1'] === 'step1' or $parameters['1'] ===
			'step2' or $parameters['1'] ===
			'step3'} class="btn btn-default col-md-9"
			{/if}
			href="/home/quality_management/add/summary">Podsumowanie</a></li>
	</ul>
</div>
{/if}
<!--  TREŚĆ  -->
{if $parameters['1'] eq '' }
<div class="container-liquid">
	<div class="row">
		<div class=" col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">Przygotowanie informacji:</div>
				<div class="panel-body">
					<p>Duis tincidunt eget lacus vel molestie. Suspendisse a dolor
						tempus, rhoncus velit sit amet, vehicula odio. Aenean vel
						ultricies lacus, ac semper elit. Ut pellentesque suscipit
						ultrices. Integer venenatis mi sit amet sapien bibendum convallis.
						Donec quis mollis nibh. Proin libero tortor, lobortis id tempor
						nec, sagittis sed lorem. Sed sed arcu nec nunc pretium laoreet.
						Proin felis massa, iaculis eget suscipit faucibus, scelerisque ac
						odio.</p>
					<p>Maecenas vestibulum est non tortor ornare gravida. In leo
						nunc, vestibulum eget gravida vitae, varius non erat. Fusce
						pharetra, diam vitae blandit adipiscing, quam est molestie tortor,
						vitae sagittis ante risus quis enim. Phasellus luctus ante ante,
						in aliquet risus elementum feugiat. Sed tincidunt risus nec
						blandit rutrum. Suspendisse at diam nec erat sollicitudin
						ultrices. Class aptent taciti sociosqu ad litora torquent per
						conubia nostra, per inceptos himenaeos.</p>
				</div>
			</div>
		</div>
		<div class=" col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">Przygotowanie narzędzi pomiarowych:</div>
				<div class="panel-body">
					<p>Maecenas aliquam quis sapien vitae pharetra. Phasellus sit
						amet condimentum leo, nec luctus diam. Suspendisse sit amet
						vestibulum felis. Vivamus nec nisl convallis, aliquam quam eu,
						tempor est. Sed placerat congue nisi at sodales. Aenean dictum
						mollis elit, sit amet accumsan ipsum rutrum pretium. Praesent
						sollicitudin urna ante, venenatis tristique neque blandit non.</p>
					<img
						src="http://www.stalco.pl/produkt/suwmiarka_elektroniczna_s11215.jpg"
						alt="..." class="img-rounded img-responsive">
					<p>Mauris vehicula, orci luctus porttitor dignissim, purus
						dolor tincidunt ligula, eu varius ipsum libero ac nunc. Morbi
						pellentesque enim arcu, quis consectetur nisi gravida vitae.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<a class="btn btn-primary btn-block"
			href="/home/quality_management/add/step1">Wykonaj nowe badanie</a>
	</div>
</div>
{elseif $parameters['1'] eq 'step1' }
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Utwórz nowy formularz</strong>
	</div>
	<div class="panel-body">
		<p>Integer condimentum, turpis sed interdum pretium, ante libero
			posuere dui, at ornare magna urna sed augue. Lorem ipsum dolor sit
			amet, consectetur adipiscing elit. Cras scelerisque est non massa
			dictum varius. Integer auctor massa nec sapien faucibus, non
			adipiscing lectus tristique.</p>
	</div>
	<ul class="list-group">
		<form action="/home/quality_management/add/_step1" method="post"
			class="form-horizontal" role="form">

			<li class="list-group-item"><p>Fusce tincidunt tortor eu
					nibh consectetur, sed bibendum erat elementum. Nam condimentum
					augue nec urna bibendum rhoncus. Proin in nunc nisi. Sed ut
					elementum tellus. Praesent vulputate sem nisi. Proin tristique
					purus eget cursus congue. Proin a odio et urna egestas molestie.
					Pellentesque porttitor ultricies dui. Sed venenatis porttitor enim,
					sed ultrices arcu. Sed in scelerisque tellus, ut semper metus.
					Etiam vel risus enim. Duis pellentesque, nulla ut sollicitudin
					posuere, felis arcu laoreet nulla, nec aliquet tellus dolor at
					dolor.</p></li>
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
							{if $table['form_name'] }value="{$table['form_name']}"{/if}>
					</div>
				</div>
				<div
					class="form-group {if in_array( 'amount', $table['form_err']) }  has-error has-feedback{/if}">
					<label class="control-label col-sm-3" for="inputSuccess3">Ilość
						sztuk w skrzyni</label>
					<div class="col-sm-9">
						<input class="form-control" data-toggle="tooltip"
							data-placement="left" title="Wpisz ilosc elementow w partii"
							name="amount" type="text"
							placeholder="Wpisz ilość detali w partii"
							{if $table['form_amount'] }value="{$table['form_amount']}"{/if}>
					</div>
				</div>

				<div
					class="form-group {if in_array( 'quan', $table['form_err']) } has-error has-feedback{/if}">
					<label class="control-label col-sm-3" for="inputSuccess3">Ilość
						sztuk w zamównieniu</label>
					<div class="col-sm-9">
						<input class="form-control " data-toggle="tooltip"
							data-placement="left" title="Ile sztuk zamowiono" name="quan"
							type="text" placeholder="Ilość w zamówieniu"
							{if $table['form_quan'] }value="{$table['form_quan']}"{/if}>
					</div>
				</div>
			</li>
			<li class="list-group-item">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				<div class="alert alert-warning alert-dismissable">

					<strong>UWAGA!</strong> Wartości z pól poniżej nie są przekazywane
					dalej, dlatego możesz to wszystko przymknąć za pomocą tego "x" po
					prawej stronie ;)
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
				href="/home/quality_management/add/step1" class="btn btn-default"
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
		<strong>Nunc luctus, lacus id aliquet bibendum, nunc mauris
			imperdiet urna</strong>
	</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>
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
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
		</table>
	</div>
</div>
<a class="btn btn-primary btn btn-block"
	href="/home/quality_management/add/step3"> Block level button</a>
{elseif $parameters['1'] eq 'step3' }
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Nunc luctus, lacus id aliquet bibendum, nunc mauris
			imperdiet urna</strong>
	</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>
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
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>

			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>

			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>

			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
				<td><input type="email" class="form-control" id="inputEmail3"
					placeholder="Email" style="border: 0; box-shadow: none;"></td>
			</tr>
		</table>
	</div>
</div>
<a class="btn btn-primary btn btn-block"
	href="/home/quality_management/add/summary"> Block level button</a>
{elseif $parameters['1'] eq 'summary' }
<div class="panel panel-default"></div>
<div class=" col-md-12">
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">Panel heading</div>
		<div class="panel-body">
			<div class="row">
				<div class=" col-md-3">Z.P.U.H. Rolmech</div>
				<div class=" col-md-3">detail_name</div>
				<div class=" col-md-3">date</div>
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
		<div class="panel panel-default">
			<label class="control-label col-sm-3" for="inputSuccess3">Uwagi
				i zakończenie</label>
		</div>
		<div class="row">
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
					href="/home/quality_management"> ZAKOŃCZ</a>
			</div>
		</div>
		{/if}