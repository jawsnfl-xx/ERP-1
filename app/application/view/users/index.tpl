<div class="container">
	<form class="form-signin" role="form" action="/users/login"
		method="post">
		<h2 class="form-signin-heading">Proszę, zaloguj się</h2>
		<input type="hidden" name="login" value="true" /> <input name="name"
			type="text" class="form-control" placeholder="nazwa użytkownika"
			required autofocus> <input name="password" type="password"
			class="form-control" placeholder="password" required> <label
			class="checkbox"> <input type="checkbox" value="remember-me">
			Zapamiętaj moje logowanie
		</label> <input class="btn btn-lg btn-primary btn-block" type="submit"
			value="Zaloguj" />
	</form>
</div>
<script src="/public/js/jquery.min.js"></script>
<script src="/public/js/bootstrap.min.js"></script>
</body>
</html>
