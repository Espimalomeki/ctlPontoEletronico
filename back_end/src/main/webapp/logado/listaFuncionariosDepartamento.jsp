<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jstl/core_rt" prefix = "c" %>

<%@page import="dao.FuncionarioDao"%>
<%@page import="model.FuncionarioModel"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lista de Funcionários do Departamento - Portal Espimalomeki</title>

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
    <script>
        function download(filename, text) {
            var element = document.createElement('a');
            element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
            element.setAttribute('download', filename);

            element.style.display = 'none';
            document.body.appendChild(element);

            element.click();

            document.body.removeChild(element);
        }

    </script>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>

        <main role="main" class="container-md">

            <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                <div class="lh-100">
                    <h4 class="mb-0 text-white lh-100">${sessionScope.nomeDepto}</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <form class="card p-0" method="POST" action="">
                        <div class="input-group">
                            <input type="text" class="form-control" name="queryText" placeholder="Pesquisar por nome..">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary">Pesquisar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span>Lista de Funcionários do Departamento</span>
                        <%
                            int codDepto = Integer.parseInt(session.getAttribute("codDepto").toString());
                            
                            FuncionarioDao listaFunc = new FuncionarioDao();
                            ArrayList<FuncionarioModel> listaArray = null;
                            int totalfunc = 0;
                            
                            String query = request.getParameter("queryText");
                            if(query!=null){
                                listaArray = listaFunc.listaFiltroDepto(query, codDepto);
                                totalfunc = listaFunc.listaFiltroDepto(query, codDepto).size();
                            }
                            else{
                                listaArray = listaFunc.listaFuncDepto(codDepto);
                                totalfunc = listaFunc.listaFuncDepto(codDepto).size();
                                
                            }

                        %>
                        <span class="badge badge-secondary badge-pill"><%= totalfunc%></span>
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
                            <th>Banco De Horas</th>
                            <c:if test="${sessionScope.perfil == 'RH'}">
                            <th>Editar</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                    <tbody>
                        <% for (int i = 0; i < totalfunc; i++) { %>    
                        <tr>
                            <td><%=listaArray.get(i).getNumMatricula()%></td>
                            <td><%= listaArray.get(i).getNome()%>  </td>
                            <td><%= listaArray.get(i).getCargo()%></td>
                            <td><%= listaArray.get(i).getEmail()%> </td>
                            <td><a href="perfilProfissionalGestao.jsp?id=<%=listaArray.get(i).getNumMatricula()%>" class="card-link">Detalhar</a></td>
                            <td><a class="btn btn-primary btn-banco" id="bc<%=listaArray.get(i).getNumMatricula()%>" href="bancoDeHoras.jsp?rgm=<%=listaArray.get(i).getNumMatricula()%>">Visualizar</a></td>
                            <% if (session.getAttribute("perfil").toString().equals("RH") && listaArray.get(i).getDataRescisao() == null) {%>  
                            <td><a class="btn btn-danger" href="editarFuncionario.jsp?numMatricula=<%=listaArray.get(i).getNumMatricula()%>">Editar</a></td>
                            <%} else if (session.getAttribute("perfil").toString().equals("RH") && listaArray.get(i).getDataRescisao() != null) {%>
                            <td><a class="btn btn-outline-danger disabled">Desligado</a></td>
                            <%}%>
                        </tr>
                        <%
                            }
                        %>        
                    </tbody>
                </table>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
                <p class="mb-1">&copy; 2020 Espimalomeki</p>
            </footer>
            <script>
            </script>
            <script type="text/javascript" src="scripts.js"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
            <script src="form-validation.js"></script>
</html>
