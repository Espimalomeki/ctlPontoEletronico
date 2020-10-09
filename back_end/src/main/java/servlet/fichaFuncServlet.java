package servlet;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.Conexao;
import dao.RegistraProjetoDao;
import dao.FichaFuncDao;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FichaFuncModel;
import model.RegistraProjetoModel;

@WebServlet(name = "PDFiltro", urlPatterns = {"/PDFiltro"})
public class fichaFuncServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private FichaFuncDao fichaDao;

    public void init() {
        fichaDao = new FichaFuncDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FichaFuncModel ficha = new FichaFuncModel();
        response.setContentType("application/pdf");
        Connection con = Conexao.getConexao();
        OutputStream out = response.getOutputStream();
                
        String matricula = request.getParameter("matricula");
        
        
        try {
           
                try {
                Connection conn = Conexao.getConexao();
                String sql = " SELECT funcionario.numMatricula,"
                    + " funcionario.nome,"
                    + " funcionario.cargo,"
                    + " departamento.nomeDepto,"
                    + " usuariosEmProjeto.idProjeto,"
                    + " usuariosEmProjeto.horasProjeto,"
                    + " projetos.descProjeto,"
                    + " alocacaoHoras.qtdHoras"
                    + " FROM funcionario "
                    + " INNER JOIN departamento ON funcionario.idDepto = departamento.idDepto"
                    + " INNER JOIN usuariosEmProjeto ON funcionario.numMatricula = usuariosEmProjeto.numMatricula"
                    + " INNER JOIN alocacaoHoras ON funcionario.numMatricula = alocacaoHoras.numMatricula"
                    + " INNER JOIN projetos ON projetos.idProjeto = usuariosEmProjeto.idProjeto"
                    + " WHERE funcionario.numMatricula= '"+matricula+"'"
                    + " ORDER BY idProjeto";
                
                PreparedStatement selectPs = con.prepareStatement(sql); 
                ResultSet rs = selectPs.executeQuery();
                
                Document docFicha = new Document();
                PdfWriter.getInstance(docFicha, out);

                docFicha.open();

                Paragraph titulo = new Paragraph();
                Font fonte = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLACK);
                titulo.add(new Phrase("RELATORIO FICHA DE FUNCIONARIOS", fonte));
                titulo.setAlignment(Element.ALIGN_CENTER);
                titulo.add(new Phrase(Chunk.NEWLINE));
                titulo.add(new Phrase(Chunk.NEWLINE));
                titulo.add(new Phrase(Chunk.NEWLINE));
                titulo.add(new Phrase(Chunk.NEWLINE));

                docFicha.add(titulo);

                Paragraph subTitulo = new Paragraph();
                Font fonte2 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.BLACK);
                subTitulo.add(new Phrase("Funcionarios:", fonte2));
                subTitulo.setAlignment(Element.ALIGN_JUSTIFIED);
                subTitulo.add(new Phrase(Chunk.NEWLINE));
                subTitulo.add(new Phrase(Chunk.NEWLINE));
                subTitulo.add(new Phrase(Chunk.NEWLINE));

                docFicha.add(subTitulo);

                PdfPTable tabela = new PdfPTable(8);
                
                PdfPCell Part1 = new PdfPCell(new Paragraph("N° Matricula", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell Part2 = new PdfPCell(new Paragraph("Nome", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell Part3 = new PdfPCell(new Paragraph("Cargo", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell Part4 = new PdfPCell(new Paragraph("Departamento", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell Part5 = new PdfPCell(new Paragraph("Id Projeto", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell Part6 = new PdfPCell(new Paragraph("Projeto", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell Part7 = new PdfPCell(new Paragraph("Horas Alocadas", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell Part8 = new PdfPCell(new Paragraph("Horas Totais", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));

                tabela.setWidthPercentage(110);
                
                tabela.addCell(Part1);
                tabela.addCell(Part2);
                tabela.addCell(Part3);
                tabela.addCell(Part4);
                tabela.addCell(Part5);
                tabela.addCell(Part6);
                tabela.addCell(Part7);
                tabela.addCell(Part8);

                while(rs.next()){
                    tabela.addCell(rs.getString("numMatricula"));
                    tabela.addCell(rs.getString("nome"));
                    tabela.addCell(rs.getString("cargo"));
                    tabela.addCell(rs.getString("nomeDepto"));
                    tabela.addCell(rs.getString("idProjeto"));
                    tabela.addCell(rs.getString("descProjeto"));
                    tabela.addCell(rs.getString("qtdHoras"));
                    tabela.addCell(rs.getString("horasProjeto"));
                }
                
                docFicha.add(tabela);

                docFicha.close();

            } catch (Exception ex) {ex.getMessage();}
        }
             catch (Exception ex) {ex.getMessage();}
         finally {
            out.close();
        }
    }
    
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
