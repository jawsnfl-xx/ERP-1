{if $parameters['1'] neq '' }
<!-- 
	Górny pasek z wykazaniem podstrony przy dodawaniu raportu
	W przyszłości wykazujący również statusy i informacje o nieścisłościach i błędach (być może? )

 -->
<div class="container-liquid">
	<ul class="list-inline row">
		<li class="col-md-2 col-md-offset-1"><a
			class="btn btn-info col-md-9" href="?url=home/quality_management/add">Informacja</a>
			<span class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span>
		</li>
		<li class="col-md-2"><a class="btn btn-success col-md-9"
			href="?url=home/quality_management/add/step1">Wstęp</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a class="btn btn-primary col-md-9"
			href="?url=home/quality_management/add/step2">Wymiary</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a class="btn btn-default col-md-9"
			href="?url=home/quality_management/add/step3">Geometria</a> <span
			class="btn disabled col-md-3 glyphicon glyphicon-chevron-right"></span></li>
		<li class="col-md-2"><a class="btn btn-default col-md-9"
			href="?url=home/quality_management/add/summary">Podsumowanie</a></li>
	</ul>
</div>
{/if} {if $parameters['1'] eq '' }

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
		<a class="btn btn-primary btn btn-block btn-lg"
			href="?url=home/quality_management/add/step1">Wykonaj nowe
			badanie</a>
	</div>
</div>
{elseif $parameters['1'] eq 'step1' }

<div class="page-header">
	<h1>Utwórz nowy formularz</h1>
</div>
<div class="progress progress-striped active">
	<div class="progress-bar" role="progressbar" aria-valuenow="45"
		aria-valuemin="0" aria-valuemax="100" style="width: 10%">
		<span class="sr-only">45% Complete</span>
	</div>
</div>
<input class="form-control input-lg" type="text" placeholder="NAZWA">

<div>
	<label class="checkbox-inline"> <input type="checkbox"
		id="inlineCheckbox1" value="option1"> 1
	</label> <label class="checkbox-inline"> <input type="checkbox"
		id="inlineCheckbox2" value="option2"> 2
	</label> <label class="checkbox-inline"> <input type="checkbox"
		id="inlineCheckbox3" value="option3"> 3
	</label>
</div>
<input class="form-control input-lg" type="text"
	placeholder="PRZYDATNY INPUT 1">
<input class="form-control input-lg" type="text"
	placeholder="PRZYDATNY INPUT 2">
<input class="form-control input-lg" type="text"
	placeholder="PRZYDATNY INPUT 3">

<h3>Ilość pomiarów</h3>
<select class="form-control">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
	<option>8</option>
	<option>9</option>
	<option>10</option>
	<option>11</option>
	<option>12</option>
	<option>13</option>
	<option>14</option>
	<option>15</option>
	<option>16</option>
	<option>17</option>
	<option>18</option>
	<option>19</option>
	<option>20</option>
	<option>21</option>
	<option>22</option>
	<option>23</option>
	<option>24</option>
	<option>25</option>
	<option>26</option>
	<option>27</option>
	<option>28</option>
	<option>29</option>
	<option>30</option>
</select>
<h3>Ilość zakresów pomiarów</h3>
<select class="form-control">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
	<option>7</option>
	<option>8</option>
	<option>9</option>
	<option>10</option>
	<option>11</option>
	<option>12</option>
	<option>13</option>
	<option>14</option>
	<option>15</option>
	<option>16</option>
	<option>17</option>
	<option>18</option>
	<option>19</option>
	<option>20</option>
	<option>21</option>
	<option>22</option>
	<option>23</option>
	<option>24</option>
	<option>25</option>
	<option>26</option>
	<option>27</option>
	<option>28</option>
	<option>29</option>
	<option>30</option>
</select>
<div class="alert alert-success">
	<span class="glyphicon glyphicon-thumbs-up"></span> Wszystko działa
</div>
<div class="alert alert-warning">
	<span class="glyphicon glyphicon-thumbs-down"></span> Nie zrobiłeś do
	końca
</div>
<div class="alert alert-danger">
	<span class="glyphicon glyphicon-warning-sign"></span> bul i źle i rzal
</div>
<a class="btn btn-primary btn btn-block"
	href="?url=home/quality_management/add/step1"> Block level button</a>
</p>
{elseif $parameters['1'] eq 'step2' }

<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>
	</div>

	<table class="table table-bordered">
		<tr>
			<th>ytuk</th>
			<th>Header 2</th>
			<th>Header 3</th>
			<th>Header 4</th>
			<th>Header 5</th>
		</tr>
		<tr>
			<td><input type="email" class="form-control" id="inputEmail3"
				placeholder="Email" style="border: 0; box-shadow: none;"></td>
			<td>Row:1 Cell:2</td>
			<td class="warning">Row:1 Cell:3</td>
			<td>Row:1 Cell:4</td>
			<td>Row:1 Cell:5</td>
		</tr>
		<tr>
			<td>Row:2 Cell:1</td>
			<td>Row:2 Cell:2</td>
			<td>Row:2 Cell:3</td>
			<td>Row:2 Cell:4</td>
			<td>Row:2 Cell:5</td>
		</tr>
		<tr>
			<td>Row:3 Cell:1</td>
			<td>Row:3 Cell:2</td>
			<td>Row:3 Cell:3</td>
			<td class="danger">Row:3 Cell:4</td>
			<td>Row:3 Cell:5</td>
		</tr>
		<tr>
			<td>Row:4 Cell:1</td>
			<td>Row:4 Cell:2</td>
			<td>Row:4 Cell:3</td>
			<td>Row:4 Cell:4</td>
			<td>Row:4 Cell:5</td>
		</tr>
		<tr>
			<td>Row:5 Cell:1</td>
			<td>Row:5 Cell:2</td>
			<td>Row:5 Cell:3</td>
			<td>Row:5 Cell:4</td>
			<td>Row:5 Cell:5</td>
		</tr>
		<tr>
			<td>Row:6 Cell:1</td>
			<td>Row:6 Cell:2</td>
			<td>Row:6 Cell:3 <span class="badge pull-right">42</span></td>
			<td>Row:6 Cell:4</td>
			<td>Row:6 Cell:5</td>
		</tr>
	</table>

</div>

{elseif $parameters['1'] eq 'step3' }

<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>
	</div>

	<table class="table table-bordered">
		<tr>
			<th>ytuk</th>
			<th>Header 2</th>
			<th>Header 3</th>
			<th>Header 4</th>
			<th>Header 5</th>
		</tr>
		<tr>
			<td><input type="email" class="form-control" id="inputEmail3"
				placeholder="Email" style="border: 0; box-shadow: none;"></td>
			<td>Row:1 Cell:2</td>
			<td class="warning">Row:1 Cell:3</td>
			<td>Row:1 Cell:4</td>
			<td>Row:1 Cell:5</td>
		</tr>
		<tr>
			<td>Row:2 Cell:1</td>
			<td>Row:2 Cell:2</td>
			<td>Row:2 Cell:3</td>
			<td>Row:2 Cell:4</td>
			<td>Row:2 Cell:5</td>
		</tr>
		<tr>
			<td>Row:3 Cell:1</td>
			<td>Row:3 Cell:2</td>
			<td>Row:3 Cell:3</td>
			<td class="danger">Row:3 Cell:4</td>
			<td>Row:3 Cell:5</td>
		</tr>
	</table>

</div>

{elseif $parameters['1'] eq 'summary' }
<p>dupa dupa i 8 cyceków dupa</p>
{/if}
