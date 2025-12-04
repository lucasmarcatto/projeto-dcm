package model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Marca extends DataAccessObject {

    private int id;
    private String nome;

    public Marca() {
        super("marcas");
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
    protected Marca copy() {
        Marca mc = new Marca();

        mc.setId(getId());
        mc.setNome(getNome());

        mc.setNovelEntity(false);

        return mc;
    }
}
