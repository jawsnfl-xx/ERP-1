<div class="panel panel-default">
	<div class="panel-heading">
		Przegląd arkuszów kontrolnych
		<div class="pull-right">
			<a href="javascript:window.print()" type="button"
				class="btn btn-default"> <span class="glyphicon glyphicon-print"></span>
			</a>
		</div>
	</div>
	<div class="panel-body">
		<p>Poniższa lista obejmuje wszystkie istniejące arkusze kontrolne.</p>
		<p>
			Jeśli istnieje taka potrzeba, możesz <a
				href="/module/quality_management/add">dodać nowy arkusz</a>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th>L.p.</th>
				<th>Nazwa</th>
				<th>Nr produktu</th>
				<th>Nr pomiaru</th>
				<th>Nr skrzynki</th>
				<th>zamówienie</th>
				<th>data</th>
				<th>inna data</th>
				<th>zaznacz</th>
			</tr>
			{foreach from=$table['quality_management']['list'] item=row name=row}
			<tbody>
				<tr>
					<td>{$smarty.foreach.row.iteration}</td>
					<td><a
						href="/module/quality_management/view/{$row.id_control_measurements}">
							{$row.id_control_measurements} </a></td>
					<td><a
						href="/module/product_technology/product/view/{$row.products_name}">{$row.products_name}</a></td>
					<td>{$row.products_id_products}</td>
					<td>{$row.type_of_control_measurements_id_type_of_control_measurements}</td>
					<td>{$row.packages_id_packages}</td>
					<td><a href="#">{$row.date_start}</a></td>
					<td>{$row.date_end}</td>
					<td>
						<div class="pull-right">
							<input type="checkbox">
						</div>
					</td>
				</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
</div>
<ul class="list-group">
	<li class="list-group-item">
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li> {foreach
			from=$table['quality_management']['pager'] item=pager}
			<li><a
				href="/module/quality_management/review/{$pager.page}/{$pager.limit}">{$pager.page}</a></li>
			{/foreach}
			<li><a href="#">&raquo;</a></li>
		</ul>
	</li>
</ul>
