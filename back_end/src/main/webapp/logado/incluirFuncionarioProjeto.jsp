<%@page import="dao.FuncionarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.FuncionarioModel"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lista de Funcionários - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

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

            /*            tr td{
                            display: -webkit-box;
                            -webkit-line-clamp: 2;
                            -webkit-box-orient: vertical;  
                        }*/

            td{
                max-width: 20ch;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            
            .loader {
                border: 16px solid #f3f3f3; /* Light grey */
                border-top: 16px solid #3498db; /* Blue */
                border-radius: 50%;
                margin-top: 30px;
                width: 20px;
                height: 20px;
                animation: spin 2s linear infinite;
            }
            
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="form-validation.css" rel="stylesheet">
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <script>
        function download(filename, text) {
            var element = document.createElement('a');
            element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
            element.setAttribute('download', filename);

            element.style.display = 'none';
            document.body.appendChild(element);

            element.click();

            document.body.removeChild(element);
        }

    </script>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>

        <main role="main" class="">
            <div class="row">
                <div class="col-6 pl-5">
                    <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
                        <div class="lh-100">
                            <h4 class="mb-0 text-white lh-100">
                                <span>Lista de Funcionários</span>
                                <%
                                    FuncionarioDao listaFunc = new FuncionarioDao();
                                    ArrayList<FuncionarioModel> listaArray = listaFunc.ListaFunc();
                                    int totalfunc = listaFunc.ListaFunc().size();
                                %>
                                <span class="badge badge-secondary badge-pill"><%= totalfunc%></span>
                            </h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 order-md-2 mb-4">
                            <form class="card p-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Pesquisar por nome">
                                    <div class="input-group-append">
                                        <button type="submit" class="btn btn-secondary">Pesquisar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table sm">
                            <thead>
                                <tr>
                                    <th>Matrícula</th>
                                    <th>Nome Completo</th>
                                    <th>Cargo</th>
                                    <th>Incluir Funcionário</th>
                                </tr>
                            </thead>
                            <tbody>
                            <tbody>
                                <%
                                    int numM;
                                    String nome;
                                    String resulString = "";
                                    for (int i = 0; i < totalfunc; i++) {
                                        numM = listaArray.get(i).getNumMatricula();
                                        nome = listaArray.get(i).getNome();
                                        resulString
                                                += "<tr>"
                                                + "<td>" + numM + "</td>"
                                                + "<td id='nome"+numM+"' value='"+nome+"'>" + nome + "</td>"
                                                + "<td>" + listaArray.get(i).getCargo() + "</td>"
                                                + "<td><center><button class='btn btn-primary btn-banco' id='numM' value="+numM+" onclick='incluirFuncionario("+numM+")'>Incluir</button></center></td>"
                                                + "</tr>";
                                    }
                                    out.print(resulString);
                                %>        
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-6">
                    <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-success rounded shadow-sm">
                        <div class="lh-100">
                            <h4 class="mb-0 text-white lh-100">
                                <span>Incluindo Funcionários em Projeto!</span>
                            </h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8 offset-2">
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Escolha o Projeto:</label>
                                <select class="form-control" id="selecionarProj">
                                </select>
                            </div>
                        </div>
                        <div class="col-2">
                            <div id="spinner" class="loader"></div>
                        </div>
                        <br>
                        <hr>
                        <br>
                        <div class="col-10 offset-1">
                            <div class="card" style="width: 100%;">
                                <div class="card-header">
                                    Funcionários Selecionados
                                </div>
                                <ul class="list-group list-group-flush" id="listaFuncProj">
                                </ul>
                                <button class="btn btn-success" onclick="inserirDados()">Salvar e Incluir</button>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
                <p class="mb-1">&copy; 2020 Espimalomeki</p>
            </footer>
            <script>
                let selecionarProj = document.getElementById("selecionarProj");
                let spinner = document.getElementById("spinner");
                
                window.addEventListener("load", () => {
                    var xhrLista = new XMLHttpRequest();
                    xhrLista.open("GET", "../ListaProjetosServlet", true);
                    xhrLista.onload = function (e) {
                        if (xhrLista.readyState === 4) {
                            if (xhrLista.status === 200) {
                                spinner.style.display = "none";
                                selecionarProj.innerHTML = xhrLista.responseText;
                            } 
                        }
                    };
                    xhrLista.send();
                });
                
                
                let listaFinal = {rgm: ""};
                let rgms = []; 
                
                
                selecionarProj.addEventListener("change",()=>{
                    listaFinal["projeto"] = selecionarProj.value;
                    //alert(selecionarProj.value);
                });
                
                                
                function incluirFuncionario(numMatricula){
                    if(rgms.indexOf(numMatricula) == -1){
                        let nome = document.getElementById("nome"+numMatricula).textContent;
                        let listaFuncProj = document.getElementById("listaFuncProj");

                        listaFuncProj.innerHTML += "<li id='li"+numMatricula+"' class='list-group-item'>"+numMatricula+" - "+nome+"</li>";

                        rgms.push(numMatricula);

                        listaFinal.rgm = rgms;
                    }
                    console.log(listaFinal);
                }
                
                function inserirDados(){
                    var xhrIncluir = new XMLHttpRequest();
                        xhrIncluir.open("POST", "../IncluirFuncEmProjetoServlet", true);
                        xhrIncluir.onload = function (e) {
                            if (xhrIncluir.readyState === 4) {
                                if (xhrIncluir.status === 200) {
                                    
                                } 
                            }
                        };

                        xhrIncluir.onerror = function (e) {
                            console.error(xhrIncluir.statusText);
                        };
                        xhrIncluir.send(JSON.stringify(listaFinal));
                }
                
                
            </script>
            <script type="text/javascript" src="scripts.js"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
            <script src="form-validation.js"></script>
</html>
