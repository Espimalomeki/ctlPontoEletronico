<%@page import="dao.FuncionarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.FuncionarioModel"%>
<%@page import="java.util.ArrayList"%>

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
                    <h4 class="mb-0 text-white lh-100">Lista de Funcionários da Espimalomeki</h4>
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
                        <span>Lista de Funcionários</span>
                        <%
                            FuncionarioDao listaFunc = new FuncionarioDao();
                            ArrayList<FuncionarioModel> listaArray = listaFunc.listaGeralFunc();
                            int totalfunc = listaFunc.listaGeralFunc().size();
                        %>
                        <span class="badge badge-secondary badge-pill"><%= totalfunc%></span>
                    </h4>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table sm" id="tabela-func">
                    <thead>
                        <tr>
                            <th>Matrícula</th>
                            <th>Nome Completo</th>
                            <th>Cargo</th>
                            <th>Email</th>
                            <th>Perfil Profissional</th>
                            <th>Banco De Horas</th>
                            <th>Editar/ Desl.</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tbody>
                        <%
                            for (int i = 0; i < totalfunc; i++) {
                        %>    
                        <tr>
                            <td><%=listaArray.get(i).getNumMatricula()%></td>
                            <td><%= listaArray.get(i).getNome()%>  </td>
                            <td><%= listaArray.get(i).getCargo()%></td>
                            <td><%= listaArray.get(i).getEmail()%> </td>
                            <td><a href="#" class="card-link">Detalhar</a></td>
                            <td><a class="btn btn-primary btn-banco" id="bc<%=listaArray.get(i).getNumMatricula()%>" href="bancoDeHoras.jsp?rgm=<%=listaArray.get(i).getNumMatricula()%>">Visualizar</a></td>
                    <c:if test="${sessionScope.perfil == 'RH'}">
                        <td><a class="btn btn-danger btn-xs" href="editarFuncionario.jsp?numMatricula=<%=listaArray.get(i).getNumMatricula()%>">Editar</a></td>
                    </c:if>
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
                setTimeout(function(){ $('#tabela-func').DataTable(); }, 10000);
            </script>
            <script type="text/javascript" src="scripts.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <script src="/docs/4.4/dist/js/bootstrap.bundle.min.js"></script>
            
</html>