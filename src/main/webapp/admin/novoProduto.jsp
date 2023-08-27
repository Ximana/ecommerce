<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet" href="css/style.css" />
<title>Novo Produto</title>
</head>
<body>
	<!-- top navigation bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#sidebar"
				aria-controls="offcanvasExample">
				<span class="navbar-toggler-icon" data-bs-target="#sidebar"></span>
			</button>
			<a class="navbar-brand me-auto ms-lg-0 ms-3 text-uppercase fw-bold"
				href="#">Luanda</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#topNavBar"
				aria-controls="topNavBar" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="topNavBar">
				<form class="d-flex ms-auto my-3 my-lg-0">
					<div class="input-group">
						<input class="form-control" type="search"
							placeholder="Insira a sua pesquisa" aria-label="Search" />
						<button class="btn btn-primary" type="submit">
							<i class="bi bi-search"></i> Pesquisar
						</button>
					</div>
				</form>
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle ms-2" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="bi bi-person-fill"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><a class="dropdown-item" href="#">Sair</a></li>
							<li><a class="dropdown-item" href="#">__</a></li>
							<li><a class="dropdown-item" href="#"> __</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- top navigation bar -->


	<!-- offcanvas -->
	<div class="offcanvas offcanvas-start sidebar-nav bg-dark"
		tabindex="-1" id="sidebar">
		<div class="offcanvas-body p-0">
			<nav class="navbar-dark">
				<ul class="navbar-nav">
					<li>
						<div class="text-muted small fw-bold text-uppercase px-3">
							Principal</div>
					</li>
					<li><a href="../paginaPrincipal" target="_blank"
						class="nav-link px-3 active"> <span class="me-2"><i
								class="bi bi-speedometer2"></i></span> <span>Acessar Loja</span>
					</a></li>
					<li class="my-4"><hr class="dropdown-divider bg-light" /></li>
					<li>
						<div class="text-muted small fw-bold text-uppercase px-3 mb-3">
							Gerênciar</div>
					</li>
					<li><a class="nav-link px-3 sidebar-link"
						data-bs-toggle="collapse" href="#layouts"> <span class="me-2"><i
								class="bi bi-layout-split"></i></span> <span>Produtos</span> <span
							class="ms-auto"> <span class="right-icon"> <i
									class="bi bi-chevron-down"></i>
							</span>
						</span>
					</a>
						<div class="collapse" id="layouts">
							<ul class="navbar-nav ps-3">
								<li><a href="lisTarProdutos" class="nav-link px-3"> <span
										class="me-2"><i class="bi bi-speedometer2"></i></span> <span>Produtos</span>
								</a></li>
								<li><a href="novoProduto.html" class="nav-link px-3"> <span
										class="me-2"><i class="bi bi-speedometer2"></i></span> <span>Novo
											Produto</span>
								</a></li>
							</ul>
						</div></li>
					<li><a href="usuario" class="nav-link px-3"> <span
							class="me-2"><i class="bi bi-book-fill"></i></span> <span>Clientes</span>
					</a></li>
					<li class="my-4"><hr class="dropdown-divider bg-light" /></li>
					<li>
						<div class="text-muted small fw-bold text-uppercase px-3 mb-3">
							Definiçôes</div>
					</li>
					<li><a href="#" class="nav-link px-3"> <span class="me-2"><i
								class="bi bi-graph-up"></i></span> <span>Vendas</span>
					</a></li>
					<li><a href="#" class="nav-link px-3"> <span class="me-2"><i
								class="bi bi-table"></i></span> <span>Relatorio</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- offcanvas -->


	<!-- Corpo Principal da pahina  -->
	<main class="mt-5 pt-3">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<h4>Novo Produto</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12 mb-3">
					<div class="card">
						<div class="card-header">
							<span><i class="bi bi-table me-2"></i></span> Dados para o novo
							Produto
						</div>
						<div class="card-body">
							<div class="table-responsive">








								<form class="col-md-9 m-auto" action="novoProduto" method="post" enctype="multipart/form-data">
									<div class="row">
										<div class="form-group col-md-6 mb-3">
											<label for="inputname">Nome</label> <input type="text"
												class="form-control mt-1" id="name" name="nome"
												placeholder="Nome">
										</div>
										<div class="form-group col-md-6 mb-3">
											<label for="inputemail">Codigo</label> 
											<input type="text"	class="form-control mt-1" id="codigo" name="codigo"		placeholder="Codigo">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-6 mb-3">
											<label for="inputname">Preço</label> <input type="number"
												class="form-control mt-1" id="pais" name="preco"
												placeholder="Preço do produto">
										</div>
										<div class="form-group col-md-6 mb-3">
											<label for="inputemail">Categoria</label> <select
												class="form-control mt-1" id="genero" name="categoria">
												<option>Pc</option>
												<option>Acessorio</option>
												<option>Smartphone</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-6 mb-3">
											<label for="inputname">Quantidade</label> <input
												type="number" class="form-control mt-1" id="enderco"
												name="quantidade" placeholder="Quantidade">
										</div>
										<div class="form-group col-md-6 mb-3">
											<label for="">Imagem</label> 
											<input type="file" name="imagem">
										</div>
									</div>



									<div class="mb-3">
										<label for="inputmessage">Descrição</label>
										<textarea class="form-control mt-1" id="message"
											name="descricao" placeholder="Descreva o produto.." rows="8"></textarea>
									</div>

									<div class="row">
										<div class="col text-end mt-2">
											<button type="submit" class="btn btn-success btn-lg px-3">Confirmar</button>
										</div>
									</div>
								</form>











							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Fim corpo principal da pagina -->

	<script src="./js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
	<script src="./js/jquery-3.5.1.js"></script>
	<script src="./js/jquery.dataTables.min.js"></script>
	<script src="./js/dataTables.bootstrap5.min.js"></script>
	<script src="./js/script.js"></script>
</body>
</html>
