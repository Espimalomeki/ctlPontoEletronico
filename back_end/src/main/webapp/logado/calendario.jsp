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

                        document.getElementById("modalTitle").textContent = "Evento: " + eventObj.editable + " - " + eventObj.id;
                        document.getElementById("descModal").textContent = eventObj.desc;
                        document.getElementById("dtInicioModal").textContent = eventObj.start;
                        document.getElementById("dtFinalModal").textContent = eventObj.end;

                        let e = eventObj.editable;
                        editableButton(e);

                        document.getElementById("btnEditar").href = "editarEvento.jsp?id=" + eventObj.id;
                        $('#myModal').modal('show');
                    }
                });
                calendar.render();

                function editableButton(bool) {
                    document.getElementById('btnEditar').style.display =
                            bool ? 'block' : 'none';
                }


            });
        </script>
        <style>
            #calendar {
                max-width: 1100px;
                margin: 20px auto;
                padding: 0 10px;
            }
            .cabecalho{ margin-top: 60px;}
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
            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <a role="button" id="btnEditar" class="btn btn-primary">Editar</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy; 2020 Espimalomeki</p>
        </footer>
    </body>
    <script type="text/javascript" src="scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</html>
