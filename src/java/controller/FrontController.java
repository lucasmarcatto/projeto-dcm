package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logtrack.ExceptionLogTrack;
import model.TipoUsuario;
import model.Usuario;

public class FrontController extends HttpServlet {  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
        
        String task = request.getParameter("task");
        if( task == null ) {
            task = "";
        }
        
        try {
        
            switch (task) {

                case "usuarios": doGetUsuarios(request, response); break;
                
                case "logout": doGetLogout(request, response); break;
                
                default: doDefault(request, response);

            }
        
        } catch(Exception ex) {
            ExceptionLogTrack.getInstance().addLog(ex);
        }
        
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String task = request.getParameter("task");
        if( task == null ) {
            task = "";
        }
        
        try {
        
            switch (task) {
                
                case "login": doPostLogin(request, response); break;

                case "usuarios": doPostUsuarios(request, response); break;

                default: doDefault(request, response);

            }
        
        } catch(Exception ex) {
            ExceptionLogTrack.getInstance().addLog(ex);
        }
        
    }
    
//Do Gets ====================================================================================================================
    
    private void doGetUsuarios(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String action = request.getParameter("action");
        if( ( action != null ) &&
                action.equals("delete") ) {
            
            int id = Integer.valueOf( request.getParameter("id") );
            
            Usuario us = new Usuario();
            us.setId(id);
            
            us.delete();
            
        }
        
        response.sendRedirect( request.getContextPath() + "/home/app/adm/usuarios.jsp");
        
    }
    
    private void doGetLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
       HttpSession sessao = request.getSession(false);
       if( sessao != null ) {
           sessao.removeAttribute("usuario");
           sessao.removeAttribute("tipo_usuario");
           
           sessao.invalidate();
       }
       
       response.sendRedirect( request.getContextPath() +  "/home/login.jsp" );
        
    }
    
//Do Posts ===================================================================================================================
    
    private void doPostLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {  
        
        int id = Integer.valueOf( request.getParameter("id") );        
        String senha = request.getParameter("senha");
        
        Usuario usuarioTry = new Usuario();
        usuarioTry.setId(id);
        usuarioTry.setSenha(senha);
        
        Usuario usuario = new Usuario();
        usuario.setId(id);        
        boolean status = usuario.load();
        
        if( ( status == true ) &&
              ( usuario.getSenha().equals( usuarioTry.getSenha() ) ) ) {
            
            // true crie um sessão se não houver alguma, false do contrário
            // informações amarmazenadas no servidor
            HttpSession sessao = request.getSession(false);
            if( sessao != null ) {
                sessao.removeAttribute("usuario");
                sessao.removeAttribute("tipo_usuario");
           
                sessao.invalidate();
            }
            
            sessao = request.getSession(true);
            
            sessao.setAttribute( "usuario", "(" + usuario.getNome() + ", " + usuario.getId() + ")" );
            
            TipoUsuario tipoUsuario = new TipoUsuario();
            tipoUsuario.setId( usuario.getTipoUsuarioId() );
            tipoUsuario.load();
            
            sessao.setAttribute( "tipo_usuario", tipoUsuario );
            
            sessao.setMaxInactiveInterval( 60 * 60 ); // em segundos
            
            // criado e armazenado no cliente
            Cookie cookie = new Cookie( "id", String.valueOf(id) );
            cookie.setMaxAge( 60 * 10 ); // em segundos
            response.addCookie(cookie);
            
            // faz com que o cliente acesse o recurso
            response.sendRedirect( request.getContextPath() +  "/home/home.jsp" );
            
        } else {
            
            // faz com que o servidor acesso o recurso
            request.setAttribute("msg", "id e/ou senha incorreto(s)");
            request.getRequestDispatcher( "/home/login.jsp" ).forward(request, response);
            
        }
        
        
    } 
    
    private void doPostUsuarios(HttpServletRequest request, HttpServletResponse response) throws Exception {  
        
        String action = request.getParameter("action");

        int id = Integer.valueOf( request.getParameter("id") );       
        String nome = request.getParameter("nome");       
        String telefone = request.getParameter("telefone"); 
        String senha = request.getParameter("senha");        
        String email = request.getParameter("email");        
        int tipoUsuarioId = Integer.valueOf( request.getParameter("tipo_usuario_id") );       
        
        Usuario us = new Usuario();

        us.setId(id);

        if( action.equals("update") ) us.load();

        us.setNome(nome);
        
        if( telefone == null ) {
            us.setTelefone(null);
        } else {
            us.setTelefone(telefone);
        }
        
        us.setSenha(senha);
        us.setEmail(email);
        us.setTipoUsuarioId(tipoUsuarioId);

        us.save();
        
        response.sendRedirect( request.getContextPath() + "/home/home.jsp");
        
    } 
    
   
        
//Default ====================================================================================================================   
        
    private void doDefault(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        response.sendRedirect( request.getContextPath() + "/index.html" );
        
    }
    

    
}
