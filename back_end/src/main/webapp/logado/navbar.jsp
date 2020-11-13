<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jstl/core_rt" prefix = "c" %>
<head>    
    <link rel="stylesheet" type="text/css" href="../style/menu.css">
</head>
<link rel="stylesheet" href="../style/style.css">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark row">
    <div class="logo col-md-3 col-sm-12 centralizar">

        <a class="navbar-brand mr-auto mr-lg-2" href="principal.jsp">
            <div class="contem-logo">
                <img src="../resources/espimalomeki.png" class="img-logo" alt="">
            </div>
            <p class="txt-logo pl-1">Portal Espimalomeki</p>
        </a>
        <button class="navbar-toggler p-0 border-0 menu-app" id="abrir-menu" type="button" data-toggle="offcanvas">
            <span class="navbar-toggler-icon"></span>
        </button>

    </div>
    <div class="collapse navbar-collapse offcanvas-collapse col-md-9 col-sm-3" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link nav-syze" href="principal.jsp">Pagina Inicial<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-syze" href="pontoEletronico.jsp">Ponto Eletrônico</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-syze" href="bancoDeHoras.jsp">Banco de Horas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-syze" href="alocacaoDeHoras.jsp">Alocação de Horas </a>
            </li>
            <c:if test="${sessionScope.perfil == 'gestor'}">
                <li class="nav-item">
                    <a class="nav-link nav-syze dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Projetos</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="projetos.jsp">Gerenciamento de Projetos</a>
                        <a class="dropdown-item" href="projetoDemaisFunc.jsp">Visualizar Projetos</a>
                    </div>
                </li>
            </c:if>
            <c:if test="${sessionScope.perfil == 'RH'}">
                <li class="nav-item">
                    <a class="nav-link nav-syze" href="departamentos.jsp">Departamentos</a>
                </li>
            </c:if>
            <c:choose>
                <c:when test="${sessionScope.perfil == 'RH'}">
                    <li class="nav-item">
                        <a class="nav-link nav-syze dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="cadastrarFuncionario.jsp">Cadastrar Funcionário</a>
                            <a class="dropdown-item"  href="listaTodosFuncionarios.jsp">Lista de Funcionários</a>
                            <a class="dropdown-item"  href="fichaFunc.jsp">Ficha de Funcionários</a>
                        </div>
                    </li>
                </c:when>
                <c:when test="${sessionScope.perfil == 'gestor'}">
                    <li class="nav-item">
                        <a class="nav-link nav-syze dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item"  href="listaFuncionariosDepartamento.jsp">Lista de Funcionários por Departamento</a>
                            <a class="dropdown-item"  href="listaTodosFuncionarios.jsp">Lista de Funcionários</a>
                            <a class="dropdown-item"  href="fichaFunc.jsp">Ficha de Funcionários</a>
                            <a class="dropdown-item"  href="incluirFuncionarioProjeto.jsp">Incluir Funcionários Em Projeto</a>
                        </div>
                    </li>
                </c:when>
            </c:choose>
            <li class="nav-item dropdown">
                <a class="nav-link nav-syze" href="calendario.jsp">Calendário</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-syze" href="perfilProfissional.jsp">Perfil Profissional </a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a class="nav-link nav-syze" href="../Logout" aria-haspopup="true" aria-expanded="false">Sair</a>
        </form>
    </div>

    <div class="nav-cel" id="nav-cel">
        <div class="col-12" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link nav-syze" href="principal.jsp">Pagina Inicial<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-syze" href="pontoEletronico.jsp">Ponto Eletrônico</a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.perfil == 'gestor'}">
                        <li class="nav-item">
                            <a class="nav-link nav-syze dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Banco de Horas
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="bancoDeHoras.jsp">Banco de Horas</a>
                                <a class="dropdown-item" href="bancoDeHorasGestor.html">Banco De Horas - Gestor</a>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link nav-syze" href="bancoDeHoras.jsp">Banco de Horas</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link nav-syze" href="alocacaoDeHoras.jsp">Alocação de Horas </a>
                </li>
                <c:if test="${sessionScope.perfil == 'gestor'}">
                    <li class="nav-item">
                        <a class="nav-link nav-syze dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Projetos</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="projetos.jsp">Gerenciamento de Projetos</a>
                            <a class="dropdown-item" href="projetoDemaisFunc.jsp">Visualizar Projetos</a>
                        </div>
                    </li>
                </c:if>
                <c:if test="${sessionScope.perfil == 'RH'}">
                    <li class="nav-item">
                        <a class="nav-link nav-syze" href="departamentos.jsp">Departamentos</a>
                    </li>
                </c:if>
                <c:choose>
                    <c:when test="${sessionScope.perfil == 'RH'}">
                        <li class="nav-item">
                            <a class="nav-link nav-syze dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="cadastrarFuncionario.jsp">Cadastrar Funcionário</a>
                                <a class="dropdown-item"  href="listaTodosFuncionarios.jsp">Lista de Funcionários</a>
                                <a class="dropdown-item"  href="fichaFunc.jsp">Ficha de Funcionários</a>
                            </div>
                        </li>
                    </c:when>
                    <c:when test="${sessionScope.perfil == 'gestor'}">
                        <li class="nav-item">
                            <a class="nav-link nav-syze dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item"  href="listaFuncionariosDepartamento.jsp">Lista de Funcionários por Departamento</a>
                                <a class="dropdown-item"  href="listaTodosFuncionarios.jsp">Lista de Funcionários</a>
                                <a class="dropdown-item"  href="fichaFunc.jsp">Ficha de Funcionários</a>
                                <a class="dropdown-item"  href="incluirFuncionarioProjeto.jsp">Incluir Funcionários Em Projeto</a>
                            </div>
                        </li>
                    </c:when>
                </c:choose>
                <li class="nav-item dropdown">
                    <a class="nav-link nav-syze" href="calendario.jsp">Calendário</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-syze" href="perfilProfissional.jsp">Perfil Profissional </a>
                </li>
            
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <a class="nav-link nav-syze" href="../Logout" aria-haspopup="true" aria-expanded="false">Sair</a>
            </form>
        </div>
    </div>

</nav>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script>
        let abrirMenu = document.getElementById("abrir-menu");
	let navCel = document.getElementById("nav-cel");
	let conteudo = document.getElementById("conteudo");

	abrirMenu.addEventListener("click",()=>{
		if(!navCel.classList.contains("menu-ativo")){
                    navCel.classList.add("menu-ativo");
		}else{
                    navCel.classList.remove("menu-ativo");
		}
	});
</script>