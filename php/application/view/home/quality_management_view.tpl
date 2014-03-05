<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body"></div>
	<table class="table table-responsive table-bordered">
		{foreach from=$table['quality_management']['view'] item=row name=row}
		<tr>
			<th rowspan="2" colspan="2"></th>
			<th>nazwa detalu</th>
			<th>{$row.products_name}</th>
			<th>data wykonania</th>
			<th colspan="2">{$row.date_end}</th>
		</tr>
		<tr>

			<th colspan="4"><tr>
			{/foreach}

			<th colspan="2">badany wymiar
		</th>

			<th>1</th>
			<th>2</th>
			<th>3</th>
			<th>4</th>
			<th>5</th>
		</tr>
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
		{/foreach}
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
			<td><span>&#8960; 257</span></td>
			<td><span>0,2<br />0
			</span></td>
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
			<td><span>89,7</span></td>
			<td><span>34</span></td>
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

	</table>

		 <ul class="list-group">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Morbi leo risus</li>
    <li class="list-group-item">Porta ac consectetur ac</li>
    <li class="list-group-item">Vestibulum at eros</li>
  </ul>

	<div class="panel-footer">Panelowa stópka</div>
</div>