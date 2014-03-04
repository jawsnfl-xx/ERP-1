<?php /* Smarty version Smarty-3.1.16, created on 2014-03-04 14:48:19
         compiled from "C:\Users\Marcin Pyrka\Documents\GitHub\ERP\php\application\view\home\settings.tpl" */ ?>
<?php /*%%SmartyHeaderCode:63915315e7b37e83e1-51253346%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ff4f5c1f7a9ec96c25d1f71a476c826b342d3c0d' => 
    array (
      0 => 'C:\\Users\\Marcin Pyrka\\Documents\\GitHub\\ERP\\php\\application\\view\\home\\settings.tpl',
      1 => 1393944033,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '63915315e7b37e83e1-51253346',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'parameters' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_5315e7b38eac76_22899654',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5315e7b38eac76_22899654')) {function content_5315e7b38eac76_22899654($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('../layouts/navigation.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<ol class="breadcrumb">
	<li><a href="/home/index"><span>Główna</span></a></li>
	<li><a href="/home/settings"><span>Ustawienia</span></a></li> <?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='access_permissions') {?>
	<li class="active"><span>access permissions</span></li> <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties') {?>
	<li class="active"><span>properties</span></li> <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='system_settings') {?>
	<li class="active"><span>system settings</span></li> <?php } else { ?> <?php }?>
</ol>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="container-fluid">

					<div class="panel-title col-sm-4">Panel heading with title</div>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">x</a></li>
						<li><a href="#">y</a></li>
						<li><a href="#">z</a></li>
					</ul>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class=" col-sm-4">
						<div class="input-group">
							<input class="form-control" placeholder="Search in settings"
								type="text" aria-controls="dt_basic"> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-search"></span></span>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-4">
						<div class="input-group pull-right">
							<div class="btn-group">
								<button class="btn btn-default dropdown-toggle" type="button"
									data-toggle="dropdown">
									Wyświetl <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">10</a></li>
									<li><a href="#">25</a></li>
									<li><a href="#">50</a></li>
									<li><a href="#">100</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel-footer">
				<div class="row">
					<div class="col-sm-8">
						<p>Integer nunc eros, pellentesque et tortor eget, pharetra
							porta magna.</p>
					</div>
					<div class="col-sm-4 pull-right">
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-3">
		<div class="panel panel-default">
			<div class="panel-heading navbar navbar-default">
				<a href="/home/settings/">Ustawienia ogólne</a>
			</div>
			<div class="panel-body">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/home/settings/properties">Właściwości</a></li>
					<li><a href="/home/settings/access_permissions">Uprawnienia
							dostępu</a></li>
					<li><a href="/home/settings/system_settings">Ustawienia
							systemowe</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="alert alert-warning">
			W razie kłopotów, kilkaj <a href="#" class="alert-link">w taki
				fajny link do pliku pomocy</a>
		</div>
		<?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='access_permissions') {?>
		<div class="page-header">
			<h1>Utwórz nowy formularz</h1>
		</div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>



			<?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties') {?>
			<ul class="nav nav-tabs">
				<li
					<?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties'&&$_smarty_tpl->tpl_vars['parameters']->value['1']=='') {?> class="active"<?php }?> ><a
					href="/home/settings/properties">Właściwości</a></li>
				<li
					<?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties'&&$_smarty_tpl->tpl_vars['parameters']->value['1']=='kotki') {?> class="active"<?php }?> ><a
					href="/home/settings/properties/kotki">kotki</a></li>
				<li
					<?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties'&&$_smarty_tpl->tpl_vars['parameters']->value['1']=='form') {?> class="active"<?php }?> ><a
					href="/home/settings/properties/form">formularz</a></li>
			</ul>
			<?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties'&&$_smarty_tpl->tpl_vars['parameters']->value['1']=='') {?>
			<div class="container">
				<ul class="pagination">
					<li><a href="#">&laquo; &laquo;</a></li>
					<li><a href="#">&laquo;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
					<li><a href="#">&raquo; &raquo;</a></li>
				</ul>
			</div>
			<?php }?> <?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties'&&$_smarty_tpl->tpl_vars['parameters']->value['1']=='kotki') {?>
			<div id="container" style="margin-top: 10px;">
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img class="img-thumbnail"
								src="http://www.bozatomozna.com.pl/fotki/jdtljeqbt.jpg"
								alt="kotek">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Sed lacus ante, ullamcorper at pellentesque ac, accumsan
									sed felis. Cras ultrices nibh ut eleifend semper. Aliquam
									mattis vulputate tellus, non auctor sem feugiat non. Nulla
									congue risus arcu, a aliquam est egestas in. Nunc egestas
									turpis nec magna ultricies sollicitudin. Fusce pretium bibendum
									enim sit amet malesuada. Donec et molestie elit. Sed pretium
									venenatis tempus. Praesent lorem felis, scelerisque ac blandit
									in, scelerisque non dolor. Morbi non arcu dapibus, tincidunt
									metus et, malesuada orci. Praesent a quam sed dui accumsan
									viverra ac eu sapien. Nulla sed mi a mauris imperdiet dictum.
									Class aptent taciti sociosqu ad litora torquent per conubia
									nostra, per inceptos himenaeos. Proin ac libero at justo
									gravida rhoncus.</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">lubię</a> <a
										href="#" class="btn btn-default" role="button">udostępniam</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img class="img-thumbnail" src="http://kociarze.com.pl/13.jpg"
								alt="kotek">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Sed lacus ante, ullamcorper at pellentesque ac, accumsan
									sed felis. Cras ultrices nibh ut eleifend semper. Aliquam
									mattis vulputate tellus, non auctor sem feugiat non. Nulla
									congue risus arcu, a aliquam est egestas in. Nunc egestas
									turpis nec magna ultricies sollicitudin. Fusce pretium bibendum
									enim sit amet malesuada. Donec et molestie elit. Sed pretium
									venenatis tempus. Praesent lorem felis, scelerisque ac blandit
									in, scelerisque non dolor. Morbi non arcu dapibus, tincidunt
									metus et, malesuada orci. Praesent a quam sed dui accumsan
									viverra ac eu sapien. Nulla sed mi a mauris imperdiet dictum.
									Class aptent taciti sociosqu ad litora torquent per conubia
									nostra, per inceptos himenaeos. Proin ac libero at justo
									gravida rhoncus.</p>
								<p>
									<a href="#" class="btn btn-success" role="button"><span
										class="glyphicon glyphicon-thumbs-up"></span> lubię <span
										class="badge ">42</span></a> <a href="#" class="btn btn-default"
										role="button">udostępniam</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img class="img-thumbnail"
								src="http://www.effendi.pl/koty/rubiniam.jpg" alt="kotek">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Sed lacus ante, ullamcorper at pellentesque ac, accumsan
									sed felis. Cras ultrices nibh ut eleifend semper. Aliquam
									mattis vulputate tellus, non auctor sem feugiat non. Nulla
									congue risus arcu, a aliquam est egestas in. Nunc egestas
									turpis nec magna ultricies sollicitudin. Fusce pretium bibendum
									enim sit amet malesuada. Donec et molestie elit. Sed pretium
									venenatis tempus. Praesent lorem felis, scelerisque ac blandit
									in, scelerisque non dolor. Morbi non arcu dapibus, tincidunt
									metus et, malesuada orci. Praesent a quam sed dui accumsan
									viverra ac eu sapien. Nulla sed mi a mauris imperdiet dictum.
									Class aptent taciti sociosqu ad litora torquent per conubia
									nostra, per inceptos himenaeos. Proin ac libero at justo
									gravida rhoncus.</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">lubię</a> <a
										href="#" class="btn btn-default" role="button">udostępniam</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php }?> <?php if ($_smarty_tpl->tpl_vars['parameters']->value['0']=='properties'&&$_smarty_tpl->tpl_vars['parameters']->value['1']=='form') {?>
			<div class="container">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="inputEmail3" class="col-md-4 control-label">Email</label>
						<div class="col-md-4">
							<input type="email" class="form-control" id="inputEmail3"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-md-4 control-label">Password</label>
						<div class="col-md-4">
							<input type="password" class="form-control" id="inputPassword3"
								placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-md-4">
							<div class="checkbox">
								<label> <input type="checkbox"> Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-md-4">
							<button type="submit" class="btn btn-default">Sign in</button>
						</div>
					</div>
				</form>
			</div>
			<div class="list-group">
				<a href="#" class="list-group-item active"> Cras justo odio </a> <a
					href="#" class="list-group-item">Dapibus ac facilisis in</a> <a
					href="#" class="list-group-item">Morbi leo risus</a> <a href="#"
					class="list-group-item">Porta ac consectetur ac</a> <a href="#"
					class="list-group-item">Vestibulum at eros</a>
			</div>
			<?php }?> <?php } elseif ($_smarty_tpl->tpl_vars['parameters']->value['0']=='system_settings') {?>
			<h1>system settings</h1>
			<ul class="list-group">
				<li class="list-group-item list-group-item-success">Dapibus ac
					facilisis in</li>
				<li class="list-group-item list-group-item-info">Cras sit amet
					nibh libero</li>
				<li class="list-group-item list-group-item-warning">Porta ac
					consectetur ac</li>
				<li class="list-group-item list-group-item-danger">Vestibulum
					at eros</li>
			</ul>
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-success">Dapibus
					ac facilisis in</a> <a href="#"
					class="list-group-item list-group-item-info">Cras sit amet nibh
					libero</a> <a href="#" class="list-group-item list-group-item-warning">Porta
					ac consectetur ac</a> <a href="#"
					class="list-group-item list-group-item-danger">Vestibulum at
					eros</a>
			</div>
			<div class="list-group">
				<a href="#" class="list-group-item">
					<h4 class="list-group-item-heading">List group item heading</h4>
					<p class="list-group-item-text">Praesent elementum facilisis
						magna, sed tempus sem euismod tincidunt. Praesent pretium urna non
						ante ullamcorper, non porta ligula vulputate. Maecenas sed lectus
						vehicula, pellentesque neque sit amet, venenatis urna. Phasellus
						vestibulum et neque sit amet pellentesque. Pellentesque ac cursus
						nisi. Curabitur dictum nibh sed purus dignissim, a pharetra ligula
						laoreet. Suspendisse dignissim convallis est in volutpat.
						Phasellus suscipit sapien nibh, at feugiat diam blandit eget.
						Fusce facilisis ultricies ipsum, ac ullamcorper mi lobortis quis.
						Nulla pretium at nulla ut luctus. Praesent laoreet at tortor in
						porttitor. Duis tincidunt euismod lacus, ullamcorper pulvinar
						augue imperdiet id. Integer ut massa gravida, laoreet sapien
						vitae, rutrum odio.</p>
				</a> <a href="#" class="list-group-item ">
					<h4 class="list-group-item-heading">List group item heading</h4>
					<p class="list-group-item-text">Phasellus consectetur eget
						risus ac ultricies. In porta facilisis varius. Duis sodales
						interdum nulla eget tempus. In ut libero ornare augue viverra
						convallis a et turpis. Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas. Lorem
						ipsum dolor sit amet, consectetur adipiscing elit. Aenean mi nisi,
						elementum id rhoncus pulvinar, consectetur at elit. Aliquam
						tristique facilisis nulla non scelerisque. Donec porta aliquet
						sapien et tempor. Sed vitae ligula vitae enim mattis sollicitudin.
						Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
						posuere cubilia Curae; Praesent porttitor porttitor mauris id
						varius. Cras fringilla augue erat, vel hendrerit quam adipiscing
						et. Vivamus est velit, facilisis sed purus accumsan, volutpat
						vestibulum purus. Morbi viverra convallis sapien eget pulvinar.</p>
				</a> <a href="#" class="list-group-item ">
					<h4 class="list-group-item-heading">List group item heading</h4>
					<p class="list-group-item-text">Integer tincidunt est nec nulla
						viverra consectetur. Suspendisse potenti. Sed auctor, lacus at
						commodo rhoncus, ligula turpis suscipit eros, ut ullamcorper
						ligula nisl eu risus. Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Donec gravida, eros sit amet consectetur
						vestibulum, diam dolor ultrices urna, in malesuada arcu arcu non
						elit. Donec faucibus scelerisque mi, vel malesuada odio varius
						eget. Nunc suscipit placerat venenatis. Praesent eget adipiscing
						arcu. Nam sed laoreet nisl. Quisque vehicula tellus ante, ac
						cursus mauris mattis nec. Integer auctor neque vel nunc luctus
						condimentum. Maecenas vitae libero lorem.</p>
				</a> <a href="#" class="list-group-item ">
					<h4 class="list-group-item-heading">List group item heading</h4>
					<p class="list-group-item-text">Ut egestas, enim id euismod
						fermentum, ligula tellus gravida ipsum, ac luctus purus sem a
						massa. Aenean commodo ligula dolor, a tempor leo feugiat quis.
						Maecenas eget ipsum elit. Fusce pellentesque, nibh malesuada
						faucibus convallis, quam nisl dapibus magna, accumsan sodales quam
						sapien porttitor felis. Nullam laoreet, magna id tincidunt
						pretium, magna nunc condimentum lacus, sed aliquet sem tellus eget
						sem. Nulla diam tellus, aliquet vitae nisl et, dapibus sagittis
						metus. Sed auctor quam felis, elementum aliquam ipsum dapibus
						laoreet. Mauris pulvinar nulla eu pharetra varius. Quisque in
						ullamcorper magna. Proin blandit urna sit amet imperdiet cursus.
						In pharetra ac neque nec porta. Nullam mattis ipsum vitae
						dignissim mattis. Integer interdum purus vel condimentum
						convallis. Fusce ullamcorper id dui sed lobortis.</p>
				</a>
			</div>
			<?php } else { ?>
			<div class="panel panel-default">
				<div class="panel-heading">Nunc luctus, lacus id aliquet
					bibendum, nunc mauris imperdiet urna</div>
				<div class="panel-body">
					<p>Aenean et nunc pulvinar, ornare nisl nec, tempor elit.
						Aliquam erat volutpat. Vivamus ac ornare nunc. Ut vestibulum sem a
						accumsan vehicula. Vestibulum nec ultrices mi, ut rutrum elit.
						Nunc cursus ultricies commodo.</p>
				</div>
			</div>
		</div>
		<?php }?>
	</div>
</div>
</div>
<script src="/public/js/jquery.js"></script>
<script src="/public/js/bootstrap.js"></script>
</body>
</html>
<?php }} ?>
