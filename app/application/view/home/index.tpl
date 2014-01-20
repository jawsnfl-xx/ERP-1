{include file='./menu.tpl'}
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
