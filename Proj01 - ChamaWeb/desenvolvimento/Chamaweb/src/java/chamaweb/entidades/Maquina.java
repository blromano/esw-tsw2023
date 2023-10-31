/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package chamaweb.entidades;

/**
 *
 * @author bv3008762
 */
public class Maquina {
    private int id;
    private String Marca;
    private String Modelo;
    private String Processador;
    private String Ram;
    private String OS;
    private int Ativo;
    
    private Laboratorio Laboratorio;
    
    //FK laboratorio;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getProcessador() {
        return Processador;
    }

    public void setProcessador(String Processador) {
        this.Processador = Processador;
    }

    public String getRam() {
        return Ram;
    }

    public void setRam(String Ram) {
        this.Ram = Ram;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public int getAtivo() {
        return Ativo;
    }

    public void setAtivo(int Ativo) {
        this.Ativo = Ativo;
    }

    public Laboratorio getLaboratorio() {
        return Laboratorio;
    }

    public void setLaboratorio(Laboratorio Laboratorio) {
        this.Laboratorio = Laboratorio;
    }
}
