<%@page import="model.FichaFuncModel"%>
<%@page import="javax.swing.text.html.HTML.Attribute"%>
<%@page import="model.FuncionarioModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FichaFuncDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Projetos - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/offcanvas/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
        <meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
        <meta name="theme-color" content="#563d7c">


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
                        <svg class="bi bi-clipboard-data" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4 1.5H3a2 2 0 00-2 2V14a2 2 0 002 2h10a2 2 0 002-2V3.5a2 2 0 00-2-2h-1v1h1a1 1 0 011 1V14a1 1 0 01-1 1H3a1 1 0 01-1-1V3.5a1 1 0 011-1h1v-1z" clip-rule="evenodd"/>
                        <path fill-rule="evenodd" d="M9.5 1h-3a.5.5 0 00-.5.5v1a.5.5 0 00.5.5h3a.5.5 0 00.5-.5v-1a.5.5 0 00-.5-.5zm-3-1A1.5 1.5 0 005 1.5v1A1.5 1.5 0 006.5 4h3A1.5 1.5 0 0011 2.5v-1A1.5 1.5 0 009.5 0h-3z" clip-rule="evenodd"/>
                        <path d="M4 11a1 1 0 112 0v1a1 1 0 11-2 0v-1zm6-4a1 1 0 112 0v5a1 1 0 11-2 0V7zM7 9a1 1 0 012 0v3a1 1 0 11-2 0V9z"/>
                        </svg>
                        Fichas de Funcionários</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">Visualize aqui as fichas de funcionario, você também pode exportar em PDF.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Exportar em PDF</h5>
                            <form class="validation" name="filtraFuncionario" action="<%=request.getContextPath()%>/PDFiltro" target="_blank" method="post" novalidate>
                                <label>Filtrar por Número de Matrícula:</label>
                                    <input class="input-group input-group-sm form-control mb-3" type="text" value="" name="matricula">
                                    <button class="btn btn-primary btn-md" type="submit" name="enviar" value="Enviar" novalidate>Filtrar dados por matricula</button>           
                            </form>
                            <hr class="mb-3">
                            <form class="validation" name="geral" action="<%=request.getContextPath()%>/PDGeral" target="_blank" novalidate>
                                    <button class="btn btn-primary btn-md" type="submit" name="envia" value="Envia" novalidate>Exportar Relatório Geral</button>           
                            </form>

                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>N° Matricula</th>
                                <th>Nome</th>
                                <th>Cargo</th>
                                <th>Departamento</th>
                                <th>ID Projeto</th>
                                <th>Projeto</th>
                                <th>Horas Alocadas</th>
                                <th>Horas Totais</th>
                            </tr>
                        </thead>
                        <br>
                        <%
                            FichaFuncDao ficha = new FichaFuncDao();
                            ArrayList<FichaFuncModel> listaArray = ficha.ListaFichas();
                            int tmListaPt = ficha.ListaFichas().size();
                            for (int i = 0; i < tmListaPt; i++) {
                        %>
                        <tr>
                            <td><%= listaArray.get(i).getNumMatricula()%>   </td>
                            <td><%= listaArray.get(i).getNome()%>           </td>
                            <td><%= listaArray.get(i).getCargo()%>          </td> 
                            <td><%= listaArray.get(i).getNomeDepto()%>      </td> 
                            <td><%= listaArray.get(i).getIdProjeto()%>      </td> 
                            <td><%= listaArray.get(i).getDescProjeto()%>    </td> 
                            <td><%= listaArray.get(i).getQtdHoras()%>       </td> 
                            <td><%= listaArray.get(i).getHorasProjeto()%>   </td> 
                        </tr>
                        <%
                            }
                        %>
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