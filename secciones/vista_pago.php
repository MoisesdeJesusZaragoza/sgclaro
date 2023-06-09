<?php
include_once '../configuraciones/conexion_bd.php';
session_start();
if ($_SESSION["session_active"] != true) {
    header("location: ../index.php");
}
?>
<?php
    include_once '../configuraciones/conexion_bd.php';
    //$query_consulta = "SELECT * FROM titular WHERE NOT inactivo = 1";
    $query_pago = "SELECT 
                        c1.ID_PAGO, c1.FCHA_PAGO, c1.MES, c1.MONTO, c1.RECIBIDO, 
                        CONCAT(c1.NOM_PAGADOR, ' ', c1.PAG_APELL_1, ' ', c1.PAG_APELL_2) AS RESPONSABLE,
                        CONCAT(c2.NOMBRE, ' ', c2.PR_APELL, ' ', c2.SEG_APELL) AS TITULAR,
                        CONCAT(c3.CALLE, ' ', c3.NO_CASA) AS DOMICILIO, c4.TIPO
                    FROM
                        pago c1 
                    INNER JOIN titular c2 USING (ID_TITULAR)
                    INNER JOIN domicilio c3 USING (ID_TITULAR)
                    INNER JOIN metodo_pago c4 USING (ID_PAGO)
                    WHERE c1.ADEUDO = 0 AND c1.INACTIVO = 0
                    GROUP BY
                    c1.ID_PAGO;";

    $cons_pago= mysqli_query($conexion,$query_pago);

    $query_adeudo = "SELECT 
                        c1.ID_PAGO, c1.FCHA_PAGO, c1.MES, c1.MONTO, c1.RECIBIDO,
                        CONCAT(c2.NOMBRE, ' ', c2.PR_APELL, ' ', c2.SEG_APELL) AS TITULAR,
                        CONCAT(c3.CALLE, ' ', c3.NO_CASA) AS DOMICILIO
                    FROM
                        pago c1 
                    INNER JOIN titular c2 USING (ID_TITULAR)
                    INNER JOIN domicilio c3 USING (ID_TITULAR)
                    WHERE c1.ADEUDO = 1 AND c1.INACTIVO = 0
                    GROUP BY
                    c1.ID_PAGO ;";

    $cons_ade= mysqli_query($conexion,$query_adeudo);

    $cerrar_conexion = mysqli_close($conexion);
    //$consulta= $conexion -> query($query_consulta)
?>


<!doctype HTML>
<html>
<head>
    <META name = "viewport" content = "width = device-width, initial-scale = 1.0">
    <title>Pagos</title>
    <link rel = "stylesheet" href = "../css/style.css">
    <link rel = "stylesheet" href = "../css/tablas.css">
    <link rel="icon" type = "image" href="/sgclaro/favicon.png"> 
</head>
<body>
    <div class = "container">
        <!--nav aqui-->
        <?php include("../cabeceras/header-nav.html"); ?> 
        <!---main-->
        <div class = "main">
            <!--aqui buscar-->
            <?php include("../cabeceras/nav-buscar-pago.html"); ?> 

            <div class = "main-title">
                <h1 class = "wow-title">Pagos</h1>
            </div>

            <div class = "item">
                <div class="table-wrapper">
                    <table class="styled-table">

                        <thead>
                            <h2>
                                <th class = "id-azul">Id</th>
                                <th>Fecha de registro</th>
                                <th>Concepto</th>
                                <th>Monto</th>
                                <th>Cantidad recibida</th>
                                <th>Responsable</th>
                                <th>Titular</th>
                                <th>Domicilio</th>
                                <TH>Metodo de pago</TH>
                        </thead>

                        <tbody>
                            <?php
                                if($cons_pago){
                                    if(mysqli_num_rows($cons_pago) > 0){
                                        while($obj=mysqli_fetch_object($cons_pago)){?>
                                <tr>
                                    <th class="id-azul"><?php echo $obj->ID_PAGO?></th>
                                    <td><?php echo $obj->FCHA_PAGO?></td>
                                    <td><?php echo $obj->MES?></td>
                                    <td><?php echo $obj->MONTO?></td>
                                    <td><?php echo $obj->RECIBIDO?></td>
                                    <td><?php echo $obj->RESPONSABLE?></td>
                                    <td><?php echo $obj->TITULAR?></td>
                                    <td><?php echo $obj->DOMICILIO?></td>
                                    <td><?php echo $obj->TIPO?></td>
                                </tr>
                            <?php } } }?>
                        </tbody>

                    </table>
                </div>
            </div>

            <div class = "main-title">
                <h1 class = "wow-title">Adeudos</h1>
            </div>
            <div class = "item">
                <div class="table-wrapper">
                    <table class="styled-table">
                        <thead>
                            <h2>
                                <th class = "id-azul">Id</th>
                                <th>Fecha de registro</th>
                                <th>Concepto</th>
                                <th>Monto</th>
                                <th>Cantidad recibida</th>
                                <th>Titular</th>
                                <th>Domicilio</th>
                        </thead>

                        <tbody>
                            <?php
                                if($cons_ade){
                                    if(mysqli_num_rows($cons_ade) > 0){
                                        while($obj=mysqli_fetch_object($cons_ade)){?>
                                <tr>
                                    <th class="id-azul"><?php echo $obj->ID_PAGO?></th>
                                    <td><?php echo $obj->FCHA_PAGO?></td>
                                    <td><?php echo $obj->MES?></td>
                                    <td><?php echo $obj->MONTO?></td>
                                    <td><?php echo $obj->RECIBIDO?></td>
                                    <td><?php echo $obj->TITULAR?></td>
                                    <td><?php echo $obj->DOMICILIO?></td>
                                </tr>
                            <?php } } }?>
                        </tbody>
                        
                    </table>
                </div>               
            </div> <!--end item-->

        </div> <!--end main-->
    </div> <!--end container-->

    <!--scripts-->
    <?php $IPATH = $_SERVER["DOCUMENT_ROOT"]."/sgclaro/cabeceras/"; include($IPATH."scripts-fin.html"); ?> <!--codigo php usado para incluir el header sin necesidad del codigo-->
</body>
</html>