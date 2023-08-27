<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%


ArrayList<Cliente> listaClientes = (ArrayList<Cliente>) request.getAttribute("listaClientes");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet" href="css/style.css" />
<title>Frontendfunn - Bootstrap 5 Admin Dashboard Template</title>
</head>
<body>

	<!--  INICIO NAV DO TOPO -->
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
	<!-- FIM NAV DO TOPO -->
	
	
	<!-- INICIO MENU LATERAL -->
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
							Gerenciar</div>
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
								<li><a href="listarProdutos" class="nav-link px-3"> <span
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
							Relatorio</div>
					</li>
					<li><a href="vendas" class="nav-link px-3"> <span class="me-2"><i
								class="bi bi-graph-up"></i></span> <span>Vendas</span>
					</a></li>
					<li><a href="#" class="nav-link px-3"> <span class="me-2"><i
								class="bi bi-table"></i></span> <span>Relatorio</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Fim Menu Lateral -->
	
	<main class="mt-5 pt-3">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-12 mb-3">
					<div class="card">
						<div class="card-header">
							<span><i class="bi bi-table me-2"></i></span> Clientes
							Cadastrados no Sistema
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="table table-striped data-table"
									style="width: 100%">
									<thead>
										<tr>
											<th>Codigo</th>
											<th>Email</th>
											<th>Nome</th>
											<th>Apelido</th>
											<th>Genero</th>
											<th>Telefone</th>
											<th>Pais</th>
											<th>Cidade</th>
											<th>Endereco</th>
											<th>Data Criacao</th>
										</tr>
									</thead>

									<tbody>
										<%
										for (int i = 0; i < listaClientes.size(); i++) {
										%>
										<tr>
											<td><%=listaClientes.get(i).getCodUsuario()%></td>
											<td><%=listaClientes.get(i).getEmail()%></td>
											<td><%=listaClientes.get(i).getNome()%></td>
											<td><%=listaClientes.get(i).getApelido()%></td>
											<td><%=listaClientes.get(i).getGenero()%></td>
											<td><%=listaClientes.get(i).getNumTelefone()%></td>
											<td><%=listaClientes.get(i).getPais()%></td>
											<td><%=listaClientes.get(i).getCidade()%></td>
											<td><%=listaClientes.get(i).getEndereco()%></td>
											<td><%=listaClientes.get(i).getDataCriacao()%></td>
										</tr>
										<%
										}
										%>
									</tbody>

									<tfoot>
										<tr>
											<th>Codigo</th>
											<th>Email</th>
											<th>Nome</th>
											<th>Apelido</th>
											<th>Telefone</th>
											<th>Pais</th>
											<th>Cidade</th>
											<th>Endereco</th>
											<th>Genero</th>
											<th>Data Criacao</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="./js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
	<script src="./js/jquery-3.5.1.js"></script>
	<script src="./js/jquery.dataTables.min.js"></script>
	<script src="./js/dataTables.bootstrap5.min.js"></script>
	<script src="./js/script.js"></script>
</body>
</html>
