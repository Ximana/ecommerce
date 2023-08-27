<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DAO dao = new DAO();
String nomeCliente = "";
String idUsuario = "";
boolean login = false;
int totalProdutos = 0;

if (session.getAttribute("Nome") != null) {
	nomeCliente = session.getAttribute("Nome").toString();
	idUsuario = session.getAttribute("codigo").toString();
	login = true;

}
if (idUsuario != null) {
	totalProdutos = dao.totalProdutos(idUsuario);
}
%>
<!DOCTYPE html>
<html lang="pt">

<head>
<title>
	<%
	out.print(request.getAttribute("nome"));
	%>
</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">

<!-- Slick -->
<link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
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
								placeholder="Pesquisa ...">
							<div class="input-group-text">
								<i class="fa fa-fw fa-search"></i>
							</div>
						</div>
					</div>
					<a class="nav-icon d-none d-lg-inline" href="#"
						data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
						class="fa fa-fw fa-search text-dark mr-2"></i>
					</a>
					<%
					if (login) {
					%><a class="nav-icon position-relative text-decoration-none"
						href="verCarrinho?idUsuario=<%=idUsuario%>"> <i
						class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> <span
						class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
							<%=totalProdutos%>">
					</span>
					</a>
					<%
					}
					%>

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


	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!--  produto -->
	<section class="bg-light">
		<div class="container pb-5">
			<div class="row">
				<div class="col-lg-5 mt-5">
					<div class="card mb-3">
						<img class="card-img img-fluid"
							src="assets/img/produtos/<%out.print(request.getAttribute("imagem"));%>"
							alt="Card image cap" id="product-detail">
					</div>
					<div class="row"></div>
				</div>
				<!-- col end -->


				<div class="col-lg-7 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="h2">
								<%
								out.print(request.getAttribute("nome"));
								%>

							</h1>
							<p class="h3 py-2">
								<%
								out.print(request.getAttribute("preco"));
								%>
								kz
							</p>
							<p class="py-2">
								<i class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-warning"></i> <i
									class="fa fa-star text-secondary"></i> <span
									class="list-inline-item text-dark">Avaliação 4.8</span>
							</p>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>______</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong>______</strong>
									</p>
								</li>
							</ul>

							<h6>Descrição:</h6>
							<p>
								<%
								out.print(request.getAttribute("descricao"));
								%>.
							</p>
							<ul class="list-inline">
								<li class="list-inline-item">
									<h6>Cores disponivéis :</h6>
								</li>
								<li class="list-inline-item">
									<p class="text-muted">
										<strong>Branca / Preta</strong>
									</p>
								</li>
							</ul>

							<h6></h6>
							<ul class="list-unstyled pb-3">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>

							<form action="adicionarP" method="GET">
								<div class="row">
									<div class="col-auto"></div>
									<div class="col-auto">
										<ul class="list-inline pb-3">
											<li class="list-inline-item text-right">Quantidade <input
												type="hidden" name="quantidade" id="product-quanity"
												value="1">
											</li>
											<li class="list-inline-item"><span
												class="btn btn-success" id="btn-minus">-</span></li>
											<li class="list-inline-item"><span
												class="badge bg-secondary" id="var-value">1</span></li>
											<li class="list-inline-item"><span
												class="btn btn-success" id="btn-plus">+</span></li>
										</ul>
									</div>
								</div>
								<div class="row pb-3">
									<div class="col d-grid">
										<a href="#" class="btn btn-success btn-lg" name="submit"
											value="comprar">Comprar</a>
									</div>
									<div class="col d-grid">

										<input type="hidden" name="idUsuario" value="<%=idUsuario%>"
											readonly="readonly"> <input type="hidden"
											name="idProduto"
											value="<%out.print(request.getAttribute("codProduto"));%>"
											readonly="readonly">

										<button type="submit" class="btn btn-success btn-lg">Adicionar</button>


										<%--  
										<a href="adicionarAoCarrinho?codigo=<% out.print(request.getAttribute("codProduto")); %>" class="btn btn-success btn-lg" >
										Adicionar ao Carrinho
										</a>
										--%>


									</div>
								</div>
							</form>

							<form action="adicionarFavorito" method="GET">
								<input type="hidden" name="idUsuario" value="<%=idUsuario%>" readonly="readonly"> 
								<input type="hidden" name="idProduto" value="<%out.print(request.getAttribute("codProduto"));%>" readonly="readonly">


								<button type="submit" class="btn btn-success btn-lg">Adicionar aos Favoritos</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- produto -->




	<!-- Inicio Footer -->
	<footer class="bg-dark" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-success border-bottom pb-3 border-light logo">Loja
						Luanda</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><i class="fas fa-map-marker-alt fa-fw"></i> Luanda
							Maianga Cassequel</li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-020-0340">937-123-602</a>
						</li>
						<li><i class="fa fa-envelope fa-fw"></i> <a
							class="text-decoration-none" href="mailto:info@company.com">felecianaluanda@gmail.com</a>
						</li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Productos</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">Roupa
								Desportiva</a></li>
						<li><a class="text-decoration-none" href="#">CalÃ§ados</a></li>
						<li><a class="text-decoration-none" href="#">Roupas
								populares</a></li>
						<li><a class="text-decoration-none" href="#">acessorios</a></li>
						<li><a class="text-decoration-none" href="#">CalÃ§ados
								desportivos</a></li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Mais
						Informações</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">Inicio</a></li>
						<li><a class="text-decoration-none" href="#">Sobre Nós</a></li>
						<li><a class="text-decoration-none" href="#">Localização</a></li>
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
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="http://facebook.com/"><i
								class="fab fa-facebook-f fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.instagram.com/"><i
								class="fab fa-instagram fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://twitter.com/"><i
								class="fab fa-twitter fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.linkedin.com/"><i
								class="fab fa-linkedin fa-lg fa-fw"></i></a>
						</li>
					</ul>
				</div>
				<div class="col-auto">
					<label class="sr-only" for="subscribeEmail">Email</label>
					<div class="input-group mb-2">
						<input type="text" class="form-control bg-dark border-light"
							id="subscribeEmail" placeholder="Email">
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
							Copyright &copy; 2021 Luanda | Feito <a rel="sponsored"
								href="https://templatemo.com" target="_blank">Paulo Ximana</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- Fim do rodape -->


	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->

	<!-- Start Slider Script -->
	<script src="assets/js/slick.min.js"></script>
	<script>
		$('#carousel-related-product').slick({
			infinite : true,
			arrows : false,
			slidesToShow : 4,
			slidesToScroll : 3,
			dots : true,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 3
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 3
				}
			} ]
		});
	</script>
	<!-- End Slider Script -->

</body>

</html>