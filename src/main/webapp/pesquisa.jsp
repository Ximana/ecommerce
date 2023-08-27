<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%
ArrayList<Produto> listaPesquisa = (ArrayList<Produto>) request.getAttribute("listaPesquisa");

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
if(idUsuario != null){
	totalProdutos = dao.totalProdutos(idUsuario);
}
%>

<!DOCTYPE html>
<html lang="pt">

<head>
<title>Zay Shop - Product Listing Page</title>
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
						href="verCarrinho?idUsuario=<%=idUsuario %>"> <i
						class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> 
						<span
						class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
						<%=totalProdutos %>
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
				class="modal-content modal-body border-0 p-0" action="pesquisa">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="pesquisa"
						name="pesquisa" placeholder="Pesquisa ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- INICIO CORPO -->
	<div class="container py-5">
		<div class="row">

			<div class="col-lg-3">
				<h1 class="h2 pb-4">Categorias</h1>
				<ul class="list-unstyled templatemo-accordion">
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> PC <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul class="collapse show list-unstyled pl-3">
							<li><a class="text-decoration-none" href="#">Portateis</a></li>
							<li><a class="text-decoration-none" href="#">Desktop</a></li>
						</ul></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Smartphone <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul id="collapseTwo" class="collapse list-unstyled pl-3">
							<li><a class="text-decoration-none" href="#">Android</a></li>
							<li><a class="text-decoration-none" href="#">Iphone</a></li>
						</ul></li>
					<li class="pb-3"><a
						class="collapsed d-flex justify-content-between h3 text-decoration-none"
						href="#"> Acessorios <i
							class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
					</a>
						<ul id="collapseThree" class="collapse list-unstyled pl-3">
							<li><a class="text-decoration-none" href="#">Pasta</a></li>
							<li><a class="text-decoration-none" href="#">Teclado</a></li>
							<li><a class="text-decoration-none" href="#">Mouse</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">Todos</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none mr-3" href="#">___</a>
							</li>
							<li class="list-inline-item"><a
								class="h3 text-dark text-decoration-none" href="#">____</a></li>
						</ul>
					</div>
					<div class="col-md-6 pb-4">
						<div class="d-flex">
							<select class="form-control">
								<option>A à Z</option>
								<option>Destaques</option>
								<option>Preço</option>
							</select>
						</div>
					</div>
				</div>

				<!-- INICIO LISTA DE PRODUTOS  -->
				<div class="row">


					<!-- INCIO CADA PRODUTO 
				
				CADA PRODUTO E GERADO AUTOMATICAMENTE DA BD
				 -->
					<%
					for (int i = 0; i < listaPesquisa.size(); i++) {
					%>
					<div class="col-md-4">
						<div class="card mb-4 product-wap rounded-0">
							<div class="card rounded-0">
								<img class="card-img rounded-0 img-fluid"
									src="assets/img/produtos/<%=listaPesquisa.get(i).getImagem()%>">
								<div
									class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
									<ul class="list-unstyled">
										<li><a class="btn btn-success text-white"
											href="produtoSelecionado?codigoProduto=<%=listaPesquisa.get(i).getCodProduto()%>"><i class="far fa-heart"></i></a></li>
										<li><a class="btn btn-success text-white mt-2"
											href="produtoSelecionado?codigoProduto=<%=listaPesquisa.get(i).getCodProduto()%>"><i class="far fa-eye"></i></a></li>
										<li><a class="btn btn-success text-white mt-2"
											href="produtoSelecionado?codigoProduto=<%=listaPesquisa.get(i).getCodProduto()%>"><i class="fas fa-cart-plus"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="card-body">
								<a href="produtoSelecionado?codigoProduto=<%=listaPesquisa.get(i).getCodProduto()%>" class="h3 text-decoration-none"><%=listaPesquisa.get(i).getNome()%></a>
								<ul
									class="w-100 list-unstyled d-flex justify-content-between mb-0">
									<li><%=listaPesquisa.get(i).getCategoria()%></li>
									<li class="pt-2"><span
										class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
										<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
									</li>
								</ul>
								<ul class="list-unstyled d-flex justify-content-center mb-1">
									<li><i class="text-warning fa fa-star"></i> <i
										class="text-warning fa fa-star"></i> <i
										class="text-warning fa fa-star"></i> <i
										class="text-muted fa fa-star"></i> <i
										class="text-muted fa fa-star"></i></li>
								</ul>
								<p class="text-center mb-0"><%=listaPesquisa.get(i).getPreco()%>
									kz
								</p>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<!-- FIM PRODUTO  -->





				</div>
				<!-- FIM LISTA DE PRODUTOS  -->

				<!-- INICIO PAGINACAO  -->
				<div class="row">
					<ul class="pagination pagination-lg justify-content-end">
						<li class="page-item disabled"><a
							class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
							href="#" tabindex="-1">1</a></li>
						<li class="page-item"><a
							class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
							href="#">2</a></li>
						<li class="page-item"><a
							class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
							href="#">3</a></li>
					</ul>
				</div>
				<!-- FIM PAGINACAO  -->
			</div>

		</div>
	</div>
	<!-- FIM CORPO DA PAGINA -->

	<!-- INICIO MARCAS -->
	<section class="bg-light py-5">
		<div class="container my-4">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Nossas Marcas</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod Lorem ipsum dolor sit amet.</p>
				</div>
				<div class="col-lg-9 m-auto tempaltemo-carousel">
					<div class="row d-flex flex-row">
						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="prev"> <i
								class="text-light fas fa-chevron-left"></i>
							</a>
						</div>
						<!--End Controls-->

						<!--Carousel Wrapper-->
						<div class="col">
							<div class="carousel slide carousel-multi-item pt-2 pt-md-0"
								id="multi-item-example" data-bs-ride="carousel">
								<!--Slides-->
								<div class="carousel-inner product-links-wap" role="listbox">

									<!--First slide-->
									<div class="carousel-item active">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End First slide-->

									<!--Second slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Second slide-->

									<!--Third slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#"><img class="img-fluid brand-img"
													src="assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
										</div>
									</div>
									<!--End Third slide-->

								</div>
								<!--End Slides-->
							</div>
						</div>
						<!--End Carousel Wrapper-->

						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button"
								data-bs-slide="next"> <i
								class="text-light fas fa-chevron-right"></i>
							</a>
						</div>
						<!--End Controls-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--FIM MARCAS Brands-->


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
</body>

</html>