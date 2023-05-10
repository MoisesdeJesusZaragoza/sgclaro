<?php 
    include_once '../configuraciones/conexion_bd.php';
    
    if(isset($_POST['submit_new_user'])){
        $uname = trim($_POST["uname"]);
        $contrasena = trim($_POST["contrasena"]);
        $tipo_usuario = trim($_POST["tipo_usuario"]);

        $query_ins_user = "INSERT INTO login(usuario, contrasena, respuesta, tipo_usuario) VALUES ('$uname', MD5('$contrasena'), 'sgresident' ,'$tipo_usuario')";

        $result = mysqli_query($conexion, $query_ins_user);

    }
	$cerrar_cn = mysqli_close($conexion);
	header("location: ../secciones/index.php");
?>