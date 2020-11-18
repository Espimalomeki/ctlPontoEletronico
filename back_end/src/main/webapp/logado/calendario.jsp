<%@ page contentType="text/html" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Calendário - Portal Espimalomeki</title>
        <link rel="stylesheet" type="text/css" href="../style/menu.css">
        <link href='../resources/fullcalendar/lib/main.css' rel='stylesheet' />
        <script src='../resources/fullcalendar/lib/main.js'></script>
        <script src='../resources/fullcalendar/lib/locales-all.js'></script>
        <link rel="stylesheet" type="text/css" href="../style/principal.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <!-- Custom styles for this template -->
        <link href="offcanvas.css" rel="stylesheet">
        
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('script-warning').style.display = 'none';
                var calendarEl = document.getElementById('calendar');
                var initialLocaleCode = 'pt-br';
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },
                    locale: initialLocaleCode,
                    editable: false,
                    navLinks: true, // can click day/week names to navigate views
                    dayMaxEvents: true, // allow "more" link when too many events
                    events: {
                        url: '../CalendarJsonServlet',
                        failure: function () {
                            document.getElementById('script-warning').style.display = 'block';
                        }
                    },
                    loading: function (bool) {
                        document.getElementById('loading').style.display =
                                bool ? 'block' : 'none';
                    },
                    eventClick: function (info) {
                        var eventObj = info.event;

                        document.getElementById("modalTitle").textContent = "Evento: " + eventObj.title;
                        document.getElementById("descModal").textContent = eventObj.display;
                        document.getElementById("dtInicioModal").textContent = eventObj.start.toLocaleString();
                        document.getElementById("dtFinalModal").textContent = eventObj.end.toLocaleString();
                        
                        let e = eventObj.startEditable;
                        editableButton(e);

                        document.getElementById("btnEditar").href = "editarEvento.jsp?id=" + eventObj.id;
                        document.getElementById('btnExcluir').onclick = function () {
                            $('#modalEvento').modal('hide');
                            document.getElementById("textModalExclusao").textContent = "Deseja excluir o Evento: " + eventObj.title + "?";
                            document.getElementById("btnConfirmaExclusao").href = "<%=request.getContextPath()%>/ExcluiEvento?id=" + eventObj.id;
                            $('#modalConfirmaExcl').modal('show');
                        }
                        $('#modalEvento').modal('show');
                    }
                });
                calendar.render();

                function editableButton(bool) {
                    document.getElementById('btnEditar').style.display = bool ? 'block' : 'none';
                    document.getElementById('btnExcluir').style.display = bool ? 'block' : 'none';
                }

                function listarTodasAsPropriedades(o) {
                    var objectoASerInspecionado;
                    var resultado = [];

                    for (objectoASerInspecionado = o; objectoASerInspecionado !== null; objectoASerInspecionado = Object.getPrototypeOf(objectoASerInspecionado)) {
                        resultado = resultado.concat(Object.getOwnPropertyNames(objectoASerInspecionado));
                    }
                    return resultado;
                }
                function mostrarProps(obj, nomeDoObj) {
                    var resultado = "";
                    for (var i in obj) {
                        if (obj.hasOwnProperty(i)) {
                            resultado += nomeDoObj + "." + i + " = " + obj[i] + "\n";
                        }
                    }
                    return resultado;
                }
            });
        </script>
        <style>
            #calendar {
                max-width: 1100px;
                margin: 20px auto;
                padding: 0 10px;
            }
            .cabecalho{ margin-top: 20px;}
        </style>
    </head>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>
        <main role="main" class="col-10 offset-1">
            <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                <div class="lh-100 cabecalho">
                    <h4 class="mb-0 lh-100">
                        <svg class="bi bi-calendar-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 2a2 2 0 012-2h12a2 2 0 012 2H0z"/>
                        <path fill-rule="evenodd" d="M0 3h16v11a2 2 0 01-2 2H2a2 2 0 01-2-2V3zm6.5 4a1 1 0 100-2 1 1 0 000 2zm4-1a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm-8 2a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm4-1a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm-8 2a1 1 0 11-2 0 1 1 0 012 0zm2 1a1 1 0 100-2 1 1 0 000 2zm4-1a1 1 0 11-2 0 1 1 0 012 0z" clip-rule="evenodd"/>
                        </svg>
                        Calendário
                    </h4>
                </div>
            </div>
            <div id='script-warning' style="display: none;">
                <code>Calendario</code> com problemas ao buscar informações.
            </div>
            <div class="col-lg-12" style="text-align: right;">
                <a href="incluirEvento.jsp" class="btn btn-outline-success my-2 my-sm-0">Novo Evento</a>
                <div id="loading">
                    <div class="spinner-border text-info" role="status">
                        <span class="sr-only">Carregando...</span>
                    </div>
                </div>
            </div>
            <div id='calendar'></div>

            <!-- Modal -->
            <div class="modal fade" id="modalEvento" tabindex="-1" aria-labelledby="modalInfo" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle"></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h5>Descrição:</h5>
                            <p id="descModal"></p>
                            <h5>Data/hora de Início:</h5>
                            <p id="dtInicioModal"></p>
                            <h5>Data/hora de Encerramento:</h5>
                            <p id="dtFinalModal"></p>
                        </div>
                        <div class="modal-footer">
                            <a role="button" id="btnExcluir" class="btn btn-danger">Deletar</a>
                            <a role="button" id="btnEditar" class="btn btn-primary">Editar</a>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div class="modal fade" id="modalConfirmaExcl" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Exclusão de Evento?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="textModalExclusao"></p> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dispensar</button>
                        <a role="button" id="btnConfirmaExclusao" class="btn btn-danger">Confirmar</a>
                    </div>
                </div>
            </div>
        </div>

        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy; 2020 Espimalomeki</p>
        </footer>
    </body>
    <script type="text/javascript" src="scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</html>
