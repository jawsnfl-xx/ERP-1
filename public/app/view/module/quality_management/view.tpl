{assign var="view" value=$table['quality_management']['view']}
<div class="panel panel-default">
	<div class="panel-heading">
		Metryczka produktu
		<div class="pull-right">
			<a href="javascript:window.print()" type="button"
				class="btn btn-default"> <span class="glyphicon glyphicon-print"></span>
			</a>
		</div>
	</div>
	<div class="panel-body">
		<p>Interdum et malesuada fames ac ante ipsum primis in faucibus.
			Maecenas non elit faucibus, malesuada nulla ac, pharetra lacus. Sed
			sollicitudin tristique velit porta imperdiet. Curabitur sed quam
			vestibulum, suscipit leo aliquam, viverra arcu. Vestibulum malesuada
			sapien ac velit malesuada, at interdum dui vulputate. Vestibulum ante
			ipsum primis in faucibus orci luctus et ultrices posuere cubilia
			Curae; Vestibulum interdum rhoncus sapien non vulputate. Nullam
			faucibus sapien in malesuada vehicula. Curabitur eu sem ut tellus
			tempus viverra. Vivamus ipsum arcu, imperdiet in viverra dictum,
			porta a est. Vestibulum ante ipsum primis in faucibus orci luctus et
			ultrices posuere cubilia Curae; Donec ultrices, orci vitae interdum
			varius, lorem massa fermentum eros, vel mattis ante libero nec erat.
			Morbi quis imperdiet est. Morbi vel nulla leo.</p>
	</div>
	<ul class="list-group">
		<div class="row">
			<div class="col-md-6">
				<table class="table table-responsive">
					<tr>
						<th rowspan="3">Z.P.U.H. Rolmech</th>
						<th>Nr detalu</th>
						<td>{$view.products_name}</td>
					</tr>
					<tr>
						<th>Nr zlecenia</th>
						<td>{$view.orders_number}</td>
					</tr>
					<tr>
						<th>Data pomiaru</th>
						<td>2000-01-01</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<table class="table table-responsive">
					<tr>
						<th>Kontroler</th>
						<td>Lorem ipsum</td>
						<th>Pakowacz</th>
						<td>Inny Lorem ipsum</td>
					</tr>
					<tr>
						<th>Szt. w zleceniu</th>
						<td>12</td>
						<th>Data wysyłki</th>
						<td>{$view.orders_date|truncate:10:""}</td>
					</tr>
					<tr>
						<th>Szt. w palecie</th>
						<td>12</td>
						<th>nr palety</th>
						<td>{$view.packages_id_packages}</td>
					</tr>
				</table>
			</div>
		</div>

		<li class="list-group-item list-group-item-header"><span>Karta
				pomiaru</span></li>
	</ul>

	<table class="table table-bordered table-condensed">
		<tbody>
			<tr>
				<th>Badane sztuki</th>
				<th>{$view.sample_size}</th>
				<th colspan="{$view.sample_size}">Numer próbki</th>
			</tr>
			<tr>
				<th>Badany wym.</th>
				<th>Toler.</th> {for $foo=1 to $view.sample_size}
				<th>{$foo}</th> {/for}
			</tr>
			<tr>
				<td rowspan="2">20,5</td>
				<td>+0,5</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
			</tr>
			<tr>
				<td>0</td>
			</tr>
			<tr>
				<td rowspan="2">20,5</td>
				<td>+0,5</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
			</tr>
			<tr>
				<td>0</td>
			</tr>
			<tr>
				<td rowspan="2">20,5</td>
				<td>+0,5</td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
				<td rowspan="2"></td>
			</tr>
			<tr>
				<td>0</td>
			</tr>
		</tbody>
	</table>

</div>