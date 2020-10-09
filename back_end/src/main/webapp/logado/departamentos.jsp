<%@page import="dao.DepartamentoDao"%>
<%@page import="model.DepartamentoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Departamentos - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/offcanvas/">

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
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>

        <main role="main" class="container">

            <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                <div class="lh-100">
                    <h4 class="mb-0">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-building" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
                        <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
                        </svg>
                        Departamentos</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Inclusão de Departamentos</h5>
                            <a href="incluirDepartamento.jsp" class="btn btn-primary">Incluir Departamento</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Departamentos - Espimalomeki Soluções Digitais</h5>
                            <p class="card-text">Gerencie os departamentos de sua organização.</p>
                        </div>
                    </div>
                </div>

                <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                    <div class="lh-100">
                        <h4 class="mb-0 lh-100">Departamentos Ativos</h4>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>Código do Departamento</th>
                                <th>Nome do Departamento</th>
                                <th>Edição</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DepartamentoDao deptos = new DepartamentoDao();
                                ArrayList<DepartamentoModel> listaArray = deptos.listaDeptos();
                                int sizeLista = deptos.listaDeptos().size();
                                for (int i = 0; i < sizeLista; i++) {
                            %>
                            <tr>
                                <td><%= listaArray.get(i).getCodDepto()%></td>
                                <td><%= listaArray.get(i).getNomeDepto()%></td>
                                <td><a href="editarDepartamento.jsp?id=<%=listaArray.get(i).getCodDepto()%>&nome=<%=listaArray.get(i).getNomeDepto()%>" class="btn btn-danger btn-xs">Editar</a></td>
                            </tr>
                            <%
                                }
                            %>
<!--                            <tr>
                                <td>1</td>
                                <td>Presidência</td>
                                <td><a href="#" class="card-link">Editar</a></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Executivo</td>
                                <td><a href="#" class="card-link">Editar</a></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Administração</td>
                                <td><a href="#" class="card-link">Editar</a></td>
                            </tr>-->
                        </tbody>
                    </table>
                </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy; 2020 Espimalomeki</p>
        </footer>
    </body>
    <script type="text/javascript" src="scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js"></script>

    <script src="offcanvas.js"></script>

</html>
