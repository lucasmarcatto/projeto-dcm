package model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Usuario extends DataAccessObject {

    private int id;
    private String nome;
    private String telefone;
    private String senha;
    private String email;
    private int tipoUsuarioId;

    public Usuario() {
        super("usuarios");
    }

//geters ==========================================    
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public String getSenha() {
        return senha;
    }

    public String getEmail() {
        return email;
    }

    public int getTipoUsuarioId() {
        return tipoUsuarioId;
    }
    
//seters ========================================== 
    public void setId(int id) {
        this.id = id;
        addChange("id", this.id);
    }

    public void setNome(String nome) {
        this.nome = nome;
        addChange("nome", this.nome);
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
        addChange("telefone", this.telefone);
    }
    
    public void setSenha(String senha) throws Exception {
        if (senha == null) {
            if (this.senha != null) {
                this.senha = senha;
                addChange("senha", this.senha);
            }
        } else {
            if (senha.equals(this.senha) == false) {

                String senhaSal = getId() + senha + getId() / 2;

                MessageDigest md = MessageDigest.getInstance("SHA-256");
                String hash = new BigInteger(1, md.digest(senhaSal.getBytes("UTF-8"))).toString(16);

                this.senha = hash;
                addChange("senha", this.senha);
            }
        }
    }

    public void setEmail(String email) {
        this.email = email;
        addChange("email", this.email);
    }
    
    public void setTipoUsuarioId(int tipoUsuarioId) {
        if (this.tipoUsuarioId != tipoUsuarioId) {
            this.tipoUsuarioId = tipoUsuarioId;
            addChange("tipo_usuario_id", this.tipoUsuarioId);
        }
    }

 //===============================================
    @Override
    protected String getWhereClauseForOneEntity() {
        return " id = " + getId();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        id = (int) data.get(0);
        nome = (String) data.get(1);
        telefone = (String) data.get(2);        
        senha = (String) data.get(3);        
        email = (String) data.get(4);
        tipoUsuarioId = (int) data.get(5);

        return this;
    }

    @Override
    protected Usuario copy() {
        Usuario cp = new Usuario();

        cp.setId(getId());
        cp.setNome(getNome());
        cp.setTelefone(getTelefone());
        cp.senha = getSenha();
        cp.setEmail(getEmail());
        cp.setTipoUsuarioId(getTipoUsuarioId());

        cp.setNovelEntity(false);

        return cp;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Usuario) {
            Usuario aux = (Usuario) obj;
            if (getId() == aux.getId()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

}
