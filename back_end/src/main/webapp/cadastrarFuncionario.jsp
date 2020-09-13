<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Cadastrar funcionário - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

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

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

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

                <form class="validation" name="registrarFunc" action="<%=request.getContextPath()%>/CadastraFuncionario" method="post" novalidate>
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
                            <input type="text" class="form-control" name="cpf" placeholder="CPF" maxlength="11" required>
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
                        <label>Data de nasicmento : </label>
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
                            <option value="softJr">Engenheiro de software .Jr</option>
                            <option value="softPl">Engenheiro de software .PL</option>
                            <option value="softSr">Engenheiro de software .Sr</option>
                            <option value="gerentJr">Gerente de projetos .Jr</option>
                            <option value="gerentPL">Gerente de projetos .PL</option>
                            <option value="gerentSr">Gerente de projetos .Sr</option>
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
    </script>
</html>
