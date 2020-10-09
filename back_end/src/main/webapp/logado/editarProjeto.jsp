<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Departamento - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

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
        <link href="form-validation.css" rel="stylesheet">
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>
        <main role="main" class="container">
            <div class="d-flex align-items-center p-3 my-3 text-white bg-dark rounded shadow-sm">
                <div class="lh-100">
                    <h3>Editar Projetos</h3>
                </div>
            </div>
            <div class="col-md-8 order-md-1">

                <h4 class="mb-3">Informações</h4>

                <form class="validation" name="editaProjeto" action="<%=request.getContextPath()%>/EditarProjeto" method="POST" novalidate>
                    <div class="mb-3">
                        <label>Código do Projeto</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="idProjeto" value="<%=request.getParameter("idProjeto")%>" readonly="true"/>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label >Descrição do Projeto</label>
                        <div class="input-group input-group-sm mb-3">
                            <input type="text" class="form-control" name="descProjeto" value="<%=request.getParameter("descProjeto")%>">
                            <div class="invalid-feedback" style="width: 100%;">
                                Descrição do projeto é requerido.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label >Status do Projeto</label>
                        <div class="input-group input-group-sm mb-3">
                            <select  class="form-control" name="statusProjeto" value="<%=request.getParameter("statusProjeto")%>">
                          <option value="andamento">Em andamento</option>
                          <option value="parado">Parado</option>
                          <option value="finalizado">Finalizado</option>
                            </select>
                              
                        </div>
                    </div>

                    <div class="mb-3">
                        <label >Carga Horaria Total</label>
                        <div class="input-group input-group-sm mb-3">
                            <select  class="form-control" name="cargaTotalHr" value="<%=request.getParameter("cargaTotalHr")%>">
                            <option value="100h">100 Horas</option>
                            <option value="500h">500 Horas</option>
                            <option value="750h">750 Horas</option>
                            <option value="1000h">1000 Horas</option>
                            <option value="5000h">5000 Horas</option>
                            </select>
                        </div>
                    </div>

                    <hr class="mb-4">

                    <button class="btn btn-primary btn-lg" type="submit" name="enviar" value="Enviar">Editar Projeto</button>

                </form>
            </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy;2020 Espimalomeki</p>
        </footer>
    </body>
</html>