<?php /* Smarty version Smarty-3.1.16, created on 2014-03-04 14:48:20
         compiled from "C:\Users\Marcin Pyrka\Documents\GitHub\ERP\php\application\view\home\product_technology.tpl" */ ?>
<?php /*%%SmartyHeaderCode:49645315e7b4321cc0-38709140%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '27954a4add7aed0478a3dd23473ff3d93eff3aa9' => 
    array (
      0 => 'C:\\Users\\Marcin Pyrka\\Documents\\GitHub\\ERP\\php\\application\\view\\home\\product_technology.tpl',
      1 => 1393538074,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '49645315e7b4321cc0-38709140',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'parameters' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_5315e7b43c2a44_06170339',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5315e7b43c2a44_06170339')) {function content_5315e7b43c2a44_06170339($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('../layouts/navigation.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<ol class="breadcrumb">
	<li><a href="/home/index"><span>Główna</span></a></li>
	<li><?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']!='') {?> <a
		href="/home/product_technology"><span>Produkt i technologia</span></a>
		<?php } else { ?> <span>Produkt i technologia</span> <?php }?> <?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='product') {?>
	</li>
	<li class="active"><?php if ($_smarty_tpl->tpl_vars['parameters']->value['1']!='') {?> <a
		href="/home/product_technology/product">Produkt</a> <?php } else { ?> <span>Produkt</span>
		<?php }?>
	</li> <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='technology') {?>
	<li class="active"><span>Technologia</span></li> <?php } else { ?> <?php }?> <?php if ($_smarty_tpl->tpl_vars['parameters']->value['1']=='view') {?>
	<li class="active"><span>Szczegóły</span></li> <?php } else { ?> <?php }?>
</ol>
<?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='product') {?> <?php echo $_smarty_tpl->getSubTemplate ('./product_technology_product.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
 <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='technology') {?> <?php echo $_smarty_tpl->getSubTemplate ('./product_technology_technology.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php } else { ?>
<ul>
	<li><a href="/home/product_technology/product">Produkt</a></li>
	<li><a href="/home/product_technology/technology">Technologia</a></li>
</ul>
<?php }?>
<script src="/public/js/jquery.js"></script>
<script src="/public/js/bootstrap.js"></script>
</body>
</html><?php }} ?>
