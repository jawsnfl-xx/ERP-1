{include file='./menu.tpl'}
<ol class="breadcrumb">
	<li><a href="?url=home/index">Główna</a></li>
	<li><a href="?url=home/settings">Ustawienia</a></li> {if
	$parameters['0'] eq 'access_permissions'}
	<li class="active">access permissions</li> {elseif $parameters['0'] eq
	'properties'}
	<li class="active">properties</li> {elseif $parameters['0'] eq
	'system_settings'}
	<li class="active">system settings</li> {else} {/if}
</ol>
<div id="container">

	<div class="row">
		<div class="col-md-3">

			<div class="panel panel-default">
				<div class="panel-heading">
					<a href="?url=home/settings/">Ustawienia ogólne</a>
				</div>
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="?url=home/settings/access_permissions">Uprawnienia
								dostępu</a></li>
						<li><a href="?url=home/settings/properties">Właściwości</a></li>
						<li><a href="?url=home/settings/system_settings">Ustawienia
								systemowe</a></li>
					</ul>

				</div>
			</div>
		</div>
		<div class="col-md-9">

			{if $parameters['0'] eq 'access_permissions'}

			<div class="panel panel-default">
				<div class="panel-heading">Nunc luctus, lacus id aliquet
					bibendum, nunc mauris imperdiet urna</div>
				<div class="panel-body">
					<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit.
						Aliquam erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a
						accumsan vehicula. Vestibulum nec ultrices mi, ut rutrum elit.
						Nunc cursus ultricies commodo.</p>
				</div>

				<table class="table table-bordered">
					<tr>
						<th>Header 1</th>
						<th>Header 2</th>
						<th>Header 3</th>
						<th>Header 4</th>
						<th>Header 5</th>
					</tr>
					<tr>
						<td>Row:1 Cell:1</td>
						<td>Row:1 Cell:2</td>
						<td>Row:1 Cell:3</td>
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
						<td>Row:3 Cell:4</td>
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
						<td>Row:6 Cell:3</td>
						<td>Row:6 Cell:4</td>
						<td>Row:6 Cell:5</td>
					</tr>
				</table>

			</div>

			{elseif $parameters['0'] eq 'properties'}

			<ul class="nav nav-tabs">
				<li {if $parameters['0'] eq 'properties'  and  $parameters['1'] eq ''} class="active"{/if} ><a
					href="?url=home/settings/properties">Właściwości</a></li>
				<li {if $parameters['0'] eq 'properties' and  $parameters['1'] eq 'sample1'} class="active"{/if} ><a href="?url=home/settings/properties/sample1">Sample1</a></li>
				<li {if $parameters['0'] eq 'properties' and  $parameters['1'] eq 'sample2'} class="active"{/if} ><a href="?url=home/settings/properties/sample2">Sample2</a></li>
			</ul>


			{elseif $parameters['0'] eq 'system_settings'}
			<h1>system settings</h1>
			{else}


			<div class="panel panel-default">
				<div class="panel-heading">Nunc luctus, lacus id aliquet
					bibendum, nunc mauris imperdiet urna</div>
				<div class="panel-body">
					<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit.
						Aliquam erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a
						accumsan vehicula. Vestibulum nec ultrices mi, ut rutrum elit.
						Nunc cursus ultricies commodo.</p>
				</div>
			</div>

		</div>
		{/if}
	</div>
</div>
<script src="../public/js/jquery.js"></script>
<script src="../public/js/bootstrap.js"></script>
</body>
</html>
