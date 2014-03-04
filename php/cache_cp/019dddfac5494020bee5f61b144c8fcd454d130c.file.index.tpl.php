<?php /* Smarty version Smarty-3.1.16, created on 2014-03-04 14:47:57
         compiled from "C:\Users\Marcin Pyrka\Documents\GitHub\ERP\php\application\view\users\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:119005315e79d63d9f8-87448052%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '019dddfac5494020bee5f61b144c8fcd454d130c' => 
    array (
      0 => 'C:\\Users\\Marcin Pyrka\\Documents\\GitHub\\ERP\\php\\application\\view\\users\\index.tpl',
      1 => 1393944033,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '119005315e79d63d9f8-87448052',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_5315e79d673c95_21841385',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5315e79d673c95_21841385')) {function content_5315e79d673c95_21841385($_smarty_tpl) {?><link href="/public/css/signin.css" rel="stylesheet">
<link href="/public/css/sticky-footer-navbar.css" rel="stylesheet">
<div class="container-fluid">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">

			<p class="navbar-text navbar-right">
				Potrzebujesz dostępu do aplikacji? <a href="/users/signup"
					type="button" class="navbar-link btn btn-default">Złóż
					zapytanie o założenie konta</a>
			</p>
		</div>
	</nav>
</div>

<div class="container">
	<div class="row">

		<div class="container col-md-6">
			<h1><strong>Simple ERP System</strong></h1>
			<p>Aliquam tincidunt sem et nibh mattis, tincidunt viverra dolor
				mollis. Integer convallis elementum lorem nec scelerisque.
				Pellentesque habitant morbi tristique senectus et netus et malesuada.</p>
			<div class="row">
				<div class="col-md-6">
					<h4>Curabitur id metus sodales</h4>
					<p>Class aptent taciti sociosqu ad litora torquent per conubia
						nostra, per inceptos himenaeos. Sed ante eros, ultrices vitae urna
						vel, tincidunt dictum magna. Vestibulum varius felis sit amet
						cursus ultrices.</p>
				</div>
				<div class="col-md-6">
					<h4>Sed id blandit ante</h4>
					<p>Suspendisse id lobortis enim. Ut ultrices, dolor id varius
						dapibus, nibh risus pretium mi, et consequat est nisi sit amet
						risus. Cras vestibulum condimentum neque, sit amet feugiat dolor
						commodo a. Pellentesque habitant morbi tristique senectus et netus
						et malesuada fames ac turpis egestas.</p>
				</div>
			</div>
		</div>
		<div class="container col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Proszę, zaloguj się</h3>
				</div>
				<div class="panel-body">
					<p>Proszę się zalogować używając swojej nazwy użytkownika oraz swojego hasła.</p>
					<p>Jeśli nie posiadasz własnego konta, możesz złożyć zapytanie o założenie nowego (prawy górny róg).</p> 
					<form class="form-signin" role="form" action="/users/login"
						method="post">
						<h2 class="form-signin-heading"></h2>
						<input type="hidden" name="login" value="true" /> <input
							name="name" type="text" class="form-control"
							placeholder="nazwa użytkownika" required autofocus> <input
							name="password" type="password" class="form-control"
							placeholder="password" required> <label class="checkbox">
							<input type="checkbox" value="remember-me"> Zapamiętaj
							moje logowanie
						</label> <input class="btn btn-primary btn-block" type="submit"
							value="Zaloguj" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="footer">
	<div class="container">
		<p class="text-muted">Place sticky footer content here.</p>
	</div>
</div>
<script src="/public/js/jquery.min.js"></script>
<script src="/public/js/bootstrap.min.js"></script>
</body>
</html>
<?php }} ?>
