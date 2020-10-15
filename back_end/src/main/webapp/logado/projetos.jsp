<%@page import="javax.swing.text.html.HTML.Attribute"%>
<%@page import="model.RegistraProjetoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RegistraProjetoDao"%>
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
                        Gerenciamento de projetos</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Inclusão de Projetos</h5>
                            <form class="validation" name="registraProj" action="<%=request.getContextPath()%>/projetos" method="post" novalidate>
                                <h1>Gerenciamento de projetos</h1>

                                <p>

                                    <br>                                         

                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Descrição do projeto</span>
                                    </div>
                                    <input type="text" name="descProjeto" placeholder="PHP" required="">
                                </div>


                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Carga horaria</span>
                                    </div>
                                    <select name="cargaTotalHr" id="cargaHoraria" required="" class="custom-select custom-select-lg">
                                        <option value="100h">100 Horas</option>
                                        <option value="500h">500 Horas</option>
                                        <option value="750h">750 Horas</option>
                                        <option value="1000h">1000 Horas</option>
                                        <option value="5000h">5000 Horas</option>
                                    </select>
                                </div>
                       
                                <div class="input-group input-group-sm mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroup-sizing-sm">Status do Projeto</span>
                                    </div>
                                    <select name="statusProjeto" id="statusProjeto" required="" class="custom-select custom-select-lg">
                                        <option value="andamento">Em andamento</option>
                                        <option value="parado">Parado</option>
                                        <option value="finalizado">Finalizado</option>

                                    </select>
                                </div>
                               <input class="btn btn-primary" type="submit" name="enviar" value="Novo Projeto"/>


                            </form>

                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <!--<h5 class="card-title">Finanças I - Projetos</h5>-->
                            <p class="card-text">Gerencie os projetos de seu departamento</p>
                        </div>
                    </div>
                </div>

                <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                    <div class="lh-100">
                        <h4 class="mb-0 lh-100">Seus Projetos</h4>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>Código do Projeto</th>
                                <th>Descrição</th>
                                <th>Status</th>
                                <th>Carga Horaria</th>
                            </tr>
                        </thead>
                        
                        
                            <%
                                RegistraProjetoDao rgProjeto = new RegistraProjetoDao();
                                ArrayList<RegistraProjetoModel> listaArray = rgProjeto.ListaProjeto();
                                int tmListaPt = rgProjeto.ListaProjeto().size();
                                for (int i = 0; i < tmListaPt; i++) {
                            %>
                            <tr>
                                <td><%= listaArray.get(i).getIdProjeto()%>    </td>
                                <td><%= listaArray.get(i).getDescProjeto()%>  </td>
                                <td><%= listaArray.get(i).getStatusProjeto()%></td>
                                <td><%= listaArray.get(i).getCargaTotalHr()%> </td> 
                                <td><a href="editarProjeto.jsp?idProjeto=<%=listaArray.get(i).getIdProjeto()%>&descProjeto=<%=listaArray.get(i).getDescProjeto()%>&statusProjeto=<%=listaArray.get(i).getStatusProjeto()%>&cargaTotalHr=<%=listaArray.get(i).getCargaTotalHr()%>" class="btn btn-danger btn-xs">Editar</a></td>
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