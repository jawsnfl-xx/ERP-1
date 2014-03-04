<?php /* Smarty version Smarty-3.1.16, created on 2014-03-04 14:47:57
         compiled from "C:\Users\Marcin Pyrka\Documents\GitHub\ERP\php\application\view\home\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:296245315e79d54fb34-74421875%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6663911fe5dae2ea682434f51c2eb6cc361cccc6' => 
    array (
      0 => 'C:\\Users\\Marcin Pyrka\\Documents\\GitHub\\ERP\\php\\application\\view\\home\\index.tpl',
      1 => 1393538074,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '296245315e79d54fb34-74421875',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_5315e79d55dcc5_12067913',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5315e79d55dcc5_12067913')) {function content_5315e79d55dcc5_12067913($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('../layouts/navigation.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<h1 class="page-header">Dashboard</h1>
<div class="row">
	<div class="col-lg-4">
		<h2>Kontrola jakości</h2>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis
			euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi
			leo risus, porta ac consectetur ac, vestibulum at eros. Praesent
			commodo cursus magna.</p>
		<p>
			<a class="btn btn-default" href="/home/quality_management"
				role="button">View details &raquo;</a>
		</p>
	</div>
	<div class="col-lg-4">
		<h2>Produkcja i technologia</h2>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis
			euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi
			leo risus, porta ac consectetur ac, vestibulum at eros. Praesent
			commodo cursus magna.</p>
		<p>
			<a class="btn btn-default" href="/home/product_technology"
				role="button">Pokaż szczegóły &raquo;</a>
		</p>
	</div>
</div>
<script src="/public/js/jquery.js"></script>
<script src="/public/js/bootstrap.js"></script>
</body>
</html><?php }} ?>
