<?php
require_once("class/class.php"); 
if(isset($_SESSION['acceso'])) { 
if ($_SESSION['acceso'] == "administrador") {

$con = new Login();
$con = $con->ContarRegistros();

$config = new Login();
$config = $config->ConfiguracionPorId();

$tra = new Login();
$ses = $tra->ExpiraSession();
$reg = $tra->ListarProductos();

if(isset($_POST['btn-cargar']))
{
$reg = $tra->CargarProductos();
exit;
}

?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="assets/images/favicon.png" rel="icon" type="image">
<link href="assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="assets/css/style.css" rel="stylesheet" type="text/css"> 

<!-- script jquery -->
<script src="assets/js/jquery.min.js"></script> 
<script type="text/javascript" src="assets/script/titulos.js"></script>
<script type="text/jscript" language="javascript" src="assets/script/script2.js"></script>
<script type="text/javascript" src="assets/script/validation.min.js"></script>
<script type="text/javascript" src="assets/script/script.js"></script>
<!-- script jquery -->

</head>
<body onLoad="muestraReloj()" class="fixed-left">
					

  <!-- Modal para mostrar detalles del producto-->
  <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none">
    <div class="modal-dialog modal-lg">
      <div class="modal-content p-0 b-0">
        <div class="panel panel-color panel-primary">
          <div class="panel-heading"> 
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="assets/images/close.png"/></button> 
            <h3 class="panel-title"><i class="fa fa-align-justify"></i> Detalle y Movimientos del Producto</h3> 
          </div> 
          <div class="panel-body"> 
           <div id="muestraproductomodal"></div>
         </div>
         <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times-circle"></span> Aceptar</button>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
										

<!-- Modal para mostrar foto y codigo de barra del producto -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none">
  <div class="modal-dialog modal-sm">
    <div class="modal-content p-0 b-0">
      <div class="panel panel-color panel-primary">
        <div class="panel-heading"> 
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><img src="assets/images/close.png"/></button> 
          <h3 class="panel-title">Foto del Producto</h3> 
        </div> 
        <div class="panel-body"> 
         <div id="muestrafotoproductomodal"></div>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times-circle"></span> Aceptar</button>
      </div>
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
										
										
						
										
 <div id="wrapper">
 <div class="topbar">
 <div class="topbar-left">
 <div class="text-center"> 
 <a href="panel" class="logo"><img src="assets/images/logo_white_2.png" height="50"></a> 
 <a href="panel" class="logo-sm"><img src="assets/images/logo_sm.png" height="50"></a>
 </div>
 </div>
 <div class="navbar navbar-default" role="navigation">
 <div class="container">
 <div class="">
 <div class="pull-left"> 
 <button type="button" class="button-menu-mobile open-left waves-effect waves-light"><i class="ion-navicon"></i> </button> 
 <span class="clearfix"></span></div>
 <form class="navbar-form pull-left" role="search">
 <div class="form-group"> 
 <input class="form-control search-bar" placeholder="Búsqueda..." type="text">
 </div> 
 <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
 </form>
 <ul class="nav navbar-nav navbar-right pull-right">
 
<!--- MEJORAR DE AQUI ---->
  <!-- Reloj start-->
  <li id="header_inbox_bar" class="dropdown hidden-xs">
    <a data-toggle="dropdown" class="hour" href="#">
      <span id="spanreloj"></span>
    </a>
  </li>
  <!-- Reloj end -->
  
  <li class="dropdown hidden-xs"> 
   <a href="#" data-target="#" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" title="Notificaciones de Pedidos" aria-expanded="true"> 
    <i class="fa fa-bell"></i> 
    <span class="badge badge-xs badge-danger"><?php echo $con[0]['stockproductos']+$con[0]['stockingredientes']+$con[0]['creditosventasvencidos']+$con[0]['creditoscomprasvencidos']; ?></span> 
  </a> 
  
  <ul class="dropdown-menu dropdown-menu-lg">
    <li class="text-center notifi-title">Notificaciones</li>
    <li class="list-group">
     <!-- list item-->
     <a href="javascript:void(0);" class="dropdown-toggle waves-effect list-group-item">
      <div class="media">
       <div class="pull-left">
        <em class="fa fa-cart-plus fa-2x text-info"></em>                                                 
      </div>
      <div class="media-body clearfix">
        <div class="media-heading">Productos en Stock Minimo</div>
        <p class="m-0">
          <small>Existen <span class="text-primary"><?php echo $con[0]['stockproductos']; ?></span> Productos en Stock</small>
        </p>
      </div>
    </div>
  </a>
  <!-- list item-->
  <a href="javascript:void(0);" class="list-group-item">
    <div class="media">
     <div class="pull-left">
      <em class="fa fa-cart-arrow-down fa-2x text-primary"></em>                                                 
    </div>
    <div class="media-body clearfix">
      <div class="media-heading">Ingredientes en Stock Minimo</div>
      <p class="m-0">
        <small>Existen <span class="text-primary"><?php echo $con[0]['stockingredientes']; ?></span> Ingredientes en Stock</small> 
      </p>
    </div>
  </div>
</a>
<!-- list item-->
<a href="javascript:void(0);" class="list-group-item">
  <div class="media">
   <div class="pull-left">
    <em class="fa fa-truck fa-2x text-info"></em>                                                 
  </div>
  <div class="media-body clearfix">
    <div class="media-heading">Créditos de Compras</div>
    <p class="m-0">
     <small>Existen <span class="text-primary"><?php echo $con[0]['creditoscomprasvencidos']; ?></span> Créditos Vencidos</small>                                                    </p>
   </div>
 </div>
</a>
<!-- last list item -->
<!-- list item-->
<a href="javascript:void(0);" class="list-group-item">
  <div class="media">
   <div class="pull-left">
    <em class="fa fa-diamond fa-2x text-danger"></em>                                                 
  </div>
  <div class="media-body clearfix">
    <div class="media-heading">Créditos de Ventas</div>
    <p class="m-0">
     <small>Existen <span class="text-primary"><?php echo $con[0]['creditosventasvencidos']; ?></span> Créditos Vencidos</small>                                                    </p>
   </div>
 </div>
</a>
<!-- last list item -->                                       
</li>
</ul>

</li>
<!--- MEJORAR DE AQUI ---->
<li class="hidden-xs"> 
  <a href="#" id="btn-fullscreen" class="waves-effect waves-light"><i class="fa fa-crosshairs"></i></a>   
</li>
<li class="dropdown">
  <a href="" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
    
    <span class="dropdown hidden-xs"><abbr title="<?php echo estado($_SESSION['acceso']); ?>"><?php echo $_SESSION['nombres']; ?></abbr></span>
    <?php
    if (isset($_SESSION['cedula'])) {
      if (file_exists("fotos/" . $_SESSION['cedula'] . ".jpg")) {
        echo "<img src='fotos/" . $_SESSION['cedula'] . ".jpg?' class='img-circle'>";
      } else {
        echo "<img src='fotos/avatar.jpg' class='img-circle'>";
      }
    } else {
      echo "<img src='fotos/avatar.jpg' class='img-circle'>";
    }
    ?> </a>
   <ul class="dropdown-menu">
   <li><a href="perfil"><i class="fa fa-user"></i> Mi Perfil</a></li>
   <li><a href="password"><i class="fa fa-edit"></i> Actualizar Password </a></li>
   <li><a href="bloqueo"><i class="fa fa-clock-o"></i> Bloquear Sesión</a></li>
   <li class="divider"></li>
   <li><a href="logout"><i class="fa fa-power-off"></i> Cerrar Sesión</a></li>
   </ul>
   </li>
   </ul>
   </div>
   </div>
   </div>
   </div>
   <div class="left side-menu">
   <div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 566px;">
   
   <div class="user-details">
   <div class="text-center"> <?php
	if (isset($_SESSION['cedula'])) {
	if (file_exists("fotos/".$_SESSION['cedula'].".jpg")){
    echo "<img src='fotos/".$_SESSION['cedula'].".jpg?' class='img-circle'>"; 
}else{
    echo "<img src='fotos/avatar.jpg' class='img-circle'>"; 
} } else {
	echo "<img src='fotos/avatar.jpg' class='img-circle'>"; 
}
?></div>
   <div class="user-info">
   <div class="dropdown"> 
   <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo estado($_SESSION['acceso']); ?></a>
   <ul class="dropdown-menu">
  <li><a href="perfil"><i class="fa fa-user"></i> Mi Perfil</a></li>
   <li><a href="password"><i class="fa fa-edit"></i> Actualizar Password </a></li>
   <li><a href="bloqueo"><i class="fa fa-clock-o"></i> Bloquear Sesión</a></li>
   <li class="divider"></li>
   <li><a href="logout"><i class="fa fa-power-off"></i> Cerrar Sesión</a></li>
   </ul>
   </div>
   <p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i> Online</p>
   </div>
   </div>
   
   
   
   <!----- INICIO DE MENU ----->
   <?php include('menu.php'); ?>
   <!----- FIN DE MENU ----->


<div class="clearfix"></div>

</div>
</div>
</div>

<div class="content-page">
<div class="content">
<div class="container">
<div class="row">
<div class="col-sm-12">
<div class="page-header-title"><h4 class="pull-left page-title"><i class="fa fa-tasks"></i> Control de Productos</h4>
<ol class="breadcrumb pull-right"><li><a href="panel">Inicio</a></li>
<li class="active">Control de Productos</li>
</ol>

<div class="clearfix"></div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12">
<div class="panel panel-primary">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-tasks"></i> Productos<span class="pull-right">

<div class="btn-group dropdown">
<button type="button" class="btn btn-default waves-effect waves-light"><span class="fa fa-cog"></span> Procesos</button>
<button type="button" class="btn btn-default dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false"><i class="caret"></i></button>
            <ul class="dropdown-menu" role="menu">
<li><a href="forproducto" data-toggle="tooltip" data-placement="left" title="" data-original-title="Nuevo Producto"><i class="fa fa-plus"></i> Nuevo</a></li>
<li><a href="reportepdf?tipo=<?php echo base64_encode("PRODUCTOS") ?>" target="_blank" rel="noopener noreferrer" data-toggle="tooltip" data-placement="left" title="" data-original-title="Listado Pdf"><i class="fa fa-file-pdf-o"></i> Listado (Pdf)</a></li>
<li><a href="reportepdf?tipo=<?php echo base64_encode("PRODUCTOSSTOCK") ?>" target="_blank" rel="noopener noreferrer" data-toggle="tooltip" data-placement="left" title="" data-original-title="Stock Minimo Pdf"><i class="fa fa-file-pdf-o"></i> Stock M. (Pdf)</a></li>
<li><a href="reporteexcel?tipo=<?php echo base64_encode("PRODUCTOS") ?>" data-toggle="tooltip" data-placement="left" title="" data-original-title="Listado Excel"><i class="fa fa-file-excel-o"></i> Listado (Excel)</a></li>
            </ul>
</div>
</span>
</h3>
</div>

<div class="panel-body">
<div id="datatable-responsive_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">


<div class="row">
<div class="col-sm-12">
 <?php
		if(isset($_GET["mesage"]))
{
	switch($_GET["mesage"])
	{
		case 1:
		echo "<div class='alert alert-info'>";
		echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
		echo "<center><span class='fa fa-check-square-o'></span> EL PRODUCTO FUE ELIMINADO EXITOSAMENTE </center>";
        echo "</div>"; 
		break;
		
		case 2:
		echo "<div class='alert alert-warning'>";
		echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
		echo "<center><span class='fa fa-info-circle'></span> ESTE PRODUCTO NO PUEDE SER ELIMINADO, TIENE VENTAS RELACIONADAS ACTUALMENTE</center>";
        echo "</div>";   
		break;
		
		case 3:
		echo "<div class='alert alert-warning'>";
		echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
		echo "<center><span class='fa fa-info-circle'></span> USTED NO TIENE ACCESO PARA ELIMINAR PRODUCTOS, NO ERES EL ADMINISTRADOR DEL SISTEMA</center>";
        echo "</div>";   
		break;
		
	}
}		
	   ?><table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;" width="100%" cellspacing="0">
                                                 <thead>
												 <tr role="row">
												 <th>N°</th>
                         <th>Img</th>
												 <th>Producto</th>
												 <th>Categoria</th>
												 <th>Costo</th>
												 <th>Existencia</th>
												 <th>Acciones</th>
												 </tr>
												 </thead>
												 <tbody>
<?php  

if($reg==""){

    echo "";      
    
} else {

$a=1;
for($i=0;$i<sizeof($reg);$i++){  

                if($reg[$i]['stockminimo'] <= $reg[$i]['existencia']){
                echo "<tr role='row' class='odd'>";
                }else{
                echo "<tr role='row' class='odd' style='background-color:#FFFFCC;'>";
                }
?>
                                               <!---<tr role="row" class="odd">--->
											   <td class="sorting_1" tabindex="0"><?php echo $a++; ?></td>
<td><a href="#" data-placement="left" title="Ver Imagen" data-original-title="" data-href="#" data-toggle="modal" data-target=".bs-example-modal-sm" data-backdrop="static" data-keyboard="false" onClick="VerImagen('<?php echo base64_encode($reg[$i]["codproducto"]); ?>')"><?php if (file_exists("fotos/".$reg[$i]["codproducto"].".jpg")){
    echo "<img src='fotos/".$reg[$i]["codproducto"].".jpg?' class='img-rounded' style='margin:0px;' width='35' height='35'>"; 
}else{
   echo "<img src='fotos/producto.png' class='img-rounded' style='margin:0px;' width='35' height='35'>";  
} 
     ?></a></td>
<td><abbr title="<?php echo " Nº: ".$reg[$i]['codproducto']; ?>"><?php echo $reg[$i]['producto']; ?></abbr> <?php echo $favorito = ( $reg[$i]['favorito'] == 'SI' ? "<span title='Producto Favorito' class='fa fa-star'></span>" : ""); ?></td>
											   <td><?php echo $reg[$i]['nomcategoria']; ?></td>
<td><?php echo "<strong>".$config[0]['simbolo']."</strong>".number_format($reg[$i]['precioventa'], 2, '.', ','); ?></td>
<td><abbr title="STATUS: <?php echo $status = ( $reg[$i]['statusproducto'] == 'ACTIVO' ? $reg[$i]['statusproducto'] : $reg[$i]['statusproducto']); ?>"><?php echo $reg[$i]['existencia']; ?></abbr></td>

											   <td>
<a href="#" class="btn btn-success btn-xs" onClick="VerProducto('<?php echo base64_encode($reg[$i]['codproducto']) ?>')" data-href="#" data-toggle="modal" data-target=".bs-example-modal-lg" data-placement="left" data-backdrop="static" data-keyboard="false" data-id="" rel="tooltip" data-original-title="Ver Producto" title="Ver Producto"><i class="fa fa-search-plus"></i></a>
								  
<a href="#" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="" data-original-title="Editar Producto" onClick="actualizar('forproducto?codproducto=<?php echo base64_encode($reg[$i]["codproducto"]) ?>')"><i class="fa fa-pencil"></i></a>

<a href="#" class="btn btn-warning btn-xs" data-toggle="tooltip" data-placement="left" title="" data-original-title="Agregar Ingrediente" onClick="agregar('agregaingrediente?codproducto=<?php echo base64_encode($reg[$i]["codproducto"]) ?>')"><span class="fa fa-cart-arrow-down"></span></a>
                                 
<a href="#" class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="left" title="" data-original-title="Eliminar Producto" onClick="eliminar('eliminar?<?php echo base64_encode('eliminar'); ?>&codproducto=<?php echo base64_encode($reg[$i]["codproducto"]) ?>&tipo=<?php echo base64_encode("PRODUCTOS") ?>')"><i class="fa fa-trash-o"></i></a> </td>
											   </tr>
											   <?php } } ?>
											   </tbody>
</table>
                                                 </div>
                                             </div>
										</div>
								  </div>
							</div>
					</div>
				</div>
		</div>
</div>

<footer class="footer"> <i class="fa fa-copyright"></i> <span class="current-year"></span>. </footer>
</div>
</div> 

   
<script>
            var resizefunc = [];
        </script>

        <!-- jQuery  
        <script src="assets/js/jquery.min.js"></script>-->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/detect.js"></script>
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>

        <script src="assets/js/jquery.app.js"></script>
        
        <!-- jQuery  -->
        <script src="assets/plugins/moment/moment.js"></script>
        
        <!-- jQuery  -->
        <script src="assets/plugins/waypoints/lib/jquery.waypoints.js"></script>
        <script src="assets/plugins/counterup/jquery.counterup.min.js"></script>
		
		<!-- Datatables-->
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="assets/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="assets/plugins/datatables/buttons.bootstrap.min.js"></script>
        <script src="assets/plugins/datatables/jszip.min.js"></script>
        <script src="assets/plugins/datatables/pdfmake.min.js"></script>
        <script src="assets/plugins/datatables/vfs_fonts.js"></script>
        <script src="assets/plugins/datatables/buttons.html5.min.js"></script>
        <script src="assets/plugins/datatables/buttons.print.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.fixedHeader.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.keyTable.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="assets/plugins/datatables/responsive.bootstrap.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.scroller.min.js"></script>

        <!-- Datatable init js -->
        <script src="assets/pages/datatables.init.js"></script>

        <!-- jQuery  -->
        <script src="assets/pages/jquery.todo.js"></script>
        
        <!-- jQuery  -->
        <script src="assets/pages/jquery.dashboard.js"></script>
        
        <script type="text/javascript">
            /* ==============================================
            Counter Up
            =============================================== */
            jQuery(document).ready(function($) {
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
            });
        </script>
		

        <script type="text/javascript">
            $(document).ready(function() {
                $('#datatable').dataTable();
                $('#datatable-keytable').DataTable( { keys: true } );
                $('#datatable-responsive').DataTable();
                $('#datatable-scroller').DataTable( { ajax: "assets/plugins/datatables/json/scroller-demo.json", deferRender: true, scrollY: 380, scrollCollapse: true, scroller: true } );
                var table = $('#datatable-fixed-header').DataTable( { fixedHeader: true } );
            } );
            TableManageButtons.init();
        </script>
  
  

   </body>
   </html>
<?php } else { ?>   
        <script type='text/javascript' language='javascript'>
        alert('NO TIENES PERMISO PARA ACCEDER A ESTA PAGINA.\nCONSULTA CON EL ADMINISTRADOR PARA QUE TE DE ACCESO')  
        document.location.href='panel'   
        </script> 
<?php } } else { ?>
        <script type='text/javascript' language='javascript'>
        alert('NO TIENES PERMISO PARA ACCEDER AL SISTEMA.\nDEBERA DE INICIAR SESION')  
        document.location.href='logout'  
        </script> 
<?php } ?> 