

function navbar(){

	let navbar = document.getElementById('navbar');

	var txt = `
	<link rel="stylesheet" href="style.css">
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
      	<div class="logo mr-5">
	      <a class="navbar-brand mr-auto mr-lg-2" href="#">
	      <img src="espimalomeki.png" class="img-logo" alt="">
	      <p class="txt-logo">Portal Espimalomeki</p>
	      </a>
	      <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
	        <span class="navbar-toggler-icon"></span>
	      </button>
		</div>
      <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.html">Pagina Inicial<span class="sr-only">(current)</span> | </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pontoEletronico.html">Ponto Eletrônico |</a>
          </li>
          <li class="nav-item">
            
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	Banco de Horas |
        	</a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="bancoDeHoras.html">Banco de Horas</a>
	          <a class="dropdown-item" href="bancoDeHorasGestor.html">banco De Horas gestor</a>
	        </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="alocacaoDeHoras.html">Alocação de Horas |</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projetos.html">Projetos |</a>
          </li> 
          <li class="nav-item">
            <a class="nav-link" href="listaFuncionariosDepartamento.html">Funcionários |</a>
          </li>
          <li class="nav-item dropdown">
          	<a class="nav-link" href="eventosCalendario.html">Calendário |</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="perfilProfissional.html">Perfil Profissional |</a>
          </li>
          
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a class="nav-link" href="login.html" aria-haspopup="true" aria-expanded="false">Sair</a>
        </form>
      </div>
    </nav>
	 
  
    `;

	navbar.innerHTML = txt;
}

function excluirEvento(){
	confirm('Tem Certeza que deseja Excluir este Evento?')
}

navbar();