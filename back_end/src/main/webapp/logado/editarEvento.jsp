<%@page import="model.CalendarioModel"%>
<%@page import="model.CalendarioDTO"%>
<%@page import="dao.CalendarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Calendário - Portal Espimalomeki</title>
        <link href='../resources/fullcalendar/lib/main.css' rel='stylesheet' />
        <script src='../resources/fullcalendar/lib/main.js'></script>
        <script src='../resources/fullcalendar/lib/locales-all.js'></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>
        <main role="main" class="container mt-100" >

            <div class="col-md-8 order-md-1" style="margin-top:100px;">

                <div class="lh-100 mb-3">
                    <h4 class="mb-0 lh-100">
                        <svg class="bi bi-calendar-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 2a2 2 0 012-2h12a2 2 0 012 2H0z"/>
                        <path fill-rule="evenodd" d="M0 3h16v11a2 2 0 01-2 2H2a2 2 0 01-2-2V3zm6.5 4a1 1 0 100-2 1 1 0 000 2zm4-1a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm-8 2a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm4-1a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm-8 2a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm4-1a1 1 0 11-2 0 1 1 0 012 0z" clip-rule="evenodd"/>
                        </svg>
                        Editar evento de Calendário
                    </h4>
                </div>
                
                <%
                    CalendarioDao dao = new CalendarioDao();
                    int id = Integer.parseInt(request.getParameter("id"));
                    CalendarioDTO evento = dao.listaUnico(id);
                %>
                
                <form class="validation" name="incluirEvento" action="<%=request.getContextPath()%>/EditaEvento" method="post" novalidate>

                    <div class="mb-3">
                        <label name="idEvento">Id do Evento: <%=evento.getId()%></label>
                    </div>
                    
                    <div class="mb-3">
                        <label >Título do Evento:</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="nomeEvento" value="<%=evento.getTitle()%>" required>
                            <div class="invalid-feedback" style="width: 100%;">
                                O nome do evento é requerido.
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label >Descrição do Evento:</label>
                        <div class="input-group">
                            <textarea class="form-control" name="descEvento" value="<%=evento.getDesc()%>"></textarea>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label >Data/hora de Início</label>
                        <div class="input-group">
                            <input type="datetime-local" class="form-control" name="dtInicio" value="<%=evento.getStart()%>">
                            <div class="invalid-feedback" style="width: 100%;">
                                A data/hora de início é requerida.
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label >Data/hora de Fim</label>
                        <div class="input-group">
                            <input type="datetime-local" class="form-control" name="dtFim" value="<%=evento.getEnd()%>">
                            <div class="invalid-feedback" style="width: 100%;">
                                A data/hora de fim é requerida.
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label>Tipo de Evento:</label>
                        <input type="text" class="form-control" nome="tipoEvento" value="<%=evento.getType()%>" readonly>
                    </div>
                    <div class="lh-100">
                        <button class="btn btn-primary btn-md" type="submit" name="enviar" value="Enviar">Incluir</button>
                        <a href="calendario.jsp" role="button" class="btn btn-secondary btn-md">Voltar</a>
                    </div>

                </form>
            </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy; 2020 Espimalomeki</p>
        </footer>
        <main role="main" class="col-10 offset-1">
            <div class="d-flex align-items-center p-3 my-3 bg-light rounded">

            </div>

    </body>
    <script type="text/javascript" src="scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</html>

