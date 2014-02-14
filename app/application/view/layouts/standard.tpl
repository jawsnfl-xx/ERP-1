<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- Bootstrap -->
<link href="../public/css/bootstrap.css" rel="stylesheet">
<link href="../public/css/dashboard.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
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
				<a class="navbar-brand" href="?url=home/index">Nazwa firmy /
					logotyp</a>
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
							<li><a href="?url=home/settings/access_permissions">Uprawnienia
									dostępu</a></li>
							<li><a href="?url=home/settings/properties">Właściwości</a></li>
							<li><a href="?url=home/settings/system_settings">Ustawienia
									systemowe</a></li>
							<li class="divider"></li>
							<li role="presentation" class="dropdown-header">Zarządzanie
								sesją</li>
							<li><a href="#">Zapamiętaj sesję na tym urządzeniu</a></li>
							<li><a href="?url=users/logout">Wyloguj</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="?url=home/index">Tablica</a></li>
				</ul>


				<hr />
				<ul class="nav nav-pills nav-stacked">
					<li><a href="?url=home/quality_management">Kontrola
							jakości</a></li>
				</ul>



				<ul class="nav nav-pills nav-stacked">
					<li><a href="?url=home/settings">Ustawienia</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">