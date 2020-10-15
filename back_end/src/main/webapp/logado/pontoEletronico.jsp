<%@page import="java.util.ArrayList"%>
<%@page import="model.PontoEletronicoModel"%>
<%@page import="dao.PontoEletronicoDao"%>
<% PontoEletronicoDao ptEletronico = new PontoEletronicoDao(); %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Ponto Eletrônico - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/offcanvas/">
        
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
            
        <!-- Bootstrap core CSS -->
<!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>-->
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
            .loader {
                border: 16px solid #f3f3f3; /* Light grey */
                border-top: 16px solid #3498db; /* Blue */
                border-radius: 50%;
                width: 100px;
                height: 100px;
                animation: spin 2s linear infinite;
              }
              
              .table{                  
                margin-bottom: 5rem;
              }
              
              .footer{
                position: fixed;
                bottom: 0px;
                width: 100%;
                height: 30px;
                background: #343a40;
                margin: 0;
            }

            p{
                margin-bottom: 0px;
            }

            @keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
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
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>

        <main role="main" class="container">

            <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                <div class="lh-100">
                    <h4 class="mb-0 lh-100">
                        <svg class="bi bi-clock" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 15A7 7 0 108 1a7 7 0 000 14zm8-7A8 8 0 110 8a8 8 0 0116 0z" clip-rule="evenodd"/>
                        <path fill-rule="evenodd" d="M7.5 3a.5.5 0 01.5.5v5.21l3.248 1.856a.5.5 0 01-.496.868l-3.5-2A.5.5 0 017 9V3.5a.5.5 0 01.5-.5z" clip-rule="evenodd"/>
                        </svg>
                        Ponto Eletrônico
                    </h4>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
<!--                            <form action="PontoEletronicoServlet" method="POST" name="fomulario"> -->
                            

                                <h5 class="card-title">Registrar Ponto</h5>
                                <p class="card-text">Registre suas batidas de ponto diárias aqui.</p>
                                <div class="form-group form-check">
                                    <input type="checkbox" name="homeOffice" value="true" class="form-check-input" id="homeOff">
                                    <label class="form-check-label" for="exampleCheck1">Está em Homeoffice?</label>
                                </div>

                                <button id="registraPonto" class="btn btn-primary" value=""> Registrar Ponto </button>
                                <!--            <button class="btn btn-primary" onclick="inserePonto()"> Registrar batida de ponto</button>-->
                                <!--            <a href="#" class="btn btn-primary">Registrar batida de ponto</a>-->
                            

                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Suas batidas de Hoje</h5>
                            <div id="pontoHoje">
                            
                            </div>                           
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total de horas trabalhadas hoje</h5>
                            <h3 class="card-title">Breve</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
                <div class="lh-100">
                    <h4 class="mb-0 lh-100">Espelho Ponto Eletrônico</h4>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr id="trTable">
                            <%--                            <script>
                                let trTable = document.getElementById("trTable");                                
                                if("${sessionScope.perfil}" == "RH"){
                                    trTable.innerHTML += "<th>  Editar  </th>";
                                }                                
                            </script> --%>
<!--                            <th>Rgm</th>-->
                            <th><center>Entrada</center></th>
                            <th>Duração do intervalo</th>                                                      
                            <th><center>Saí­da</center></th>
                            <th>Homeoffice</th>
                            <th>Motivo de Ajuste</th>
                        </tr>
                    </thead>
                    <tbody id="listaPontosEletronicos">
                        
                        
                    </tbody>
                </table>
                <center>
                    <div id="spinner" class="loader"></div>
                </center>
            </div>
        </main>
        <footer class="text-muted text-small footer">
            <p class="mt-1 col-4 offset-4 text-light">&copy; 2020 Espimalomeki</p>
        </footer>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
        <script src="offcanvas.js"></script></body>
    <script type="text/javascript" src="scripts.js"></script>
    <script>
            let registraPonto = document.getElementById("registraPonto");
            
            registraPonto.addEventListener("click",()=>{
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "../PontoEletronicoServlet", true);
                
                xhr.onload = function (e) {
                    //e.preventDefault();
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {                            
                            alert(xhr.responseText);
                            document.location.reload();
                        } else {                            
                            alert(xhr.responseText);
                        }
                    }
                };
                let homeOff = document.getElementById("homeOff").checked;
                if(homeOff){
                    xhr.send("true");
                }else{
                    xhr.send("false");                     
                }
                
            });
            
            let listaPontosEletronicos = document.getElementById("listaPontosEletronicos");
            let pontoHoje = document.getElementById("pontoHoje");
            let spinner = document.getElementById("spinner");
            
            window.addEventListener("load",()=>{
                var xhrLista = new XMLHttpRequest();
                var xhrPontoHoje = new XMLHttpRequest();
                xhrLista.open("GET", "../CarregaListaPontosEletronicosServlet", true);
                xhrLista.onload = function (e) {
                    if (xhrLista.readyState === 4) {
                        if (xhrLista.status === 200) {      
                            spinner.style.display = "none";
                            listaPontosEletronicos.innerHTML = xhrLista.responseText;
                        } else {
                            spinner.style.display = "none";
                            listaPontosEletronicos.innerHTML = xhrLista.responseText;
                        }
                    }
                };
                xhrLista.onerror = function (e) {
                    console.error(xhrLista.statusText);
                };
                xhrLista.send(null);
                /////////////////
                xhrPontoHoje.open("GET", "../PontoDeHojeServlet", true);
                xhrPontoHoje.onload = function (e) {
                    if (xhrPontoHoje.readyState === 4) {
                        if (xhrPontoHoje.status === 200) {      
                            pontoHoje.innerHTML = xhrPontoHoje.responseText;
                        } else {
                            pontoHoje.innerHTML = xhrPontoHoje.responseText;
                        }
                    }
                };
                xhrPontoHoje.onerror = function (e) {
                    console.error(xhr.statusText);
                };
                xhrPontoHoje.send(null);
                
            });
            
            
            
    </script>
</html>
