<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%


String nomeCliente = "";
boolean login = false;

if (session.getAttribute("Nome") != null) {
	nomeCliente = session.getAttribute("Nome").toString();
	login = true;

}

%>
<!DOCTYPE html>
<html lang="pt">

<head>
    <title>Criar Conta</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Carregar as fonts e icones -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    
</head>

<body>
	<!-- Nav Topo -->
	<nav
		class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block"
		id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:info@company.com">luanda@gmail.com</a> <i
						class="fa fa-phone mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="tel:010-020-0340">937-123-602</a>
				</div>
				<div>
					<a class="text-light" href="https://fb.com/templatemo"
						target="_blank" rel="sponsored"><i
						class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a> <a
						class="text-light" href="https://www.instagram.com/"
						target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://twitter.com/" target="_blank"><i
						class="fab fa-twitter fa-sm fa-fw me-2"></i></a> <a class="text-light"
						href="https://www.linkedin.com/" target="_blank"><i
						class="fab fa-linkedin fa-sm fa-fw"></i></a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Fecha Nav topo -->


	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-success logo h1 align-self-center"
				href="index.jsp"> Luanda </a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="sobre.jsp">Sobre</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="loja">Loja</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contacto.jsp">Contacto</a>
						</li>
					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<div
						class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
						<div class="input-group">
							<input type="text" class="form-control" id="inputMobileSearch"
								placeholder="Search ...">
							<div class="input-group-text">
								<i class="fa fa-fw fa-search"></i>
							</div>
						</div>
					</div>
					<a class="nav-icon d-none d-lg-inline" href="#"
						data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
						class="fa fa-fw fa-search text-dark mr-2"></i>
					</a> <a class="nav-icon position-relative text-decoration-none"
						href="#"> <i
						class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> <span
						class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
					</a>
					<div
						class="nav-icon position-relative text-decoration-none dropdown"
						href="#">
						<a class="fa fa-fw fa-user text-dark mr-3 dropdown-toggle btn"
							role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
							aria-expanded="false""> <%=nomeCliente%>
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<%
							if (login) {
							%>
							<li><a class="dropdown-item" href="#">Informacao</a></li>
							<li><a class="dropdown-item" href="Logout">Sair</a></li>
							<%
							} else {
							%>
							<li><a class="dropdown-item" href="criarConta.jsp">Criar
									conta</a></li>

							<li><a class="dropdown-item" href="login.html">Login</a></li>
							<%
							}
							%>

						</ul>
					</div>
				</div>
			</div>

		</div>
	</nav>
	<!-- Fecha Header -->
	
	
	 <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form class="col-md-9 m-auto" action="criarUsuario" role="form">
                <div class="row">
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">Nome</label>
                        <input type="text" class="form-control mt-1" id="name" name="nome" placeholder="Nome">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">Apelido</label>
                        <input type="text" class="form-control mt-1" id="apelido" name="apelido" placeholder="Apelido">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">Pais</label>
                        <input type="text" class="form-control mt-1" id="pais" name="pais" placeholder="Pais">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">Cidade</label>
                        <input type="text" class="form-control mt-1" id="cidade" name="cidade" placeholder="Cidade">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">Endereço</label>
                        <input type="text" class="form-control mt-1" id="enderco" name="endereco" placeholder="Endereço">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">Telefone</label>
                        <input type="tel" class="form-control mt-1" id="email" name="telefone" placeholder="Telefone">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">Email</label>
                        <input type="email" class="form-control mt-1" id="email" name="email" placeholder="Email">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">Genero</label>
                        <select class="form-control mt-1" id="genero" name="genero">
                        <option>Masculino</option>
                        <option>Femenino</option>
                        </select>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="inputsubject">Senha</label>
                    <input type="password" class="form-control mt-1" id="senha" name="senha" placeholder="Senha">
                </div>
                <!-- 
                <div class="mb-3">
                    <label for="inputmessage">Message</label>
                    <textarea class="form-control mt-1" id="message" name="message" placeholder="Message" rows="8"></textarea>
                </div>
                 -->
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3">Confirmar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->
	

 


    <!-- Fim Formulario -->

    <!-- Inicio Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">Loja Luanda</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            Luanda Maianga Cassequel
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:010-020-0340">937-123-602</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:info@company.com">felecianaluanda@gmail.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Productos</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Roupa Desportiva</a></li>
                        <li><a class="text-decoration-none" href="#">CalÃ§ados</a></li>
                        <li><a class="text-decoration-none" href="#">Roupas populares</a></li>
                        <li><a class="text-decoration-none" href="#">acessorios</a></li>
                        <li><a class="text-decoration-none" href="#">CalÃ§ados desportivos</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Mais InformaÃ§Ã´es</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Inicio</a></li>
                        <li><a class="text-decoration-none" href="#">Sobre NÃ³s</a></li>
                        <li><a class="text-decoration-none" href="#">LocalizaÃ§Ã£o</a></li>
                        <li><a class="text-decoration-none" href="#">Perguntas</a></li>
                        <li><a class="text-decoration-none" href="#">Contacto</a></li>
                    </ul>
                </div>

            </div>

            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email">
                        <div class="input-group-text btn-success text-light">Subscrever</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            Copyright &copy; 2021 Luanda 
                            | Feito <a rel="sponsored" href="https://templatemo.com" target="_blank">Paulo Ximana</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- Fim do rodape -->

    <!-- Inicio Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- Fim Script -->
</body>

</html>