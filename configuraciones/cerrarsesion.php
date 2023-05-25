<?php
	session_start();
	session_destroy();
	/*echo '<script language="javascript">
	alert("Sesión cerrada.");
	window.location.href="../index.php"
	</script>';*/
	header("location: ../index.php");
?>