<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.FuncionarioModel"%>
<%@page import="dao.FuncionarioDao"%>
<%@page import="model.DepartamentoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DepartamentoDao"%>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Funcion�rio - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

        <link href="offcanvas.css" rel="stylesheet">
        
        <style>
            .mt-100{ margin-top: 6rem!important }
        </style>

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

            <div class="d-flex align-items-center p-3 my-3 text-white bg-dark rounded shadow-sm mt-100">
                <div class="lh-100">
                    <h3>Editar Funcion�rio </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h5>Desligamento de Funcion�rio</h5>  
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between">
                            <button class="btn btn-danger btn-md" id="btnDesligar">Desligar Funcion�rio</button>
                        </li>
                    </ul>
                </div>
                <div class="col-md-8 order-md-1">
                    <h5 class="text-danger"><c:out value="${msgDesl}"/></h5>
                    <h4 class="mb-3">Dados Pessoais</h4>

                    <form class="validation" name="editaFunc" action="<%=request.getContextPath()%>/EditarFuncionario" method="post" novalidate>
                        <div class="mb-3">
                            <label>N�mero de Matr�cula:</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="numMatricula" value="<%=func.getNumMatricula()%>" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Nome Completo:</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="nome" value="<%=func.getNome()%>" required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    O nome � requerido.
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
                                    CPF � requerido.
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
                                Por favor insira um email v�lido.
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
                                Por favor insira um telefone v�lido.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label>Conta banc�ria:</label><br>
                            <input type="text" class="form-control" name="contaBancaria" value="<%=func.getContaBancaria()%>">
                            <div class="invalid-feedback">
                                Por favor insira uma conta banc�ria.
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
                        <h4 class="mb-3">Endere�o do funcion�rio</h4>

                        <div class="mb-3">
                            <label>Endere�o:</label>
                            <div class="input-group">
                                <input type="text" name="endereco" class="form-control" value="<%=func.getEndereco()%>" required><br>
                                <div class="invalid-feedback" style="width: 100%;">
                                    O endere�o � requirido.
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
                            <label>Data de admiss�o:</label>
                            <input type=date class="form-control" name="dataAdmissao" value="<%=func.getDataAdmissao()%>">
                        </div>

                        <div class="mb-3">
                            <label>Cargo:</label>
                            <select name="cargo" class="form-control" id="cargo" value="<%=func.getCargo()%>">
                                <option value="Analista de Marketing Digital Jr.">Analista de Marketing Digital Jr.</option>
                                <option value="Analista de Marketing Digital Pl.">Analista de Marketing Digital Pl.</option>
                                <option value="Analista de Marketing Digital Sr.">Analista de Marketing Digital Sr.</option>
                                <option value="Analista de Negocios Jr.">Analista de Neg�cios Jr.</option>
                                <option value="Analista de Negocios Pl.">Analista de Neg�cios Pl.</option>
                                <option value="Analista de Negocios Sr.">Analista de Neg�cios Sr.</option>
                                <option value="Analista de Recursos Humanos Jr.">Analista de Recursos Humanos Jr.</option>
                                <option value="Analista de Recursos Humanos Pl.">Analista de Recursos Humanos Pl.</option>
                                <option value="Analista de Recursos Humanos Sr.">Analista de Recursos Humanos Sr.</option>
                                <option value="Analista de Software Jr.">Analista de Software Jr.</option>
                                <option value="Analista de Software Pl.">Analista de Software Pl.</option>
                                <option value="Analista de Software Sr.">Analista de Software Sr.</option>
                                <option value="Coordenador Jr.">Coordenador Jr.</option>
                                <option value="Coordenador Pl.">Coordenador Pl.</option>
                                <option value="Coordenador Sr.">Coordenador Sr.</option>
                                <option value="Designer Jr.">Designer Jr.</option>
                                <option value="Designer Pl.">Designer Pl.</option>
                                <option value="Designer Sr.">Designer Sr.</option>
                                <option value="Engenheiro de Software Jr.">Engenheiro de Software Jr.</option>
                                <option value="Engenheiro de Software Pl.">Engenheiro de Software Pl.</option>
                                <option value="Engenheiro de Software Sr.">Engenheiro de Software Sr.</option>
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
                            <label>Carga Hor�ria:</label>
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
                            <label>Perfil de Permiss�o:</label>
                            <select name="permissao" class="form-control" id="permissao">
                                <option value="<%=func.getPermissao()%>"><%=func.getPermissao()%></option>
                                <option value="demais">Demais Funcionarios</option>
                                <option value="RH">RH</option>
                                <option value="gestor">Gestores</option>
                            </select>                   
                        </div>

                        <hr class="mb-4">

                        <button class="btn btn-primary btn-lg" type="submit" name="enviar" value="Enviar">Editar Funcion�rio</button>

                    </form>
                </div>    
            </div>
            <div class="modal fade" id="modalConfirmaDeslig" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Desligamento de Funcion�rio?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p class="text-danger">Aten��o! O desligamento de funcion�rio � irrevers�vel. Para efetivar a a��o � necess�rio a utiliza��o da senha.</p>
                            <p id="textModalDeslig"></p>

                            <p id="resposta"></p>

                            <form class="form-senha" name="form-senha" method="post" action="../DesligarFuncionario">
                                <input type="text" class="form-control" name="numMatriculaFunc" id="numMatriculaFunc" readonly value="<%=func.getNumMatricula()%>"></input>

                                <hr class="mb-2">

                                <label>Para esta a��o, digite sua senha:</label> 
                                <input type="password" id="inputSenha" class="form-control" name="password" placeholder="Senha" required>

                                <div class="modal-footer">
                                    <button class="btn btn-secondary" data-dismiss="modal">Dispensar</button>
                                    <button type="submit" role="button" id="btnConfirmaDeslig" class="btn btn-danger">Confirmar</button>
                                </div>

                            </form>
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

        document.getElementById('btnDesligar').onclick = function () {
            var nome = "<%=func.getNome()%>";
            document.getElementById("numMatriculaFunc").textContent = numMatriculaFunc;
            document.getElementById("textModalDeslig").textContent = "Tem certeza que deseja desligar o funcion�rio: " + nome + "?";
            document.getElementById("btnConfirmaDeslig").href = "<%=request.getContextPath()%>/DesligarFuncionario?id=";
            $('#modalConfirmaDeslig').modal('show');
        }

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