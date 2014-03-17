
<div class="panel panel-default">
	<div class="panel-heading">
		Nunc luctus, lacus id aliquet bibendum, nunc mauris imperdiet urna
		<div class="pull-right">
			<a href="javascript:window.print()" type="button"
				class="btn btn-default"> <span class="glyphicon glyphicon-print"></span>
			</a>
		</div>
	</div>
	<div class="panel-body"></div>
	<table class="table table-responsive table-bordered">
		{foreach from=$table['quality_management']['view'] item=row name=row}
		<tr>
			<th colspan="2" rowspan="3"></th>
			<th>nr koła</th>
			<td>{$row.products_name}</td>
			<th>kontroler</th>
			<td>lorem ipsum</td>
			<th>pakowacz</th>
			<td>twój stary</td>

		</tr>
		<tr>

			<th>nr zlecenia</th>
			<td>795666</td>
			<th>szt w zleceniu</th>
			<td>36</td>
			<th>data wysyłki</th>
			<td>{$row.date_end|truncate:10:""}</td>

		</tr>
		<tr>
			<th>data pomiaru</th>
			<td>{$row.date_end|truncate:10:""}</td>
			<th>szt w palecie</th>
			<td>36</td>
			<th>nr palety</th>
			<td>666999</td>
		</tr>
		{/foreach}
		<tr></tr>
		<tr>
			<th>badane sztuki</th>
			<th>5</th>
			<th colspan="6">Numer próbki</th>
		</tr>

		<th>badany wymiar</th>
		<th>Tolerancja</th>
		<th>1</th>
		<th>2</th>
		<th>3</th>
		<th>4</th>
		<th>5</th>
		<th></th>
		</tr>
		<tbody>
			{foreach from=$table['dimension']['list'] item=row name=row}
			<tr>
				<td><h3>{$row.value}</h3></td>
				<td>
					<div class="row">
						<div class="col-md-1">
							<h3>{$row.tolerance}</h3>
						</div>
						<div class="col-md-1">
							<div class="row">
								<div class="col-md-1">
									<span> <small>{$row.interval_min}</small>
									</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-1">
									<span> <small>{$row.interval_max}</small>
									</span>
								</div>
							</div>
						</div>
					</div>
				</td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

			</tr>
			{/foreach}
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span>&plusmn; 0,2</span></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><span>&#8960; 257</span></td>
				<td><span>+0,2<br />-0,5
				</span></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><span>89,7</span></td>
				<td>
					<div class="row dimension">
						<div class="col-sm-3">
							<span><br /> <strong>N6</strong></span>
						</div>
						<div class="col-sm-8 col-sm-offset-1">
							<div class="row">
								<span>-0,02</span>
							</div>
							<div class="row">
								<span>-0,06</span>
							</div>
						</div>
					</div>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td>
					<div class="media">
						<div class="pull-left">
							<img class="media-object"
								src="http://cdn.scratch.mit.edu/static/site/projects/thumbnails/211/3049.png"
								alt="..." width="55" height="55">
						</div>
						<span>0,05A</span>
					</div>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span></span></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span></span></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span></span></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span></span></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span></span></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span></span></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
			</tr>
			<tr>
				<td><span>&#8960; 56</span></td>
				<td><span></span></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
				<td><input type="text" class="form-control input-sm"
					id="exampleInputEmail1" placeholder=""
					style="magin: 0; border: 0; box-shadow: none;"></td>
			</tr>
		</tbody>
	</table>
	<ul class="list-group">
		<li class="list-group-item">Cras justo odio</li>
		<li class="list-group-item">Dapibus ac facilisis in</li>
		<li class="list-group-item">Morbi leo risus</li>
		<li class="list-group-item">Porta ac consectetur ac</li>
		<li class="list-group-item">Vestibulum at eros</li>
	</ul>
	<div class="panel-footer">
		<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Quisque semper nulla at rhoncus tincidunt.</h3>
	</div>

</div>