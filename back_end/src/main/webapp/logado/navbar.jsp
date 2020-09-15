<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jstl/core_rt" prefix = "c" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="../style/style.css">
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
        <div class="logo">
            <a class="navbar-brand mr-auto mr-lg-2" href="principal.jsp">
                <img src="../resources/espimalomeki.png" class="img-logo" alt="">
                <p class="txt-logo">Portal Espimalomeki</p>
            </a>
            <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="principal.jsp">Pagina Inicial<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pontoEletronico.jsp">Ponto Eletrônico</a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.perfil == 'gestor'}">
                        <li class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Banco de Horas
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="bancoDeHoras.html">Banco de Horas</a>
                                <a class="dropdown-item" href="bancoDeHorasGestor.html">Banco De Horas - Gestor</a>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="bancoDeHoras.html">Banco de Horas</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link" href="#">Alocação de Horas </a>
                </li>
                <c:if test="${sessionScope.perfil == 'gestor'}">
                    <li class="nav-item">
                    <a class="nav-link" href="projetos.jsp">Projetos</a>
                </li>
                </c:if>
                <c:choose>
                    <c:when test="${sessionScope.perfil == 'RH'}">
                        <li class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="cadastrarFuncionario.jsp">Cadastrar Funcionário</a>
                                <a class="dropdown-item"  href="listaFuncionariosDepartamento.jsp">Lista de Funcionários por Departamento</a>
                            </div>
                        </li>
                    </c:when>
                    <c:when test="${sessionScope.perfil == 'gestor'}">
                        <li class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item"  href="listaFuncionariosDepartamento.jsp">Lista de Funcionários por Departamento</a>
                            </div>
                        </li>
                    </c:when>
                </c:choose>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">Calendário</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Perfil Profissional </a>
                </li>

            </ul>
            <form class="form-inline my-2 my-lg-0">
                <a class="nav-link" href="../index.jsp" aria-haspopup="true" aria-expanded="false">Sair</a>
            </form>
        </div>
    </nav>
</html>
