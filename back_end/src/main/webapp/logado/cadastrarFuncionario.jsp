<%@page import="model.DepartamentoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DepartamentoDao"%>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cadastrar funcionário - Portal Espimalomeki</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">


        <!-- Custom styles for this template -->
        <link href="form-validation.css" rel="stylesheet">
        <link href="offcanvas.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>
        <main role="main" class="container">
            <div class="d-flex align-items-center p-3 my-3 text-white bg-dark rounded shadow-sm">
                <div class="lh-100">
                    <h3> Cadastrar um novo funcionario </h3>
                </div>
            </div>
            <div class="col-md-8 order-md-1">

                <h4 class="mb-3">Dados Pessoais</h4>

                <form class="validation" name="registrarFunc" action="<%=request.getContextPath()%>/CadastraFuncionario" method="post">
                    <div class="mb-3">
                        <label>Nome Completo:</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="nome" placeholder="nome do funcionário" required>
                            <div class="invalid-feedback" style="width: 100%;">
                                O nome é requirido.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label >CPF:</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">#</span>
                            </div>
                            <input type="text" class="form-control" name="cpf" placeholder="CPF" maxlength="14" onkeypress="MascaraCPF(registrarFunc.cpf);" required>
                            <div class="invalid-feedback" style="width: 100%;">
                                CPF é requerido.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>RNE: <span class="text-muted">(Opcional)</span></label>
                        <input type="text" class="form-control" name="rne" placeholder="Registro Estrangeiro">
                    </div>

                    <div class="mb-3">
                        <label >Documento de identidade:</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="nomeCodId" placeholder="Documento de Identidade" required>
                            <div class="invalid-feedback" style="width: 100%;">
                                Documento de Identidade é requerido.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" name="email" placeholder="funcionario@espimalomeki.com">
                        <div class="invalid-feedback">
                            Por favor insira um email válido.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Data de nascimento: </label>
                        <input type="date" class="form-control" name="dataNascimento" placeholder="01/01/2000">
                    </div>

                    <div class="mb-3">
                        <label>Telefone:</label><br>
                        <input type="text" class="form-control" name="telefone" placeholder="(55) 99002-8922" onkeypress="$(this).mask('(00) 00000-0009')">
                        <div class="invalid-feedback">
                            Por favor insira um telefone válido.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Conta bancária:</label><br>
                        <input type="text" class="form-control" name="contaBancaria" placeholder="Ag**** Conta*****">
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
                            <input type="text" name="endereco" class="form-control" placeholder="Rua exemplo 111" required><br>
                            <div class="invalid-feedback" style="width: 100%;">
                                O endereço é requirido.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Complemento:<span class="text-muted"> (opcional)</span> </label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="complemento" placeholder="Apartamento">
                        </div>
                    </div>

                    <hr>     

                    <hr class="mb-4">
                    <h4 class="mb-3">Dados Profissionais</h4>

                    <div class="mb-3">
                        <label>Data de admissão:</label>
                        <input type=date class="form-control" name="dataAdmissao" placeholder="10/01/2010" >
                    </div>

                    <div class="mb-3">
                        <label>Cargo:</label>
                        <select name="cargo" class="form-control" id="cargo">
                            <option value="">-- Selecionar Cargo --</option>
                            <option value="Analista de Marketing Digital Jr.">Analista de Marketing Digital Jr.</option>
                            <option value="Analista de Marketing Digital Pl.">Analista de Marketing Digital Pl.</option>
                            <option value="Analista de Marketing Digital Sr.">Analista de Marketing Digital Sr.</option>
                            <option value="Analista de Negocios Jr.">Analista de Negócios Jr.</option>
                            <option value="Analista de Negocios Pl.">Analista de Negócios Pl.</option>
                            <option value="Analista de Negocios Sr.">Analista de Negócios Sr.</option>
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
                            <option value="">-- Selecionar Departamento --</option>
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
                            <input type="text" class="form-control salario" name="salario" onkeypress="$(this).mask("R$ #.##0,00", {reverse: true});">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Perfil de Permissão:</label>
                        <select name="permissao" class="form-control" id="permissao">
                            <option value="demais">Demais Funcionarios</option>
                            <option value="RH">RH</option>
                            <option value="gestor">Gestores</option>
                        </select>                   
                    </div>

                    <hr class="mb-4">

                    <button class="btn btn-primary btn-lg" type="submit" name="enviar" value="Enviar">Cadastrar Funcionário</button>

                </form>
            </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy;2020 Espimalomeki</p>
        </footer>
    </body>
    <script>

        //adiciona mascara ao CPF
        function MascaraCPF(cpf) {
            if (mascaraInteiro(cpf) == false) {
                event.returnValue = false;
            }
            return formataCampo(cpf, '000.000.000-00', event);
        }

        //valida numero inteiro com mascara
        function mascaraInteiro() {
            if (event.keyCode < 48 || event.keyCode > 57) {
                event.returnValue = false;
                return false;
            }
            return true;
        }

        function formataCampo(campo, Mascara, evento) {
            var boleanoMascara;

            var Digitato = evento.keyCode;
            exp = /\-|\.|\/|\(|\)| /g
            campoSoNumeros = campo.value.toString().replace(exp, "");

            var posicaoCampo = 0;
            var NovoValorCampo = "";
            var TamanhoMascara = campoSoNumeros.length;
            ;

            if (Digitato != 8) { // backspace 
                for (i = 0; i <= TamanhoMascara; i++) {
                    boleanoMascara = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                            || (Mascara.charAt(i) == "/"))
                    boleanoMascara = boleanoMascara || ((Mascara.charAt(i) == "(")
                            || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " "))
                    if (boleanoMascara) {
                        NovoValorCampo += Mascara.charAt(i);
                        TamanhoMascara++;
                    } else {
                        NovoValorCampo += campoSoNumeros.charAt(posicaoCampo);
                        posicaoCampo++;
                    }
                }
                campo.value = NovoValorCampo;
                return true;
            } else {
                return true;
            }
        }

    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
</html>
