{include file='./menu.tpl'}
<div class="container">
	<div class="row">
		<div class="col-md-3">{include file='./vmenu.tpl'}</div>
		<div class="col-md-9">
			<ol class="breadcrumb">
				<li><a href="?url=home/index">Główna</a></li>
				<li><a href="?url=home/quality_management">Zarządzanie
						jakością</a></li> {if $parameters['0'] eq 'review'}
				<li class="active">Przegląd raportów</li> {elseif $parameters['0']
				eq 'add'}
				<li class="active">Dodaj</li> {else} {/if}
			</ol>

			{if $parameters['0'] eq 'review'}
			<h1>review</h1>
			{elseif $parameters['0'] eq 'add'}
			<h1>add</h1>
			{else} {/if}
		</div>
	</div>
</div>
<script src="../public/js/jquery.min.js"></script>
<script src="../public/js/bootstrap.min.js"></script>
</body>
</html>
