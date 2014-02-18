<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>
	</div>
	<table class="table table-bordered">
		{foreach from=$table['product']['list'] item=row}
		<tr>
			{foreach from=$row item=col}
			<td>{$col}</td> {/foreach}
		</tr>
		{/foreach}
	</table>
	<div class="panel-footer">Nunc luctus, lacus id aliquet bibendum,
		nunc mauris imperdiet urna</div>
</div>
