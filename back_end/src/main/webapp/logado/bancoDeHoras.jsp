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
<% PontoEletronicoDao ptEletronico = new PontoEletronicoDao();%>
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
            function getParameterByName(name, url) {
                if (!url) url = window.location.href;
                name = name.replace(/[\[\]]/g, '\\$&');
                var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                    results = regex.exec(url);
                if (!results) return false;
                //if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, ' '));
            }
            
            const urlParams = new URLSearchParams(window.location.search);
            const myParam = getParameterByName('rgm');
            
            
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
    <body id="body" class="bg-light">


        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
            <link rel="stylesheet" type="text/css" href="../style/bancoDeHoras.css">
        </header>

        <main role="main" class="container">

            <article class="row pt-5 mb-3 mx-0">
                <div class="cont-titulo col-sm-12 col-md-6">
                    <h4 class="mb-0 lh-100 ">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-clock-history" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z"/>
                            <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z"/>
                            <path fill-rule="evenodd" d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z"/>
                        </svg>
                        Banco de Horas
                    </h4>
                </div>
            </article>
            <article class="tabela-eventos border">
                <table class="table border-bottom mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <!--            <th scope="col" style="width: 20%;">Nome Func.</th>-->
                            <th scope="col" style="width: 20%;">Data inicial</th>
                            <th scope="col" style="width: 20%;">Inicio de Intervalo</th>
                            <th scope="col" style="width: 20%;">Fim de Intervalo</th>
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

                <div class="card-parte-1 col-sm-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Horas Totais:</h5>
                            <div class="row">
                                <div class="card card-temp col-4 offset-1">
                                    <p id="qtdTotalHorasTrabalhadas"> </p>
                                </div>
                                <div class="card card-temp col-4 offset-1" style="color:green">
                                    <p id="horasExtras"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-parte-1 col-sm-12 col-md-6">
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
            
//            if(myParam != false){
//                if('${sessionScope.perfil}' != "RH" || '${sessionScope.perfil}' != "gestor"){
//                    setTimeout(function(){ 
//                        window.location.href = "../index.jsp"
//                        
//                    }, 5000);
//                    document.body.innerHTML = "<h1> Ce é folgado hein mano</h1>";
//                    //document.body.innerHTML = "carai"
//                }
//            }
            
            

            window.addEventListener("load", () => {
                if(myParam != false){
                    var xhrLista = new XMLHttpRequest();
                    xhrLista.open("POST", "../CarregaListaPontosBancoServlet", true);
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
                    xhrLista.send(myParam);
                    
                    let qtdTotalHorasTrabalhadas = document.getElementById("qtdTotalHorasTrabalhadas");
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "../BancoDeHorasServlet", true);
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
                    xhr.send(myParam);
                    
                    var xhrStatusDeHoras = new XMLHttpRequest();
                    xhrStatusDeHoras.open("POST", "../HorasExtrasServlet", true);
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
                    xhrStatusDeHoras.send(myParam);
                
                }else{                
                    var xhrLista = new XMLHttpRequest();
                    xhrLista.open("GET", "../CarregaListaPontosBancoServlet", true);
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
                    
                    let qtdTotalHorasTrabalhadas = document.getElementById("qtdTotalHorasTrabalhadas");
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "../BancoDeHorasServlet", true);
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

                    var xhrStatusDeHoras = new XMLHttpRequest();
                    xhrStatusDeHoras.open("GET", "../HorasExtrasServlet", true);
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
                }
            });
            

            let btnGeraRelatorio = document.getElementById("btnGeraRelatorio");

            function download(filename, text) {
                var element = document.createElement('a');
                element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
                element.setAttribute('download', filename);

                element.style.display = 'none';
                document.body.appendChild(element);

                element.click();

                document.body.removeChild(element);
            }
            
            // Start file download.
            //download("hello.txt", "This is the content of my file :)");


            btnGeraRelatorio.addEventListener('click', () => {

                var xhrGeraRelatorio = new XMLHttpRequest();
                
                if(myParam != false){
                    xhrGeraRelatorio.open("POST", "../CriaRelatorioTxtServlet", true);                    
                }else{
                    xhrGeraRelatorio.open("GET", "../CriaRelatorioTxtServlet", true);
                }
                xhrGeraRelatorio.onload = function (e) {
                    if (xhrGeraRelatorio.status === 200) {
                        if(myParam != false){
                            download("relatorio"+myParam+".html",xhrGeraRelatorio.responseText);
                        }else{
                            download("relatorio.html",xhrGeraRelatorio.responseText);
                        }
                    } 
                };

                xhrGeraRelatorio.onerror = function (e) {
                    console.error(xhrGeraRelatorio.statusText);
                };
                if(myParam != false){
                    xhrGeraRelatorio.send(myParam);
                }else{
                    xhrGeraRelatorio.send(null);                    
                }
            });
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
</html>
