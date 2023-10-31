/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package chamaweb.entidades;

import java.util.Date;


/**
 *
 * @author bv3008762 Victor Hugo
 */
public class Chamado {
    private int id;
    private String titulo;
    private Date data;
    private String descricao;
    private int resultadoAvaliacao;
    private String observacoesAvaliacao;
    
    private Usuario idUsuario;
    private Maquina MaquinaId;
    private Usuario idUsuarioTecnico; //Precisava diferenciar de outra forma?
    private Categoria idCategoria;
    private Estado idEstado;

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Maquina getMaquinaId() {
        return MaquinaId;
    }

    public void setMaquinaId(Maquina MaquinaId) {
        this.MaquinaId = MaquinaId;
    }

    public Usuario getIdUsuarioTecnico() {
        return idUsuarioTecnico;
    }

    public void setIdUsuarioTecnico(Usuario idUsuarioTecnico) {
        this.idUsuarioTecnico = idUsuarioTecnico;
    }

    public Categoria getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Categoria idCategoria) {
        this.idCategoria = idCategoria;
    }

    public Estado getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Estado idEstado) {
        this.idEstado = idEstado;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getResultadoAvaliacao() {
        return resultadoAvaliacao;
    }

    public void setResultadoAvaliacao(int resultadoAvaliacao) {
        this.resultadoAvaliacao = resultadoAvaliacao;
    }

    public String getObservacoesAvaliacao() {
        return observacoesAvaliacao;
    }

    public void setObservacoesAvaliacao(String observacoesAvaliacao) {
        this.observacoesAvaliacao = observacoesAvaliacao;
    }


}
