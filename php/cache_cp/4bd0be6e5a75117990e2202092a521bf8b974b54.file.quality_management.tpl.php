<?php /* Smarty version Smarty-3.1.16, created on 2014-03-04 14:48:18
         compiled from "C:\Users\Marcin Pyrka\Documents\GitHub\ERP\php\application\view\home\quality_management.tpl" */ ?>
<?php /*%%SmartyHeaderCode:156065315e7b2a48a32-23926572%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4bd0be6e5a75117990e2202092a521bf8b974b54' => 
    array (
      0 => 'C:\\Users\\Marcin Pyrka\\Documents\\GitHub\\ERP\\php\\application\\view\\home\\quality_management.tpl',
      1 => 1393944033,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '156065315e7b2a48a32-23926572',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'parameters' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_5315e7b2ae8a10_81742312',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5315e7b2ae8a10_81742312')) {function content_5315e7b2ae8a10_81742312($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('../layouts/navigation.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<ol class="breadcrumb">
	<li><a href="/home/index">Główna</a></li>
	<li class="active"><?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']!='') {?> <a
		href="/home/quality_management"><span>Kontrola jakości</span></a>
		<?php } else { ?><span>Kontrola jakości</span> <?php }?>
	</li> <?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='add') {?>
	<li class="active"><span>Dodaj</span></li> <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='view') {?>
	<li class="active"><span>Przegląd</span></li> <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='view') {?>
	<li class="active"><span>Szczegóły</span></li> <?php } else { ?> <?php }?>
</ol>
<?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='') {?>
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
<?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='view') {?> <?php echo $_smarty_tpl->getSubTemplate ('./quality_management_view.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
 <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='review') {?> <?php echo $_smarty_tpl->getSubTemplate ('./quality_management_review.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
 <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='add') {?> <?php echo $_smarty_tpl->getSubTemplate ('./quality_management_add.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
 <?php }?>
<script src="/public/js/jquery.js"></script>
<script src="/public/js/bootstrap.js"></script>
</body>
</html><?php }} ?>
