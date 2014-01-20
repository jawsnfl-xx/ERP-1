{include file='./menu.tpl'}
<div class="col-md-9">
	{if $parameters['0'] eq 'access_permissions'}
	<h1>access permissions</h1>
	{elseif $parameters['0'] eq 'properties'}
	<h1>properties</h1>
	{elseif $parameters['0'] eq 'system_settings'}
	<h1>system settings</h1>
	{else}
	<h4>pusto</h4>
	{/if}
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="../public/js/bootstrap.min.js"></script>
</body>
</html>