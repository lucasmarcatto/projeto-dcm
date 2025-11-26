package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

public class TipoUsuario extends DataAccessObject {
    
    private int id;
    private String nome;
    private String moduloAdm;
    private String moduloVendas;
    private String moduloCompras;

    public TipoUsuario() {
        super("tipo_usuario");
    }
//geters ========================================== 
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getModuloAdm() {
        return moduloAdm;
    }

    public String getModuloVendas() {
        return moduloVendas;
    }

    public String getModuloCompras() {
        return moduloCompras;
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

    public void setModuloAdm(String moduloAdm) {
        this.moduloAdm = moduloAdm;
        addChange("modulo_adm", this.moduloAdm);
    }

    public void setModuloVendas(String moduloVendas) {
        this.moduloVendas = moduloVendas;
        addChange("modulo_vendas", this.moduloVendas);
    }

    public void setModuloCompras(String moduloCompras) {
        this.moduloCompras = moduloCompras;
        addChange("modulo_compras", this.moduloCompras);
    }
    
//===============================================
    @Override
    protected String getWhereClauseForOneEntity() {
        return " id = " + getId();
    }

    @Override
    protected DataAccessObject fill(ArrayList<Object> data) {
        // segue a ordem das colunas da tabela no banco de dados
        id = (int) data.get(0);
        nome = (String) data.get(1);
        moduloAdm = (String) data.get(2);
        moduloVendas = (String) data.get(3);
        moduloCompras = (String) data.get(4);
        return this;
    }

    @Override
    protected TipoUsuario copy() {        
        TipoUsuario cp = new TipoUsuario();
        
        cp.setId( getId() );
        cp.setNome( getNome() );
        cp.setModuloAdm( getModuloAdm() );
        cp.setModuloVendas( getModuloVendas() );
        cp.setModuloCompras( getModuloCompras() );
        
        cp.setNovelEntity(false); // assume que o objeto copiado já existe no banco de dados
        
        return cp;
    }
    
    @Override
    public String toString() {
        return "(" + getId() + "," + getNome() + "," + getModuloAdm() + "," + getModuloVendas()+ "," + getModuloCompras()+ ")";
    }
    
    @Override
    public boolean equals(Object obj) {
        if( obj instanceof TipoUsuario ) {
            TipoUsuario aux = (TipoUsuario) obj;
            if( getId() == aux.getId() ) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    
}