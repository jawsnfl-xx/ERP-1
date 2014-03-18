{include file='../layouts/navigation.tpl'}
<ol class="breadcrumb">
	<li><a href="/home/index">Główna</a></li>
	<li class="active">{if $parameters['0'] neq ''} <a
		href="/module/quality_management"><span>Kontrola jakości</span></a>
		{else}<span>Kontrola jakości</span> {/if}
	</li> {if $parameters['0'] eq 'add'}
	<li class="active"><span>Dodaj</span></li> {elseif $parameters['0'] eq
	'view'}
	<li class="active"><span>Przegląd</span></li> {elseif $parameters['0']
	eq 'view'}
	<li class="active"><span>Szczegóły</span></li> {else} {/if}
</ol>
{if $parameters['0'] eq '' }
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Kontrola jakości</h3>
		<p>Kontrola jakości pozwala (póki co) na tworzenie, przegląd i
			edycję arkuszy kontrolnych.</p>
	</div>
	<div class="panel-body">

		<div class="row">
			<div class="col-md-6">
				<h2>Utwórz</h2>
				<h5>Tworzenie nowego arkusza.</h5>
				<h5>Tutaj możesz utworzyć nowy arkusz kontroli pomiaru.</h5>
				<div>
					<a class="btn btn-primary btn-block"
						href="/module/quality_management/add" role="button">Dalej
						&raquo;</a>
				</div>
			</div>
			<div class="col-md-6">
				<h2>Przegląd</h2>
				<h5>Ta opcja pozwala na przegląd dotychczas utworzonych
					arkuszy.</h5>
				<h5>Umożliwia również ich edycję, wydruk i pobranie.</h5>
				<div>
					<a class="btn btn-default btn-block"
						href="/module/quality_management/review" role="button">Dalej
						&raquo;</a>
				</div>
			</div>
		</div>
	</div>
</div>
{elseif $parameters['0'] eq 'view' } {include
file='./quality_management/view.tpl'} {elseif $parameters['0'] eq
'review' } {include file='./quality_management/review.tpl'} {elseif
$parameters['0'] eq 'add' } {include
file='./quality_management/add.tpl'} {/if}