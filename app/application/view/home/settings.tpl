{include file='./menu.tpl'} {if $parameters['0'] eq
'access_permissions'}
<h1>access permissions</h1>
{elseif $parameters['0'] eq 'properties'}
<h1>properties</h1>
{elseif $parameters['0'] eq 'system_settings'}
<h1>system settings</h1>
{else}
<h4>pusto</h4>
{/if}

<script src="../public/js/jquery.min.js"></script>
<script src="../public/js/bootstrap.min.js"></script>
</body>
</html>
