package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logtrack.ExceptionLogTrack;
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
    
//Do Posts ===================================================================================================================
    
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
        
        response.sendRedirect( request.getContextPath() + "/home/app/adm/usuarios.jsp");
        
    } 
    
   
        
//Default ====================================================================================================================   
        
    private void doDefault(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        response.sendRedirect( request.getContextPath() + "/index.html" );
        
    }
    

    
}
