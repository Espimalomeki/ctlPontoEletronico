<%@page import="model.PontoEletronicoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PontoEletronicoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jstl/core_rt" prefix = "c" %>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Pagina Inicial - Portal Espimalomeki</title>
        <link rel="stylesheet" type="text/css" href="../style/menu.css">
        <link rel="stylesheet" type="text/css" href="../style/principal.css">


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
            <div class="conter">
                <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                    <div class="lh-100">
                        <h6 class="mb-0 text-white lh-100">Olá! ${sessionScope.nomeFunc}</h6>
                        <small class="font-pequena">${sessionScope.perfil}</small>
                    </div>
                </div>

                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <h6 class="border-bottom border-gray pb-2 mb-0">Menu Rápido</h6>
                    <div class="media text-muted pt-3">
                        <svg width="28" height="28" viewBox="0 0 16 16" class="bi mr-3 bi-calendar3" fill="#6F42C1" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
                            <path fill-rule="evenodd" d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                        </svg>
                        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">Calendário</strong>
                                <a href="calendario.jsp">Consultar</a>
                            </div>
                            <span class="d-block">Confira seus compromissos agendados.</span>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.perfil == 'RH'}">
                            <div class="media text-muted pt-3">
                                <svg width="28" height="28" viewBox="0 0 16 16" class="bi mr-3 bi-person-lines-fill" fill="#6F42C1" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
                                </svg>
                                <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                    <div class="d-flex justify-content-between align-items-center w-100">
                                        <strong class="text-gray-dark">Lista de Funcionários</strong>
                                        <a href="listaTodosFuncionarios.jsp">Consultar</a>
                                    </div>
                                    <span class="d-block">Consulte aqui a lista de todos os Funcionários da organização.</span>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${sessionScope.perfil == 'gestor'}">
                            <div class="media text-muted pt-3">
                                <svg width="28" height="28" viewBox="0 0 16 16" class="bi mr-3 bi-person-lines-fill" fill="#6F42C1" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
                                </svg>
                                <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                    <div class="d-flex justify-content-between align-items-center w-100">
                                        <strong class="text-gray-dark">Lista de Funcionários do Departamento</strong>
                                        <a href="listaFuncionariosDepartamento.jsp">Consultar</a>
                                    </div>
                                    <span class="d-block">Consulte aqui a lista de todos os Funcionários de seu Departamento.</span>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                    <div class="media text-muted pt-3">
                        <svg width="28" height="28" viewBox="0 0 16 16" class="bi mr-3 bi-stopwatch" fill="#6F42C1" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M6 .5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H9v1.07A7.001 7.001 0 0 1 8 16 7 7 0 0 1 7 2.07V1h-.5A.5.5 0 0 1 6 .5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3zm0 2.1a.5.5 0 0 1 .5.5V9a.5.5 0 0 1-.5.5H4.5a.5.5 0 0 1 0-1h3V5.6a.5.5 0 0 1 .5-.5z"/>
                        </svg>
                        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">Ponto Eletrônico</strong>
                                <a href="pontoEletronico.jsp">Consultar</a>
                            </div>
                            <span class="d-block">Acesse seu ponto eletrônico, você pode registrar seu ponto e conferir horas trabalhadas.</span>
                        </div>
                    </div>
                    <c:if test="${sessionScope.perfil == 'gestor'}">
                    <div class="media text-muted pt-3">
                        <svg width="28" height="28" viewBox="0 0 16 16" class="bi mr-3 bi-kanban" fill="#6F42C1" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M13.5 1h-11a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zm-11-1a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2h-11z"/>
                            <path d="M6.5 3a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1V3zm-4 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1V3zm8 0a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1V3z"/>
                        </svg>
                        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">Projetos</strong>
                                <a href="projetos.jsp">Gerenciar</a>
                            </div>
                            <span class="d-block">Gerencie os projetos de seu departamento.</span>
                        </div>
                    </div>
                    </c:if>
                    <div class="media text-muted pt-3">
                        <svg width="28" height="28" viewBox="0 0 16 16" class="bi mr-3 bi-clock-history" fill="#6F42C1" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z"/>
                            <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z"/>
                            <path fill-rule="evenodd" d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z"/>
                        </svg>
                        <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <strong class="text-gray-dark">Banco de Horas</strong>
                                <a href="bancoDeHoras.jsp">Consultar</a>
                            </div>
                            <span class="d-block">Acesse seu banco de horas e verifique suas horas trabalhadas.</span>
                        </div>
                    </div>
                </div>

            </div>

            <div id="area-alerta" style="position: absolute; width: auto; height: auto; bottom: 0px; right: 0px; padding: 30px">
            </div>

        </main>
    </body>
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
    <script src="offcanvas.js"></script> -->

    <script>
        window.addEventListener("load", () => {
            let areaAlerta = document.getElementById("area-alerta");
            var xhrAlertas = new XMLHttpRequest();
            xhrAlertas.open("GET", "../AlertasEventosServlet", true);
            xhrAlertas.onload = function (e) {
                if (xhrAlertas.readyState === 4) {
                    if (xhrAlertas.status === 200) {
                        areaAlerta.innerHTML = xhrAlertas.responseText;
                        setTimeout(() => {
                            areaAlerta.innerHTML = "";
                        }, 8000);
                    }
                }
            };
            xhrAlertas.onerror = function (e) {
                console.error(xhrAlertas.statusText);
            };
            xhrAlertas.send(null);

        });
    </script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>
