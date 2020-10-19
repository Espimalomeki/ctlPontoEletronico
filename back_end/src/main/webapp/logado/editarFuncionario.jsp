<%@page import="model.FuncionarioModel"%>
<%@page import="dao.FuncionarioDao"%>
<%@page import="model.DepartamentoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DepartamentoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Funcionário - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
        <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
        <meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
        <meta name="theme-color" content="#563d7c">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    </head>
    <body class="bg-light">

        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>
        <main role="main" class="container">

            <%
                FuncionarioDao funcDao = new FuncionarioDao();
                int numM = Integer.parseInt(request.getParameter("numMatricula"));
                FuncionarioModel func = funcDao.retornaFuncionario(numM);
            %>

            <div class="d-flex align-items-center p-3 my-3 text-white bg-dark rounded shadow-sm">
                <div class="lh-100">
                    <h3> Editar Funcionário </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h5 class="text-danger">Desligamento de Funcionário</h5>  
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between">

                        </li>
                    </ul>

                    <form class="card p-2">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Promo code">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary">Redeem</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-8 order-md-1">

                    <h4 class="mb-3">Dados Pessoais</h4>

                    <form class="validation" name="editaFunc" action="<%=request.getContextPath()%>/EditarFuncionario" method="post" novalidate>
                        <div class="mb-3">
                            <label>Número de Matrícula:</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="numMatricula" value="<%=func.getNumMatricula()%>" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Nome Completo:</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="nome" value="<%=func.getNome()%>" required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    O nome é requerido.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label >CPF:</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">#</span>
                                </div>
                                <input type="text" class="form-control" name="cpf" value="<%=func.getCpf()%>" maxlength="11" readonly>
                                <div class="invalid-feedback" style="width: 100%;">
                                    CPF é requerido.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>RNE: <span class="text-muted">(Opcional)</span></label>
                            <input type="text" class="form-control" name="rne" value="<%=func.getRne()%>">
                        </div>

                        <div class="mb-3">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" name="email" value="<%=func.getEmail()%>">
                            <div class="invalid-feedback">
                                Por favor insira um email válido.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Data de nascimento : </label>
                            <input type="date" class="form-control" name="dataNascimento" value="<%=func.getDataNasc()%>">
                        </div>

                        <div class="mb-3">
                            <label>Telefone:</label><br>
                            <input type="text" class="form-control" name="telefone" value="<%=func.getTelefone()%>" onkeypress="$(this).mask('(00) 00000-0009')">
                            <div class="invalid-feedback">
                                Por favor insira um telefone válido.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Conta bancária:</label><br>
                            <input type="text" class="form-control" name="contaBancaria" value="<%=func.getContaBancaria()%>">
                            <div class="invalid-feedback">
                                Por favor insira uma conta bancária.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Sexo:</label>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="genero" value="M">
                                <label class="form-check-label">Masculino</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="genero" value="F">
                                <label class="form-check-label">Feminino</label>
                            </div>
                        </div>

                        <hr class="mb-4">
                        <h4 class="mb-3">Endereço do funcionário</h4>

                        <div class="mb-3">
                            <label>Endereço:</label>
                            <div class="input-group">
                                <input type="text" name="endereco" class="form-control" value="<%=func.getEndereco()%>" required><br>
                                <div class="invalid-feedback" style="width: 100%;">
                                    O endereço é requirido.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Complemento:<span class="text-muted"> (opcional)</span> </label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="complemento" value="<%=func.getComplemento()%>">
                            </div>
                        </div>

                        <hr>     

                        <hr class="mb-4">
                        <h4 class="mb-3">Dados Profissionais</h4>

                        <div class="mb-3">
                            <label>Data de admissão:</label>
                            <input type=date class="form-control" name="dataAdmissao" value="<%=func.getDataAdmissao()%>">
                        </div>

                        <div class="mb-3">
                            <label>Cargo:</label>
                            <select name="cargo" class="form-control" id="cargo" value="<%=func.getCargo()%>">
                                <option value="Engenheiro de Software Jr.">Engenheiro de Software Jr.</option>
                                <option value="Engenheiro de Software Pl.">Engenheiro de Software Pl.</option>
                                <option value="Engenheiro de Software Sr.">Engenheiro de Software Sr.</option>
                                <option value="Analista de Software Jr.">Analista de Software Jr.</option>
                                <option value="Analista de Software Pl.">Analista de Software Pl.</option>
                                <option value="Analista de Software Sr.">Analista de Software Sr.</option>
                                <option value="Analista de Recursos Humanos Jr.">Analista de Recursos Humanos Jr.</option>
                                <option value="Analista de Recursos Humanos Pl.">Analista de Recursos Humanos Pl.</option>
                                <option value="Analista de Recursos Humanos Sr.">Analista de Recursos Humanos Sr.</option>
                                <option value="Gerente de Projetos Jr.">Gerente de projetos Jr.</option>
                                <option value="Gerente de Projetos Pl.">Gerente de projetos Pl.</option>
                                <option value="Gerente de Projetos Sr.">Gerente de projetos Sr.</option>
                            </select>                    
                        </div>

                        <div class="mb-3">
                            <label>Departamento:</label>
                            <select name="departamento" class="form-control" id="departamento">
                                <option value="<%=func.getCodDepto()%>"><%=func.getCodDepto()%></option>
                                <%
                                    DepartamentoDao deptos = new DepartamentoDao();
                                    ArrayList<DepartamentoModel> listaArray = deptos.listaDeptos();
                                    int sizeLista = deptos.listaDeptos().size();
                                    for (int i = 0; i < sizeLista; i++) {
                                %>                           
                                <option value="<%=listaArray.get(i).getCodDepto()%>"><%=listaArray.get(i).getCodDepto()%> - <%=listaArray.get(i).getNomeDepto()%></option>
                                <% }%>
                            </select>                    
                        </div>

                        <div class="mb-3">
                            <label>Carga Horária:</label>
                            <select name="cargaHoraria" class="form-control" id="cargaHoraria">
                                <option value="<%=func.getCargaHoraria()%>"><%=func.getCargaHoraria()%> horas mensais</option>
                                <option value="180">180 horas mensais</option>
                                <option value="220">220 horas mensais</option>
                            </select>                    
                        </div>

                        <div class="mb-3">
                            <label>Salario:</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <input type="text" class="form-control salario" name="salario" value="<%=func.getSalario()%>">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Perfil de Permissão:</label>
                            <select name="permissao" class="form-control" id="permissao">
                                <option value="<%=func.getPermissao()%>"><%=func.getPermissao()%></option>
                                <option value="demais">Demais Funcionarios</option>
                                <option value="RH">RH</option>
                                <option value="gestor">Gestores</option>
                            </select>                   
                        </div>

                        <hr class="mb-4">

                        <button class="btn btn-primary btn-lg" type="submit" name="enviar" value="Enviar">Editar Funcionário</button>

                    </form>
                </div>    
            </div>
            <div class="modal fade" id="modalConfirmaExcl" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Desligamento de Funcionário?</h5>
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
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy;2020 Espimalomeki</p>
        </footer>
    </body>
    <script>
        function mascara(i, t) {
            var v = i.value;
            if (isNaN(v[v.length - 1])) {
                i.value = v.substring(0, v.length - 1);
                return;
            }
            if (t == "data") {
                i.setAttribute("maxlength", "10");
                if (v.length == 2 || v.length == 5)
                    i.value += "/";
            }
            if (t == "cpf") {
                i.setAttribute("maxlength", "14");
                if (v.length == 3 || v.length == 7)
                    i.value += ".";
                if (v.length == 11)
                    i.value += "-";
            }
            if (t == "cnpj") {
                i.setAttribute("maxlength", "18");
                if (v.length == 2 || v.length == 6)
                    i.value += ".";
                if (v.length == 10)
                    i.value += "/";
                if (v.length == 15)
                    i.value += "-";
            }
            if (t == "cep") {
                i.setAttribute("maxlength", "9");
                if (v.length == 5)
                    i.value += "-";
            }
            if (t == "tel") {
                if (v[0] == 9) {
                    i.setAttribute("maxlength", "10");
                    if (v.length == 5)
                        i.value += "-";
                } else {
                    i.setAttribute("maxlength", "9");
                    if (v.length == 4)
                        i.value += "-";
                }
            }
        }

        var vGenero = '<%=func.getGenero()%>';
        $("input[name=genero][value=" + vGenero + "]").prop('checked', true);
    </script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>