<?php /* Smarty version Smarty-3.1.16, created on 2014-03-04 14:48:20
         compiled from "C:\Users\Marcin Pyrka\Documents\GitHub\ERP\php\application\view\home\product_technology_product.tpl" */ ?>
<?php /*%%SmartyHeaderCode:270855315e7b4c48af6-34236111%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0198bc6245fe3a92b2ef7fce4708c4e82d7ef869' => 
    array (
      0 => 'C:\\Users\\Marcin Pyrka\\Documents\\GitHub\\ERP\\php\\application\\view\\home\\product_technology_product.tpl',
      1 => 1393538074,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '270855315e7b4c48af6-34236111',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'parameters' => 0,
    'table' => 0,
    'row' => 0,
    'pager' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_5315e7b4d76132_70544148',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5315e7b4d76132_70544148')) {function content_5315e7b4d76132_70544148($_smarty_tpl) {?><?php if ($_smarty_tpl->tpl_vars['parameters']->value['1']=='page') {?>
<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit. Aliquam
			erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a accumsan
			vehicula. Vestibulum nec ultrices mi, ut rutrum elit. Nunc cursus
			ultricies commodo.</p>
		<p>Zawsze istnieje możliwość wyszukania nazwy produktu</p>
		<div class="col-lg-6">
			<form role="form" method="post"
				action="/home/product_technology/product/search">
				<div class="input-group">
					<input type="text" class="form-control" id="number"
						placeholder="Wprowadź numer" name="number"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="submit">Szukaj ...</button>
					</span>
				</div>
			</form>
		</div>
		<div class="col-lg-6">
			<a href="/home/product_technology/product/add"
				class="btn btn-default">Dodaj ...</a>
		</div>
	</div>
	<table class="table table-bordered">
		<?php  $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['table']->value['product']['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['row']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['row']->key => $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['row']['iteration']++;
?>
		<tr>
			<th><?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['row']['iteration'];?>
</th>
			<td><a
				href="/home/product_technology/product/view/<?php echo $_smarty_tpl->tpl_vars['row']->value['id_products'];?>
"><?php echo $_smarty_tpl->tpl_vars['row']->value['products_name'];?>
</a></td>
			<td><?php echo $_smarty_tpl->tpl_vars['row']->value['units_id_units'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['row']->value['units_id_units1'];?>
</td>
		</tr>
		<?php } ?>
	</table>
	<div class="panel-footer">
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li> <?php  $_smarty_tpl->tpl_vars['pager'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['pager']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['table']->value['product']['pager']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['pager']->key => $_smarty_tpl->tpl_vars['pager']->value) {
$_smarty_tpl->tpl_vars['pager']->_loop = true;
?>
			<li><a
				href="/home/product_technology/product/page/<?php echo $_smarty_tpl->tpl_vars['pager']->value['page'];?>
/<?php echo $_smarty_tpl->tpl_vars['pager']->value['limit'];?>
"><?php echo $_smarty_tpl->tpl_vars['pager']->value['page'];?>
</a></li>
			<?php } ?>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
</div>
<?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['1']=='add') {?>
<div class="panel panel-default">
	<div class="panel-heading">Nunc luctus, lacus id aliquet
		bibendum, nunc mauris imperdiet urna</div>
	<div class="panel-body">
		<p>jksdf hgksjdhf gkshdgk jhsdfkjg hsdkjfhg ksjdfhg kjsdfhg
			lkjafdhgl ksjdfhglk jsdhf glkjshdlkfjgh sdlkfj hg</p>
		<form role="form" method="post"
			action="/home/product_technology/product/_add">
			<div class="input-group">
				<input type="text" class="form-control" id="number"
					placeholder="Wprowadź numer" name="number"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="submit">Dodaj</button>
				</span>
			</div>
		</form>
	</div>
</div>
<?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['1']=='view'&&$_smarty_tpl->tpl_vars['parameters']->value['2']!='') {?>
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
					<li>technologia,</li>
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
			<?php  $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['table']->value['product']['view']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['row']->key => $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->_loop = true;
?>
			<li><?php echo $_smarty_tpl->tpl_vars['row']->value['id_products'];?>
</li>
			<li><?php echo $_smarty_tpl->tpl_vars['row']->value['products_name'];?>
</li>
			<li><?php echo $_smarty_tpl->tpl_vars['row']->value['units_id_units_primary'];?>
</li>
			<li><?php echo $_smarty_tpl->tpl_vars['row']->value['units_id_units_secondary'];?>
</li> <?php } ?>
		</ul>
	</div>
	<div class="panel-footer">Nunc luctus, lacus id aliquet bibendum,
		nunc mauris imperdiet urna</div>
</div>
<?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['1']=='search') {?>
<h3>Wpisano w pole szukania:</h3>
<p><?php echo $_smarty_tpl->tpl_vars['table']->value['product']['search'];?>
</p>
<?php if ($_smarty_tpl->tpl_vars['table']->value['product']['listSearch']) {?>
<table class="table table-bordered">
	<?php  $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['table']->value['product']['listSearch']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['row']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['row']->key => $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['row']['iteration']++;
?>
	<tr>
		<th><?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['row']['iteration'];?>
</th>
		<td><a
			href="/home/product_technology/product/view/<?php echo $_smarty_tpl->tpl_vars['row']->value['id_products'];?>
"><?php echo $_smarty_tpl->tpl_vars['row']->value['products_name'];?>
</a></td>
		<td><?php echo $_smarty_tpl->tpl_vars['row']->value['units_id_units_primary'];?>
</td>
		<td><?php echo $_smarty_tpl->tpl_vars['row']->value['units_id_units_secondary'];?>
</td>
	</tr>
	<?php } ?>
</table>
<?php } else { ?>
<p>Nie znaleziono wyników</p>
<?php }?> <?php }?>
<?php }} ?>
