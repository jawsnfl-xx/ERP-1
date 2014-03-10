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
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-6">
					<div class="panel panel-default">
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
							<div class="panel panel-default">
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
							<div class="panel panel-default">
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

