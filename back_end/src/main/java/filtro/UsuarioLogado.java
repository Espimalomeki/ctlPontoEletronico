package filtro;

import model.LoginModel;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "UsuarioLogado", urlPatterns = {"/logado/*"})
public class UsuarioLogado implements Filter {

    private String contextPath;

    public UsuarioLogado() {
    }

    @Override
    public void doFilter(ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletResponse res = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        LoginModel usuario = (LoginModel) session.getAttribute("usuarioLogado");
        if (usuario == null) {
            session.invalidate();
            res.sendRedirect(contextPath + "/index.jsp");
        } else {
            res.setHeader("Cache-control", "no-cache, no-store");
            res.setHeader("Pragma", "no-cache");
            res.setHeader("Expires", "-1");
            chain.doFilter(request, response);
        }
    }
    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.contextPath = filterConfig.getServletContext().getContextPath();
    }

}