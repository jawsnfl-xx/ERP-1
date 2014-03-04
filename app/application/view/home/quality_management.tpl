{include file='../layouts/navigation.tpl'}
<ol class="breadcrumb">
	<li><a href="/home/index">Główna</a></li>
	<li class="active">{if $parameters['0'] neq ''} <a
		href="/home/quality_management"><span>Kontrola jakości</span></a>
		{else}<span>Kontrola jakości</span> {/if}
	</li> {if $parameters['0'] eq 'add'}
	<li class="active"><span>Dodaj</span></li> {elseif $parameters['0'] eq
	'view'}
	<li class="active"><span>Przegląd</span></li> {elseif $parameters['0']
	eq 'view'}
	<li class="active"><span>Szczegóły</span></li> {else} {/if}
</ol>
{if $parameters['0'] eq '' }
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Kontrola jakości</h3>
			</div>
			<div class="panel-body">
				<p>Kontrola jakości pozwala (póki co) na tworzenie, przegląd i
					edycję arkuszy kontrolnych.</p>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-4">
		<div class="panel panel-default">
			<div class="panel-body">
				<h2>Utwórz</h2>
				<h5>Tworzenie nowego arkusza</h5>
				<p>Tutaj możesz utworzyć nowy arkusz kontroli pomiaru.</p>
				<div>
					<a class="btn btn-primary btn-block"
						href="/home/quality_management/add" role="button">Dalej
						&raquo;</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-body">
				<h2>Przegląd</h2>
				<p>Ta opcja pozwala na przegląd dotychczas utworzonych arkuszy,
					włącznie z ich edycją, drukowaniem i pobraniem.</p>
				<div>
					<a class="btn btn-default btn-block"
						href="/home/quality_management/review" role="button">Dalej
						&raquo;</a>
				</div>
			</div>
		</div>

	</div>
</div>
{elseif $parameters['0'] eq 'view' } {include
file='./quality_management_view.tpl'} {elseif $parameters['0'] eq
'review' } {include file='./quality_management_review.tpl'} {elseif
$parameters['0'] eq 'add' } {include
file='./quality_management_add.tpl'} {/if}
<script src="/public/js/jquery.js"></script>
<script src="/public/js/bootstrap.js"></script>
</body>
</html>