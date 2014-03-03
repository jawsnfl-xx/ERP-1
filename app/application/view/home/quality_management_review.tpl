<!-- 
	Dostęp do tabeli masz z tablicy: $table ['quality_management'] ['list']
	Jeśli robisz już tabelę, w której będziesz umieszczał informacje z tablicy
		podrzucę tabelę stronicowaną.
	Ale to później...
-->
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			Przegląd arkuszów kontrolnych
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-trash"></span> Usuń zaznaczone
					</button>
					<button type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-save"></span> Pobierz zaznaczone
					</button>
					<button type="button" class="btn btn-primary ">
						<span class="glyphicon glyphicon-search"></span> Szukaj
					</button>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
				erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
				vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
				ultricies commodo.</p>
		</div>
		<div class="col-md-12">
			<div class="table-responsive">
				<table class="table table-bordered">



					{foreach from=$table['quality_management']['list'] item=row
					name=row}
					<tr>

						<td>{$smarty.foreach.row.iteration}</td>
						<td><a
							href="/home/quality_management/view/{$row.id_control_measurements}">
								{$row.orders_id_orders}</a></td>
						<td>{$row.products_id_products} {$row.packages_id_packages}</td>
						<td>{$row.type_of_control_measurements_id_type_of_control_measurements}</td>
						<td>{$row.packages_id_packages}</td>
						<td>{$row.sample_size}</td>
						<td>{$row.date_start}</td>
						<td>{$row.date_end}</td>
					</tr>
					{/foreach}

					<div class="pull-right">
						<input type="checkbox">
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-save"></span>
						</button>
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-bookmark"></span>
						</button>
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-print"></span>
						</button>
					</div>


				</table>
				<ul class="pager">
					<li class="previous"><a href="#">&larr; Older</a></li>
					<ul class="pagination pagination-lg">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
					</ul>
					<li class="next"><a href="#">Newer &rarr;</a></li>
				</ul>
			</div>
			<div class="col-xs-6"></div>
		</div>
		<div class="row">
			<div class="col-md-4"></div>

		</div>