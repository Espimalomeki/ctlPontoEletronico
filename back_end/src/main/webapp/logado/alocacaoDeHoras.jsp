<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Pagina Inicial - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/offcanvas/">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
        <meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
        <meta name="theme-color" content="#563d7c">


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
            
            .cont-modal{
                position: absolute;
                top: 0;
                padding-top: 5%;
                width: 100%;
                height: 100vh;
                background: #0000003d;
                z-index: 10;
            }
            
            .loader {
                border: 16px solid #f3f3f3; /* Light grey */
                border-top: 16px solid #3498db; /* Blue */
                border-radius: 50%;
                width: 100px;
                height: 100px;
                animation: spin 2s linear infinite;
              }
              
            @keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
            }
            
        </style>
        <!-- Custom styles for this template -->
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <body id="cont-body" class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
            <link rel="stylesheet" type="text/css" href="../style/alocacaoDeHoras.css">
        </header>
        
        
        <main role="main" class="col-md-12 px-lg-5 px-sm-0">

            <article class="row pt-5 mb-3 mx-0 " style="text-align: center;">
                <div class="col-lg-6 col-sm-12">
                    <h3 class="mb-0 lh-100" style="text-align: center;">
                        <span class="material-icons icones position-relative float-left label-alocacao">
                            access_time
                        </span>
                        <p class="mb-2 position-relative float-left mt-2 ml-2 label-alocacao">Alocação de Horas</p>
                    </h3>
                </div>
                <div class="col-lg-3 col-sm-12 offset-lg-3" >
                    <h4 class="label-alocacao">Horas a Alocar: </h4>
                    <h3 id="horasDisponiveis" style="color:green;"></h3>
                </div>
            </article>

            <article class="tabela-eventos border">
                <table class="table table-striped table-sm mb-0">
                    <thead>
                        <tr>
                            <th style="width:10%;">Cód. Projeto</th>
                            <th style="width:30%;">Nome do Projeto</th>
                            <th style="width:20%;">Suas Horas no Projeto</th>
                            <th style="width:15%;">Status do Projeto</th>
                            <th style="width:15%;">Carga Horaria Total Projeto.</th>                            
                            <th style="width:10%;">Alocar Hora</th>
                        </tr>
                    </thead>
                    <tbody id="lista">
<!--                        <tr>
                            <td>365</td>
                            <td>Sistema de modulos Integrado Sistéc</td>
                            <td>90H</td>
                            <td class="text-warning">Em Andamento</td>                            
                            <td class="">1500H</td>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Inserir Hora</button></td>
                        </tr>-->
                        
                    </tbody>
                </table>
                <center>
                    <div id="spinner" class="loader"></div>
                </center>
            </article>
            <br>

        </main>
        <footer class="mb-2 text-muted text-small ">
            <p class="mb-1 col-4 offset-4">&copy; 2020 Espimalomeki</p>
        </footer>
    </body>



    <script type="text/javascript" src="scripts.js"></script>
    <script>
        let lista = document.getElementById("lista");
        let spinner = document.getElementById("spinner");
        let horasDisponiveis = document.getElementById("horasDisponiveis");
        
        window.addEventListener("load", () => {
            var xhrLista = new XMLHttpRequest();
            
            xhrLista.open("GET", "../ListaAlocacaoHorasServlet", true);
            xhrLista.onload = function (e) {
                if (xhrLista.readyState === 4) {
                    if (xhrLista.status === 200) {
                        spinner.style.display = "none";
                        lista.innerHTML = xhrLista.responseText;
                    } else {
                        //spinner.style.display = "none";
                        lista.innerHTML = xhrLista.responseText;
                    }
                }
            };
            xhrLista.onerror = function (e) {
                console.error(xhrLista.statusText);
            };
            xhrLista.send();
            
            var xhrHrDisponiveis = new XMLHttpRequest();
            xhrHrDisponiveis.open("GET", "../AlocarHorasServlet", true);
            xhrHrDisponiveis.onload = function (e) {
                if (xhrHrDisponiveis.readyState === 4) {
                    if (xhrHrDisponiveis.status === 200) {
                        horasDisponiveis.innerHTML = xhrHrDisponiveis.responseText;
                    }
                }
            };
            xhrHrDisponiveis.onerror = function (e) {
                console.error(xhrHrDisponiveis.statusText);
            };
            xhrHrDisponiveis.send();
            
        });
        
        let body = document.getElementById("cont-body");
        
        function modificarPonto(codProj, nomeProj){ 
            body.innerHTML += ` 
            <!-- Modal -->
            <div id="contModal" class="cont-modal">
                <div class="modal-dialog" style="max-width: 1000px;" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Alocar Horas em Projeto</h5>
                            <button type="button" class="close" onclick="fecharModal()" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body row">
                            <div class="col-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="validationTooltipUsernamePrepend">Cod Prj.</span>
                                    </div>
                                    <input id="codProj" value="`+codProj+`" type="text" class="form-control" id="validationTooltipUsername" placeholder="`+codProj+`" disabled="">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="validationTooltipUsernamePrepend">Descrição.</span>
                                    </div>
                                    <input type="text" class="form-control" id="validationTooltipUsername" placeholder="`+nomeProj+`" disabled="">
                                </div>
                            </div>
                            <br>
                            <div class="col-4 mt-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="validationTooltipUsernamePrepend">Horas de Prj</span>
                                    </div>
                                    <input id="horasAlocadas" type="time" class="form-control"  required="">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="fecharModal()">Fechar</button>
                            <button type="button" class="btn btn-primary" onclick="alocarHoras(this.id)">Salvar</button>
                        </div>
                    </div>
                </div>        
            </div> `;
        
        }
        
        function fecharModal(){
            let contModal = document.getElementById("contModal");
            body.removeChild(contModal);
            //contModal.innerHTML ="";
        }
        
        function alocarHoras(e){
            let btnAlocar = document.getElementById("horasAlocadas");
            let codProj = document.getElementById("codProj");
            
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "../AlocarHorasServlet", true);
            xhr.onload = function (e) {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        //
                        let resp = window.confirm(xhr.responseText);
                        resp ? window.location.href = "alocacaoDeHoras.jsp" : window.location.href = "alocacaoDeHoras.jsp";
                    } 
                }
            };
            xhr.onerror = function (e) {
                console.error(xhr.statusText);
            };
            xhr.send(btnAlocar.value+"&"+codProj.value);
            
        }
        
        
    </script>
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
    <script src="offcanvas.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>
