<%@page import="java.util.ArrayList"%>
<%@page import="model.PontoEletronicoModel"%>
<%@page import="dao.PontoEletronicoDao"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Ponto Eletrônico - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/offcanvas/">

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
        </style>
        <!-- Custom styles for this template -->
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <header id="navbar"></header>

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
                            <form action="PontoEletronicoServlet" method="POST" name="fomulario"> 
                                <h5 class="card-title">Registrar Ponto</h5>
                                <p class="card-text">Registre suas batidas de ponto diárias aqui.</p>
                                <div class="form-group form-check">
                                    <input type="checkbox" name="homeOffice" value="true" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Est� em Homeoffice?</label>
                                </div>

                                <input type="submit" class="btn btn-primary" value="registraPonto"> 
                                <!--            <button class="btn btn-primary" onclick="inserePonto()"> Registrar batida de ponto</button>-->
                                <!--            <a href="#" class="btn btn-primary">Registrar batida de ponto</a>-->
                            </form>

                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Suas batidas de Hoje</h5>
                            
                            <% 
                                PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
                                ArrayList<PontoEletronicoModel> ponto = ptEletronico.pontoDeHoje();        
                                for(int i=0; i < ptEletronico.pontoDeHoje().size(); i++){
                                    %>
                                    <p class="card-text">Entrada: <%= ponto.get(i).getHoraEntrada()%> </p>
                                    <p class="card-text">Sa��da para Almo�o: <%= ponto.get(i).getHoraInicioIntervalo()%></p>
                                    <p class="card-text">Volta do Almo�o: <%= ponto.get(i).getHoraFimIntervalo()%></p>
                                    <p class="card-text">Sa��da: <%= ponto.get(i).getHoraSaida()%></p>
                            <%         
                                }
                            %>
                            
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
                    <h4 class="mb-0 lh-100">Espelho Ponto Eletr�nico</h4>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>Data</th>
                            <th>Entrada</th>
                            <th>Saida Almo�o</th>
                            <th>Entrada Almo�o</th>
                            <th>Sa��da</th>
                            <th>Homeoffice</th>
                            <th>Motivo de Ajuste</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            //PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
                            ArrayList<PontoEletronicoModel> listaArray = ptEletronico.listaPontos();        
                            for(int i=0; i < ptEletronico.listaPontos().size(); i++){
                                %>
                                <tr>
                                    <td><%= listaArray.get(i).getNumMatricula() %></td>
                                    <td><%= listaArray.get(i).getHoraEntrada() %></td>
                                    <td><%= listaArray.get(i).getHoraInicioIntervalo()%></td>
                                    <td><%= listaArray.get(i).getHoraFimIntervalo()%></td>
                                    <td><%= listaArray.get(i).getHoraSaida()%></td>
                                    <td><%= listaArray.get(i).getHomeOffice()%></td>
                                    <td><%= listaArray.get(i).getMotivoAjuste()%></td>
                                </tr>
                        <%         
                            }
                        %>
                        
<!--                        <tr>
                            <td>27/04/2020</td>
                            <td>09:00</td>
                            <td>12:00</td>
                            <td>13:00</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>-->
                    </tbody>
                </table>


                    <!--
                       <table class="table table-striped table-sm">
                       <thead>
                         <tr>
                           <th>Data</th>
                           <th>Entrada</th>
                           <th>Saida Almoço</th>
                           <th>Entrada Almoço</th>
                           <th>Saída</th>
                           <th>Homeoffice</th>
                           <th>Motivo de Ajuste</th>
                         </tr>
                       </thead>
                       <tbody>
                         <tr>
                           <td>27/04/2020</td>
                           <td>09:00</td>
                           <td>12:00</td>
                           <td>13:00</td>
                           <td>-</td>
                           <td>-</td>
                           <td>-</td>
                         </tr>
                         <tr>
                           <td>26/04/2020</td>
                           <td>09:00</td>
                           <td>12:00</td>
                           <td>13:00</td>
                           <td>18:00</td>
                           <td>-</td>
                           <td>-</td>
                         </tr>
                         <tr>
                           <td>25/04/2020</td>
                           <td>09:00</td>
                           <td>12:00</td>
                           <td>13:00</td>
                           <td>18:00</td>
                           <td>Sim</td>
                           <td>-</td>
                         </tr>
                         <tr>
                           <td>24/04/2020</td>
                           <td>09:00</td>
                           <td>12:00</td>
                           <td>13:00</td>
                           <td>18:00</td>
                           <td>-</td>
                           <td>-</td>
                         </tr>
                         <tr>
                           <td>23/04/2020</td>
                           <td>09:00</td>
                           <td>12:00</td>
                           <td>13:00</td>
                           <td>18:00</td>
                           <td>-</td>
                           <td>-</td>
                         </tr>
                       </tbody>
                     </table>
                    -->
            </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">&copy; 2020 Espimalomeki</p>
        </footer>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
        <script src="offcanvas.js"></script></body>
    <script type="text/javascript" src="scripts.js"></script>
    <script>
        //      function inserePonto(){
        //           $.post("../../servlet/PontoEletronicoServlet.java", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
        //                    $("#somediv").text(responseText);           // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
        //            });
        //      }
    </script>
</html>
