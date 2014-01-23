{include file='./menu.tpl'}
<div class="container">
	<div class="row">
		<div class="col-md-3">{include file='./vmenu.tpl'}</div>
		<div class="col-md-9">
			<ol class="breadcrumb">
				<li><a href="?url=home/index">Główna</a></li>
				<li><a href="?url=home/settings">Ustawienia</a></li> {if
				$parameters['0'] eq 'access_permissions'}
				<li class="active">access permissions</li> {elseif $parameters['0']
				eq 'properties'}
				<li class="active">properties</li> {elseif $parameters['0'] eq
				'system_settings'}
				<li class="active">system settings</li> {else} {/if}
			</ol>

			{if $parameters['0'] eq 'access_permissions'}
			<h1>access permissions</h1>
			{elseif $parameters['0'] eq 'properties'}
			<h1>properties</h1>
			{elseif $parameters['0'] eq 'system_settings'}
			<h1>system settings</h1>
			{else} {/if}
		</div>
	</div>
</div>

<script src="../public/js/jquery.min.js"></script>
<script src="../public/js/bootstrap.min.js"></script>
</body>
</html>
