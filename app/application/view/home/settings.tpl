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
						<th>ytuk</th>
						<th>Header 2</th>
						<th>Header 3</th>
						<th>Header 4</th>
						<th>Header 5</th>
					</tr>
					<tr>
						<td><input type="email" class="form-control" id="inputEmail3"
							placeholder="Email"></td>
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

			{elseif $parameters['0'] eq 'properties'}

			<ul class="nav nav-tabs">
				<li
					{if $parameters['0'] eq 'properties'  and  $parameters['1'] eq ''} class="active"{/if} ><a
					href="?url=home/settings/properties">Właściwości</a></li>
				<li
					{if $parameters['0'] eq 'properties' and  $parameters['1'] eq 'kotki'} class="active"{/if} ><a
					href="?url=home/settings/properties/kotki">kotki</a></li>
				<li
					{if $parameters['0'] eq 'properties' and  $parameters['1'] eq 'form'} class="active"{/if} ><a
					href="?url=home/settings/properties/form">formularz</a></li>
			</ul>

			{if $parameters['0'] eq 'properties' and $parameters['1'] eq ''}

			<h1>właściwości</h1>
			{/if} {if $parameters['0'] eq 'properties' and $parameters['1'] eq
			'kotki'}
			<div id="container" style="margin-top: 10px;">
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img class="img-thumbnail"
								src="http://www.bozatomozna.com.pl/fotki/jdtljeqbt.jpg"
								alt="kotek">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Sed lacus ante, ullamcorper at pellentesque ac, accumsan
									sed felis. Cras ultrices nibh ut eleifend semper. Aliquam
									mattis vulputate tellus, non auctor sem feugiat non. Nulla
									congue risus arcu, a aliquam est egestas in. Nunc egestas
									turpis nec magna ultricies sollicitudin. Fusce pretium bibendum
									enim sit amet malesuada. Donec et molestie elit. Sed pretium
									venenatis tempus. Praesent lorem felis, scelerisque ac blandit
									in, scelerisque non dolor. Morbi non arcu dapibus, tincidunt
									metus et, malesuada orci. Praesent a quam sed dui accumsan
									viverra ac eu sapien. Nulla sed mi a mauris imperdiet dictum.
									Class aptent taciti sociosqu ad litora torquent per conubia
									nostra, per inceptos himenaeos. Proin ac libero at justo
									gravida rhoncus.</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">lubię</a> <a
										href="#" class="btn btn-default" role="button">udostępniam</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img class="img-thumbnail" src="http://kociarze.com.pl/13.jpg"
								alt="kotek">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Sed lacus ante, ullamcorper at pellentesque ac, accumsan
									sed felis. Cras ultrices nibh ut eleifend semper. Aliquam
									mattis vulputate tellus, non auctor sem feugiat non. Nulla
									congue risus arcu, a aliquam est egestas in. Nunc egestas
									turpis nec magna ultricies sollicitudin. Fusce pretium bibendum
									enim sit amet malesuada. Donec et molestie elit. Sed pretium
									venenatis tempus. Praesent lorem felis, scelerisque ac blandit
									in, scelerisque non dolor. Morbi non arcu dapibus, tincidunt
									metus et, malesuada orci. Praesent a quam sed dui accumsan
									viverra ac eu sapien. Nulla sed mi a mauris imperdiet dictum.
									Class aptent taciti sociosqu ad litora torquent per conubia
									nostra, per inceptos himenaeos. Proin ac libero at justo
									gravida rhoncus.</p>
								<p>
									<a href="#" class="btn btn-success" role="button"><span
										class="glyphicon glyphicon-thumbs-up"></span> lubię <span
										class="badge ">42</span></a> <a href="#" class="btn btn-default"
										role="button">udostępniam</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img class="img-thumbnail"
								src="http://www.effendi.pl/koty/rubiniam.jpg" alt="kotek">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Sed lacus ante, ullamcorper at pellentesque ac, accumsan
									sed felis. Cras ultrices nibh ut eleifend semper. Aliquam
									mattis vulputate tellus, non auctor sem feugiat non. Nulla
									congue risus arcu, a aliquam est egestas in. Nunc egestas
									turpis nec magna ultricies sollicitudin. Fusce pretium bibendum
									enim sit amet malesuada. Donec et molestie elit. Sed pretium
									venenatis tempus. Praesent lorem felis, scelerisque ac blandit
									in, scelerisque non dolor. Morbi non arcu dapibus, tincidunt
									metus et, malesuada orci. Praesent a quam sed dui accumsan
									viverra ac eu sapien. Nulla sed mi a mauris imperdiet dictum.
									Class aptent taciti sociosqu ad litora torquent per conubia
									nostra, per inceptos himenaeos. Proin ac libero at justo
									gravida rhoncus.</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">lubię</a> <a
										href="#" class="btn btn-default" role="button">udostępniam</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			{/if} {if $parameters['0'] eq 'properties' and $parameters['1'] eq
			'form'}
			<div class="container">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="inputEmail3" class="col-md-4 control-label">Email</label>
						<div class="col-md-4">
							<input type="email" class="form-control" id="inputEmail3"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-md-4 control-label">Password</label>
						<div class="col-md-4">
							<input type="password" class="form-control" id="inputPassword3"
								placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-md-4">
							<div class="checkbox">
								<label> <input type="checkbox"> Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-md-4">
							<button type="submit" class="btn btn-default">Sign in</button>
						</div>
					</div>
				</form>

			</div>
			{/if} {elseif $parameters['0'] eq 'system_settings'}
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
