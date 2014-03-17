<link href="/public/css/theme.css" rel="stylesheet">
<link href="/public/css/dashboard.css" rel="stylesheet">
<link href="/public/css/print.css" rel="stylesheet" media="print">
<body data-spy="scroll" data-target="">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					Możesz teraz zeskanować kod <input type="text" class="form-control"
						placeholder="Text input">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/home/index">Nazwa firmy / logotyp</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<!-- Button trigger modal -->
							<button class="btn btn-primary " data-toggle="modal"
								data-target="#myModal">skanuj kod</button>
							<input type="text" class="form-control" placeholder="Wpisz kod">
						</div>
						<button type="submit" class="btn btn-default">Szukaj...</button>
					</form>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Menu<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li role="presentation" class="dropdown-header">Ustawienia</li>
							<li><a href="/home/settings/access_permissions">Uprawnienia
									dostępu</a></li>
							<li><a href="/home/settings/properties">Właściwości</a></li>
							<li><a href="/home/settings/system_settings">Ustawienia
									systemowe</a></li>
							<li class="divider"></li>
							<li role="presentation" class="dropdown-header">Zarządzanie
								sesją</li>
							<li><a href="#">Zapamiętaj sesję na tym urządzeniu</a></li>
							<li><a href="/users/logout">Wyloguj</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4 col-md-2 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="/home/index">Tablica</a></li>
				</ul>
				<hr />
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/module/quality_management">Kontrola jakości</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/home/settings">Ustawienia</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/module/product_technology/product">Produkt</a></li>
					<li><a href="/module/product_technology/technology">Technologie</a></li>
				</ul>
				<ul>
					<div class="alert alert-primary alert-dismissable">
						W razie kłopotów, kilkaj <a href="/content/about"
							class="alert-link">w taki fajny link do strony pomocy</a>
					</div>
				</ul>
			</div>
			<div class="col-sm-8 col-sm-offset-4 col-md-10 col-md-offset-2 main">