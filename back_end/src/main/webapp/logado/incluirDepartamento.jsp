<%@page import="dao.DepartamentoDao"%>
<%@page import="model.DepartamentoModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Incluir Departamento - Portal Espimalomeki</title>



        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    </head>
    <body class="bg-light">
        <header id="navbar">
            <jsp:include page="navbar.jsp"/>
        </header>

        <main role="main" class="container mt-100">

            <div class="col-md-8 order-md-1">

                <h4 class="mb-3">Cadastrar um novo departamento</h4>

                <form class="validation" name="incluirDepto" action="<%=request.getContextPath()%>/IncluirDepartamento" method="post" novalidate>



                    <div class="mb-3">
                        <label >Nome do Departamento:</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="nomeDepto" placeholder="Departamento (ex. Jurídico, Canais Digitais etc)" required>
                            <div class="invalid-feedback" style="width: 100%;">
                                O nome do departamento é requerido.
                            </div>
                        </div>
                    </div>
                    <div class="lh-100">
                        <button class="btn btn-primary btn-md" type="submit" name="enviar" value="Enviar">Incluir</button>
                        <a href="departamentos.jsp" role="button" class="btn btn-secondary btn-md">Voltar</a>
                    </div>
                    
                </form>
            </div>
        </main>
        <footer class="my-5 pt-5 text-muted text-center text-small position-relative">
            <p class="mb-1">&copy; 2020 Espimalomeki</p>
        </footer>
    </body>
    <script type="text/javascript" src="scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js"></script>

    <script src="offcanvas.js"></script>

</html>
