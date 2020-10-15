<%@page import="model.PontoEletronicoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PontoEletronicoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Pagina Inicial - Portal Espimalomeki</title>

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
      <%--   <%
            PontoEletronicoDao listaFunc = new PontoEletronicoDao();
            ArrayList<PontoEletronicoModel> listaArray = listaFunc.listaDeveHoras();
            int totalfunc = listaFunc.listaDeveHoras().size();
        %> --%>

        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>

        <main role="main" class="container">
            <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                <div class="lh-100">
                    <h6 class="mb-0 text-white lh-100">Olá! ${sessionScope.nomeFunc}</h6>
                    <small>${sessionScope.perfil}</small>
                </div>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <h6 class="border-bottom border-gray pb-2 mb-0">Menu Rápido</h6>
                <div class="media text-muted pt-3">
                    <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#DAA520"/></svg>
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Calendário</strong>
                            <a href="calendario.jsp">Consultar</a>
                        </div>
                        <span class="d-block">Confira seus compromissos agendados.</span>
                    </div>
                </div>
                <div class="media text-muted pt-3">
                    <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"/></svg>
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Lista de Funcionários</strong>
                            <a href="#">Consultar</a>
                        </div>
                        <span class="d-block">Consulte aqui a lista de todos os Funcionários de seu Departamento.</span>
                    </div>
                </div>
                <div class="media text-muted pt-3">
                    <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Ponto Eletrônico</strong>
                            <a href="pontoEletronico.jsp">Consultar</a>
                        </div>
                        <span class="d-block">Consulte o Ponto Eletrônico dos funcionários de seu departamento, você também pode realizar ajustes de batidas incorretas.</span>
                    </div>
                </div>
                <div class="media text-muted pt-3">
                    <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"/><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Projetos</strong>
                            <a href="#">Gerenciar</a>
                        </div>
                        <span class="d-block">Gerencie os projetos de seu departamento.</span>
                    </div>
                </div>
                <div class="media text-muted pt-3">
                    <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#00FF7F"/><text x="50%" y="50%" fill="#00FF7F" dy=".3em">32x32</text></svg>
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">Banco de Horas</strong>
                            <a href="#">Consultar</a>
                        </div>
                        <span class="d-block">Consulte o banco de horas dos funcionários de seu departamento, você também pode gerar relatórios coletivos e individuais.</span>
                    </div>
                </div>
                <small class="d-block text-right mt-3">
                    <a href="#">Ver mais</a>
                </small>
            </div>
<%-- 
            <div class="row">
                <div class="col-6">
                    <div class="card border-warning mb-3" style="">
                        <h3 class="card-header text-white bg-warning text-center">Funcionários Devendo Horas</h3>
                        <div class="card-body text-warning">
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr id="trTable">
                                        <th><center>RGM</center></th>
                                        <th><center>Nome</center></th>    
                                        <th><center>Horas</center></th>
                                    </tr>
                                </thead>
                                <tbody id="listaPontosEletronicos">
                                     <%
                                        int numM;
                                        String resulString = "";
                                        for (int i = 0; i < totalfunc; i++) {
                                            numM = listaArray.get(i).getNumMatricula();


                                            resulString += 
                                                    "<tr>"+
                                            "<td>"+numM+"</td>"+
                                            "<td>"+listaArray.get(i).getNomeUsuario()+"</td>"+
                                            "<td>"+listaArray.get(i).getQtdHorasTrabalhadas()+"</td>"+                                            
                                            "</tr>";
                                        }
                                        out.print(resulString);
                                    %>        
                                    
                                    
                                    <tr>
                                        <td><center>20860269</center></td>
                                        <td><center>Henrique de Ferraz</center></td>
                                        <td><center>02:30:20</center></td>
                                    </tr>
                                </tbody>
                            </table>

                            <!--<p class="card-text"><b>20860269</b> - Henrique de Ferraz </p>-->
                            <!--<h5 class="card-title">Henrique de Ferraz </h5>-->
                            <!--<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>-->
                        </div>
                    </div>
                </div>
            </div>
              --%>                      
        </main>
    </body>
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
    <script src="offcanvas.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>
