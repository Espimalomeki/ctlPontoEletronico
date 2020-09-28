<%@page import="model.PontoEletronicoModel"%>
<%@page import="model.BancoDeHorasModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BancoDeHorasDao"%>
<%@page import="model.PontoEletronicoModel"%>
<%@page import="dao.PontoEletronicoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% BancoDeHorasDao bancoDeHr = new BancoDeHorasDao(); %>
<% PontoEletronicoDao ptEletronico = new PontoEletronicoDao(); %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Pagina Inicial - Portal Espimalomeki</title>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/offcanvas/">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <!--        <script src="http://code.jquery.com/jquery-latest.js"></script>-->

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
        <meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
        <meta name="theme-color" content="#563d7c">
        <script>
            $(document).ready(function () { 
                let qtdTotalHorasTrabalhadas = document.getElementById("qtdTotalHorasTrabalhadas");
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "BancoDeHorasServlet", true);
                xhr.onload = function (e) {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {                            
                            qtdTotalHorasTrabalhadas.innerHTML = xhr.responseText;
                        } else {
                            qtdTotalHorasTrabalhadas.innerHTML = xhr.responseText;
                        }
                    }
                };
                xhr.onerror = function (e) {
                    console.error(xhr.statusText);
                };
                xhr.send(null);
            });
        </script>

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
                margin-top: 30px;
                width: 100px;
                height: 100px;
                animation: spin 2s linear infinite;
              }
              
              .tabela-eventos{
                min-height: 250px;
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
              
              main{                 
                      margin-bottom: 45px;
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

            <article class="row pt-5 mb-3 mx-0">
                <div class="col-6">
                    <h4 class="mb-0 lh-100">
                        <span class="material-icons icones position-relative float-left">
                            access_time
                        </span>
                        <p class="mb-2 position-relative float-left mt-2 ml-2">Banco de Horas</p>
                    </h4>
                </div>
                <div class="col-3">
                    <input type="date" class="form-control" id="validationDefault01" placeholder="data Inicial">
                </div>
                <div class="col-3">
                    <input type="date" class="form-control" id="validationDefault01" placeholder="data Fim">
                </div>
            </article>
            <article class="tabela-eventos border">
                <table class="table border-bottom mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <!--            <th scope="col" style="width: 20%;">Nome Func.</th>-->
                            <th scope="col" style="width: 20%;">Data inicial</th>
                            <th scope="col" style="width: 20%;">Data Final</th>
                            <th scope="col" style="width: 15%;">Horas Realizadas</th>
                        </tr>
                    </thead>
                    <tbody id="listaPontosEletronicos">
                        
                        
                        
                    </tbody>
                </table>
                <center>
                    <div id="spinner" class="loader"></div>
                </center>
            </article>
            <br>
            <div class="row">
                
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Horas Totais:</h5>
                            <div class="row">
                                <div class="card col-4 offset-1">
                                    <p id="qtdTotalHorasTrabalhadas"> </p>
                                </div>
                                <div class="card col-4 offset-1" style="color:green">
                                    <p id="horasExtras"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Gerar Relatórios</h5>
                            <button id="btnGeraRelatorio" class="btn btn-primary">Gerar Relatório</button>
                        </div>
                    </div>
                </div>
            </div>



        </main>
        <footer class="text-muted text-small footer">
            <p class="mt-1 col-4 offset-4 text-light">&copy; 2020 Espimalomeki</p>
        </footer>
    </body>
    <script type="text/javascript" src="scripts.js"></script>
    <script>
        let listaPontosEletronicos = document.getElementById("listaPontosEletronicos");
        let horasExtras = document.getElementById("horasExtras");
        
        let pontoHoje = document.getElementById("pontoHoje");
        let spinner = document.getElementById("spinner");
            
        window.addEventListener("load",()=>{
                var xhrLista = new XMLHttpRequest();                
                xhrLista.open("GET", "CarregaListaPontosBancoServlet", true);
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
                xhrLista.send(null);
                
                var xhrStatusDeHoras = new XMLHttpRequest();
                xhrStatusDeHoras.open("GET", "HorasExtrasServlet", true);
                xhrStatusDeHoras.onload = function (e) {
                    if (xhrStatusDeHoras.readyState === 4) {
                        if (xhrStatusDeHoras.status === 200) {      
                            horasExtras.innerHTML = xhrStatusDeHoras.responseText;
                        } else {
                            horasExtras.innerHTML = xhrStatusDeHoras.responseText;
                        }
                    }
                };                
                
                xhrStatusDeHoras.onerror = function (e) {
                    console.error(xhrStatusDeHoras.statusText);
                };
                xhrStatusDeHoras.send(null);
                
            });
            
            let btnGeraRelatorio = document.getElementById("btnGeraRelatorio");
            btnGeraRelatorio.addEventListener('click',()=>{
                
                var xhrGeraRelatorio = new XMLHttpRequest();
                xhrGeraRelatorio.open("GET", "CriaRelatorioTxtServlet", true);
                xhrGeraRelatorio.onload = function (e) {
                    if (xhrGeraRelatorio.readyState === 4) {
                        if (xhrGeraRelatorio.status === 200) {      
                            alert(xhrGeraRelatorio.responseText);
                        } else {
                            alert(xhrGeraRelatorio.responseText);
                        }
                    }
                };                
                
                xhrGeraRelatorio.onerror = function (e) {
                    console.error(xhrGeraRelatorio.statusText);
                };
                xhrGeraRelatorio.send(null);
                
            });
    </script>
    
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
    <script src="offcanvas.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>
