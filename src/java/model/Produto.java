package model;

import java.util.ArrayList;
import model.framework.DataAccessObject;

public class Produto extends DataAccessObject {
    private int id;
    private String nome;
    private String cor;
    private String tamanho;
    private float valor;
    private String caminhoImg;
    private int categoriaId;
    private int marcaId;
    
    public Produto(){
        super("produtos");
    }
    
//geters ========================================== 
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getCor() {
        return cor;
    }

    public String getTamanho() {
        return tamanho;
    }

    public float getValor() {
        return valor;
    }
  
    public String getCaminhoImg() {
        return caminhoImg;
    }

    public int getCategoriaId() {
        return categoriaId;
    }

    public int getMarcaId() {
        return marcaId;
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

    public void setCor(String cor) {
        this.cor = cor;
        addChange("cor", this.cor);
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
        addChange("tamanho", this.tamanho);
    }

    public void setValor(float valor) {
        this.valor = valor;
        addChange("valor", this.valor);
    }
   
    
    public void setCaminhoImg(String caminhoImg) {
        this.caminhoImg = caminhoImg;
        addChange("caminho_img", this.caminhoImg);
    }

    public void setCategoriaId(int categoriaId) {
        if( this.categoriaId != categoriaId ){
            this.categoriaId = categoriaId;
            addChange("categoria_id", this.categoriaId);
        }      
    }

    public void setMarcaId(int marcaId) {
        if( this.marcaId != marcaId ){
           this.marcaId = marcaId;
            addChange("marca_id", marcaId);
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
        cor = (String) data.get(2);
        tamanho = (String) data.get(3);
        valor = (float) data.get(4);
        
        if( data.get(5) != null && !data.get(5).equals("") ){
            caminhoImg = (String) data.get(5).toString();
        } else {
            caminhoImg = null;
        }
        
        categoriaId = (int) data.get(6);
        marcaId = (int) data.get(7);

        return this;
    }

    @Override
    protected Produto copy() {
        Produto cp = new Produto();

        cp.setId(getId());
        cp.setNome(getNome());
        cp.setCor(getCor());
        cp.setTamanho(getTamanho());
        cp.setValor(getValor());
        cp.setCaminhoImg(getCaminhoImg());
        cp.setCategoriaId(getCategoriaId());
        cp.setMarcaId(getMarcaId());

        cp.setNovelEntity(false);

        return cp;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Produto) {
            Produto aux = (Produto) obj;
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
