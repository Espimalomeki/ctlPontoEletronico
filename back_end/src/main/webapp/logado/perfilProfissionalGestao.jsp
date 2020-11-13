<%@page import="dao.SenhaDao"%>
<%@page import="model.AlteraSenhaModel"%>
<%@page import="model.FuncionarioModel"%>
<%@page import="dao.FuncionarioDao"%>
<%@ taglib uri = "http://java.sun.com/jstl/core_rt" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Perfil Profissional - Portal Espimalomeki</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

        <!-- Custom styles for this template -->
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
            <link rel="stylesheet" type="text/css" href="../style/perfilProfissional.css">
        </header>

        <main role="main" class="container">

            <%
                FuncionarioDao funcDao = new FuncionarioDao();
                int numMatricula = Integer.parseInt(request.getParameter("id"));
                FuncionarioModel func = funcDao.retornaFuncionario(numMatricula);
            %>

            <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                <div class="lh-100">
                    <h5 class="mb-0">
                        <svg class="bi bi-people-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 008 15a6.987 6.987 0 005.468-2.63z"/>
                        <path fill-rule="evenodd" d="M8 9a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
                        <path fill-rule="evenodd" d="M8 1a7 7 0 100 14A7 7 0 008 1zM0 8a8 8 0 1116 0A8 8 0 010 8z" clip-rule="evenodd"/>
                        </svg>
                        Perfil do Profissional - <%=func.getNome()%></h5>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Dados Pessoais</h5>
                            <p class="card-text">Nome Completo: <%=func.getNome()%></p>
                            <p class="card-text">CPF: <%=func.getCpf()%></p>
                            <p class="card-text">Documento de Identidade: <%=func.getRne()%></p>
                            <p class="card-text">Data de Nascimento: <%=func.getDataNasc()%></p>
                            <p class="card-text">E-mail: <%=func.getEmail()%></p>
                            <br>
                            <h6 class="card-title">Endereço</h6>
                            <p class="card-text"><%=func.getEndereco()%></p>
                            <p class="card-text">Complemento: <%=func.getComplemento()%></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <% if (func.getDataRescisao() != null) {%>
                    <div class="mb-2 card">
                        <div class="card-body">
                            <h5 class="text-danger">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-dash-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                </svg> Atenção!
                            </h5>
                            <p>O funcionário <b><%=func.getNome()%></b> foi desligado dia <%=func.getDataRescisao()%></p>
                        </div>
                    </div>   
                    <%}%>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Dados Profissionais</h5>
                            <p class="card-text">Número de Matrícula: <%=func.getNumMatricula()%></p>
                            <p class="card-text">Data de Admissão: <%=func.getDataAdmissao()%></p>
                            <p class="card-text">Cargo: <%=func.getCargo()%></p>
                            <p class="card-text">Carga Horaria: <%=func.getCargaHoraria()%></p>
                            <p class="card-text">Salário: <%=func.getSalario()%></p>
                            <p class="card-text">Conta Bancária: <%=func.getContaBancaria()%></p>
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                    <div class="lh-100">
                        <c:choose>
                            <c:when test="${sessionScope.perfil == 'RH'}">
                                <a href="listaTodosFuncionarios.jsp" role="button"  class="btn btn-secondary btn-md">Voltar</a>
                            </c:when>
                            <c:when test="${sessionScope.perfil == 'gestor'}">
                                <a href="listaFuncionariosDepartamento.jsp" role="button"  class="btn btn-secondary btn-md">Voltar</a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>  
        </main>
        <footer class="my-4 pt-3 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy; 2020 Espimalomeki</p>
        </footer>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
</html>
