<div class="container">
	<nav class="navbar navbar-default" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="?url=home/index">Simple ERP System</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav col-lg-3">
				<li class="active"><a href="#">Link</a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav col-lg-3">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group input-group-sm">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Szukaj...</button>
							</span>
						</div>
					</div>
				</form>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-book"></span></a></li>
				<li><a href="#"><span class="glyphicon glyphicon-bell"></span></a></li>
				<li><a href="#"><span class="glyphicon glyphicon-barcode"></span></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Session <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li role="presentation" class="dropdown-header">Zarządzanie
							sesją</li>
						<li><a href="#">Zapamiętaj sesję na tym urządzeniu</a></li>
						<li><a href="#">Wyloguj</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-9">
			<div class="container">
				<ul>
					{foreach from=$parameters item=foo}
					<li>{$foo}</li> {/foreach}
				</ul>
			</div>
			<div class="container">
				<p>
					@TODO:<br /> Koniecznie zrobic:
				<ul>
					<li>obsługę <strong>ref</strong> i <strong>ret</strong></li>
					<li>obsługę <strong>action</strong></li>
				</ul>
				</p>
				<h3>Naprawić SMARTY!!</h3>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="../public/js/bootstrap.min.js"></script>
</body>
</html>
