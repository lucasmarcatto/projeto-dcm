package model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Categoria extends DataAccessObject {

    private int id;
    private String nome;

    public Categoria() {
        super("categorias");
    } 
    
//geters ========================================== 
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
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
//================================================     
    @Override
    protected String getWhereClauseForOneEntity() {
        return " id = " + getId();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        id = (int) data.get(0);
        nome = (String) data.get(1);

        return this;
    }

    @Override
    protected Categoria copy() {
        Categoria ct = new Categoria();

        ct.setId(getId());
        ct.setNome(getNome());

        ct.setNovelEntity(false);

        return ct;
    }
}
