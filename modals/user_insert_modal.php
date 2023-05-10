<div class="modal fade" id="agregar-usuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h1-modal">
                        <label>Agregar usuario</label>
                    </div>
                    <!--end h1-modal-->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!--end modal-header-->

                <div class="modal-header" id="indicacion">
                    <label>Llena los campos del formulario para agregar un usuario</label>
                </div>
                <!--end modal-header-->

                <div class="modal-body">
                    <form action="../modals/user_insert.php" method="POST" class="row g-3 needs-validation was-validated">
                        <div class="col-md-4">
                            <label for="uname" class="form-label">Nombre de usuario</label>
                            <input type="text" name="uname" class="form-control" id="uname" autocomplete="off" maxlength="20" required pattern="[a-zA-Z][a-zA-Z\s]+" title="Letras. Tamaño mínimo: 1. Tamaño máximo: 20.">
                            <div class="valid-feedback">
                                OK!
                            </div>
                            <div class="invalid-feedback">
                                Por favor ingrese un nombre para el nuevo usuario
                            </div>
                        </div>
                        <!--end col-md-4-->
						<div class="col-md-4">
                            <label for="contrasena" class="form-label">Contraseña</label>
                            <input type="password" name="contrasena" class="form-control" id="contrasena" autocomplete="off" maxlength="40" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Al menos un numero, una letra minuscula, una letra mayuscula y al menos 8 caracteres." value="">
                            <div class="valid-feedback">
                                OK!
                            </div>
                            <div class="invalid-feedback">
                                Ingresar Contraseña de nuevo Usuario
                            </div>
                        </div>
                        <!--end col-md-4-->
						<div class="col-md-5">
                            <label for="tipo_usuario" class="form-label">Tipo de usuario</label>
                            <select name="tipo_usuario" class="form-select" id="tipo_usuario" required>
                                <option selected disabled value="">Elegir</option>
                                <option value="ADMINISTRADOR">Administrador</option>
                                <option value="RESIDENTE">Residente</option>
                                <option value="USUARIO">Usuario</option>
                            </select>
                            <div class="invalid-feedback">
                                Seleccione una opcion
                            </div>
                        </div>
                        <!--end col-md-5-->
						<div class="modal-footer">
                            <!-- En este botón lleva a una modal para confirmar que se quieren guardar los datos del usuario-->
                            <button class="btn btn-primary" name="submit_new_user" type="submit" onclick='return confirmacion()'>Guardar</button>

                            <!-- En este botón cierra el modal para proveedor-->
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <!-- -->

                        </div>
                        <!--end modal-footer-->
                        <!--end modal-footer-->
                    </form>
                    <!--end form-->
                </div>
                <!--end modal-body-->
            </div>
            <!--end modal-content-->
        </div>
        <!--end modal-dialog-->
    </div>
    <!--end modal fade-->