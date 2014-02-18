{if $parameters['1'] eq '' }
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
			<th>{$row['id_products']}</th>
			<td><a
				href="?url=home/product_technology/product/view/{$row['id_products']}">{$row['products_name']}</a></td>
			<td>{$row['units_id_units_primary']}</td>
			<td>{$row['units_id_units_secondary']}</td>
		</tr>
		{/foreach}
	</table>
	<div class="panel-footer">Nunc luctus, lacus id aliquet bibendum,
		nunc mauris imperdiet urna</div>
</div>
{elseif $parameters['1'] eq 'view' and $parameters['2'] neq '' }
<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>

		<h4>TODO:</h4>
		<ul>
			<li>podział na arkusze:
				<ul>
					<li>informacje ogólne,</li>
					<li>technologia</li>
					<li>kontrola</li>
				</ul>
			</li>
			<li>sprawdzanie stanu wypełnienia danych dla produktu</li>
			<li>w przyszłości: obliczałkę tego, jaki jest poziom
				uzupełnienia danych dla poszczególnego produktu</li>
		</ul>
	</div>
	<div class="panel-body">
		<ul>
			{foreach from=$table['product']['view'] item=row}
			<li>{$row['id_products']}</li>
			<li>{$row['products_name']}</li>
			<li>{$row['units_id_units_primary']}</li>
			<li>{$row['units_id_units_secondary']}</li> {/foreach}
		</ul>
	</div>
	<div class="panel-footer">Nunc luctus, lacus id aliquet bibendum,
		nunc mauris imperdiet urna</div>
</div>
{/if}
