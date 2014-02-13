<ol class="breadcrumb">
	<li><a href="?url=home/index">Główna</a></li>
	<li class="active">{if $parameters['0'] neq ''} <a
		href="?url=home/quality_management"><span>Kontrola jakości</span></a>
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
				<p>Maecenas congue mollis rutrum. Fusce dictum a neque in
					feugiat. Donec nulla risus, varius nec diam in, fringilla mattis
					nulla. In tincidunt sapien vel diam ullamcorper ultricies. Maecenas
					nec sem elit. Interdum et malesuada fames ac ante ipsum primis in
					faucibus. Etiam lacinia convallis vulputate.</p>
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
				<p>Proin eu ullamcorper nisi. Proin sit amet tristique arcu.
					Vestibulum ullamcorper fringilla rhoncus. Sed euismod risus lorem,
					eget ultrices lorem consequat eu. Phasellus tempor iaculis eros sed
					vestibulum. Quisque at odio ac dolor viverra molestie. Lorem ipsum
					dolor sit amet, consectetur adipiscing elit. Vestibulum non orci
					justo.</p>
				<div>
					<a class="btn btn-primary btn-block"
						href="?url=home/quality_management/add" role="button">Dalej
						&raquo;</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-body">
				<h2>Przegląd</h2>
				<p>Duis mollis, est non commodo luctus, nisi erat porttitor
					ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
					purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
					tortor mauris condimentum nibh.</p>
				<div>
					<a class="btn btn-default btn-block"
						href="?url=home/quality_management/review" role="button">Dalej
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

<script src="../public/js/jquery.js"></script>
<script src="../public/js/bootstrap.js"></script>
</body>
</html>