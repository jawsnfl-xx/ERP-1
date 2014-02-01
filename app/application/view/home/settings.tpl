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
{if $parameters['0'] eq 'access_permissions'}
<h1>access permissions</h1>
{elseif $parameters['0'] eq 'properties'}
<h1>properties</h1>
{elseif $parameters['0'] eq 'system_settings'}
<h1>system settings</h1>
{else}
<div id="container">

	<div class="panel panel-default">
		<div class="panel-heading">Nunc luctus, lacus id aliquet
			bibendum, nunc mauris imperdiet urna</div>
		<div class="panel-body">
			<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
				erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
				vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
				ultricies commodo.</p>
		</div>
	</div>
</div>
{/if}
</div>
<script src="../public/js/jquery.js"></script>
<script src="../public/js/bootstrap.js"></script>
</body>
</html>
