<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lista de Funcionários - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="form-validation.css" rel="stylesheet">
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>

        <main role="main" class="container-md">

            <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                <div class="lh-100">
                    <h4 class="mb-0 text-white lh-100">Finanças I</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <form class="card p-0">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Pesquisar por nome">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary">Pesquisar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span>Lista de Funcionários do Departamento</span>
                        <span class="badge badge-secondary badge-pill">6</span>
                    </h4>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table sm">
                    <thead>
                        <tr>
                            <th>Matrícula</th>
                            <th>Nome Completo</th>
                            <th>Cargo</th>
                            <th>Email</th>
                            <th>Perfil Profissional</th>
                            <th>Ficha do Funcionário</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>00010</td>
                            <td>André Ferreira</td>
                            <td>GERENTE DE PROJETOS JR</td>
                            <td>andreferreira@espimalomeki.com</td>
                            <td><a href="perfilProfissional.html" class="card-link">Detalhar</a></td>
                            <td><a href="#" class="card-link">Visualizar</a></td>
                        </tr>
                        <tr>
                            <td>00920</td>
                            <td>João Freire Costa e Silva</td>
                            <td>ANALISTA DE PROJETO SR</td>
                            <td>joaofreirecosta@espimalomeki.com</td>
                            <td><a href="#" class="card-link">Detalhar</a></td>
                            <td><a href="#" class="card-link">Visualizar</a></td>
                        </tr>
                        <tr>
                            <td>01302</td>
                            <td>Carlos Rugai Antonier</td>
                            <td>ENGENHEIRO DE SOFTWARE PL</td>
                            <td>carlosrugaiantonier@espimalomeki.com</td>
                            <td><a href="#" class="card-link">Detalhar</a></td>
                            <td><a href="#" class="card-link">Visualizar</a></td>
                        </tr>
                        <tr>
                            <td>01304</td>
                            <td>Carol Mattos do Vale</td>
                            <td>ENGENHEIRO DE SOFTWARE JR</td>
                            <td>carolmattosvale@espimalomeki.com</td>
                            <td><a href="#" class="card-link">Detalhar</a></td>
                            <td><a href="#" class="card-link">Visualizar</a></td>
                        </tr>
                        <tr>
                            <td>02160</td>
                            <td>Rafael dos Santos</td>
                            <td>ANALISTA DE PROCESSOS SR</td>
                            <td>rafaelsantos@espimalomeki.com</td>
                            <td><a href="#" class="card-link">Detalhar</a></td>
                            <td><a href="#" class="card-link">Visualizar</a></td>
                        </tr>
                        <tr>
                            <td>00101</td>
                            <td>Rute Ovalle Guimarães</td>
                            <td>ANALISTA DE BANCO DE DADOS SR</td>
                            <td>ruteovalleguimaraes@espimalomeki.com</td>
                            <td><a href="#" class="card-link">Detalhar</a></td>
                            <td><a href="#" class="card-link">Visualizar</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
                <p class="mb-1">&copy; 2020 Espimalomeki</p>
            </footer>

            <script type="text/javascript" src="scripts.js"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
            <script src="form-validation.js"></script>
</html>
