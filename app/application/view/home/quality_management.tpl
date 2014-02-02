{include file='./menu.tpl'}
<div class="container-fluid">
	{if $parameters['0'] eq '' }
	<!-- Two columns of text -->
	<div class="row">
		<div class="col-lg-4">


			<h2>Utwórz</h2>
			<p>Tworzenie nowego arkusza x</p>
			<p>
				<a class="btn btn-default" href="?url=home/quality_management/add"
					role="button">Dalej &raquo;</a>
			</p>
		</div>
		<!-- /.col-lg-4 -->
		<div class="col-lg-4">
			<h2>Przegląd</h2>
			<p>Duis mollis, est non commodo luctus, nisi erat porttitor
				ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
				purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
				tortor mauris condimentum nibh.</p>
			<p>
				<a class="btn btn-default"
					href="?url=home/quality_management/review" role="button">Dalej
					&raquo;</a>
			</p>
		</div>
		<!-- /.col-lg-4 -->
		<div class="col-lg-4"></div>
		<!-- /.row -->

		<script src="../public/js/jquery.js"></script>
		<script src="../public/js/bootstrap.js"></script>
	</div>

	{elseif $parameters['0'] eq 'review' }

	<p>review</p>
	{elseif $parameters['0'] eq 'view' }

	<p>view</p>
	{elseif $parameters['0'] eq 'add' }
	<p>add</p>
	{/if}
</div>
</div>
</div>


<script src="../public/js/jquery.js"></script>
<script src="../public/js/bootstrap.js"></script>
</body>
</html>