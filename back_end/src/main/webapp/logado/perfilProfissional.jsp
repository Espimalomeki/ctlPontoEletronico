<%-- 
    Document   : perfilProfissional
    Created on : 21/09/2020, 20:05:40
    Author     : claud
--%>

<%@page import="dao.SenhaDao"%>
<%@page import="model.AlteraSenhaModel"%>
<%@page import="model.FuncionarioModel"%>
<%@page import="dao.FuncionarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Perfil Profissional - Portal Espimalomeki</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/offcanvas/">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
  <!-- Favicons -->
 


  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }
    .card {
      line-height: 1.25;
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
    <header id="navbar">
        <jsp:include page="navbar.jsp"/>
    </header>

  <main role="main" class="container">
    
    <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
      <div class="lh-100">
        <h4 class="mb-0">
          <svg class="bi bi-people-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 008 15a6.987 6.987 0 005.468-2.63z"/>
            <path fill-rule="evenodd" d="M8 9a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
            <path fill-rule="evenodd" d="M8 1a7 7 0 100 14A7 7 0 008 1zM0 8a8 8 0 1116 0A8 8 0 010 8z" clip-rule="evenodd"/>
          </svg>
        Perfil do Profissional</h4>
      </div>
    </div>
<%  
    SenhaDao senhaDao = new SenhaDao();
    FuncionarioDao funcDao = new FuncionarioDao();
    FuncionarioModel func = funcDao.retornaFuncionario();
    %>
    <div class="row">
      <div class="col-sm-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Dados Pessoais</h5>
            <p class="card-text">Nome Completo: <%=func.getNome()%></p>
            <p class="card-text">CPF: <%=func.getCpf()%></p>
            <p class="card-text">Documento de Identidade: <%=func.getRne()%></p>
            <p class="card-text">Data de Nascimento: <%=func.getDataNasc()%></p>
            <p class="card-text">E-mail: <%=func.getEmail()%></p>
            <br>
            <h6 class="card-title">Endereço</h6>
            <p class="card-text"><%=func.getEndereco()%></p>
            <p class="card-text">Complemento: <%=func.getComplemento()%></p>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Dados Profissionais</h5>
            <p class="card-text">Número de Matrícula: <%=func.getNumMatricula()%></p>
            <p class="card-text">Data de Admissão: <%=func.getDataAdmissao()%></p>
            <p class="card-text">Cargo: <%=func.getCargo()%></p>
            <p class="card-text">Carga Horaria: <%=func.getCargaHoraria()%></p>
            <p class="card-text">Salário: <%=func.getSalario()%></p>
            <p class="card-text">Conta Bancária: <%=func.getContaBancaria()%></p>
          </div>
        </div>
      </div>
          
            
            
      <div class="d-flex align-items-center p-3 my-3 bg-light rounded">
        <div class="lh-100">
            
          <a href="principal.jsp" role="button"  class="btn btn-secondary btn-md">Voltar</a>
            
          <a href="alteraSenha.jsp?numMatricula=<%=func.getNumMatricula()%>" role="button" name="alterarSenha" value="AlterarSenha" class="btn btn-primary btn-md">Alterar Senha</a>
          
          
        </div>
      </div>
     
    </div>  
  </main>
  <footer class="my-4 pt-3 text-muted text-center text-small">
    <p class="mb-1">&copy; 2020 Espimalomeki</p>
  </footer>
</body>
<script type="text/javascript" src="scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<script src="offcanvas.js"></script>
</html>
