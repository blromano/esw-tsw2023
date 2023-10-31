/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package chamaweb.entidades;

/**
 *
 * @author bv3008762
 */
public class Mensagem {
    private int id;
    private String mensagem;
    
    private Chamado idChamado;
    private Usuario idUsuario;
    //FK chamado id
    //FK usuario id

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public Chamado getIdChamado() {
        return idChamado;
    }

    public void setIdChamado(Chamado idChamado) {
        this.idChamado = idChamado;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }
}
