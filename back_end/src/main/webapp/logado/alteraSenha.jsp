<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Alterar Senha - Portal Espimalomeki</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/checkout/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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
                    <h3>Alterar senha</h3>
                </div>
            </div>
            <div class="col-md-8 order-md-1">

                <h4 class="mb-3">Dados:</h4>

                <form class="validation" name="alterarSenha" action="<%=request.getContextPath()%>/AlterarSenha" method="POST" novalidate>
                    
                    <div class="mb-3">
                        <label>numMatricula</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="numMatricula" value="<%=request.getParameter("numMatricula")%>" readonly="true"/>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label >Senha</label>
                        <div class="input-group">
                            <input type="password" class="form-control" name="senha">
                            <div class="invalid-feedback" style="width: 100%;">
                                A senha de funcionario é requerido.
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-primary btn-lg" type="submit" name="alterarSenha" value="alterarSenha">Confirmar</button>
                </form>
            </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy;2020 Espimalomeki</p>
        </footer>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
</html>
