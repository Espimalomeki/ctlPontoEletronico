<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login - Portal Espimalomeki</title>
        <link rel="shortcut icon" href="../resources/espimalomeki.png">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media ( min-width : 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <jsp:include page="style/signin.jsp"/>
    </head>
    <body class="text-center">
        <form class="form-signin" action="<%=request.getContextPath()%>/LoginServlet" method="POST">
            <img class="mb-4" src="resources/espimalomeki.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Portal Espimalomeki</h1>
            <label for="inputMatricula" class="sr-only">Número de Matrícula</label> 
            <input type="text" id="inputMatricula" name="matricula" class="form-control"
                   placeholder="Número de Matrícula" required autofocus> 
            <label for="inputSenha" class="sr-only">Senha</label> 
            <input type="password" id="inputSenha" class="form-control" name="password" placeholder="Senha" required>
            <button id="btnLogin" class="btn btn-lg btn-primary btn-block" type="submit">Fazer Login</button>
        </form>
            
            
    </body>
    
</html>
