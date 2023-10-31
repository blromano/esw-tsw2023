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
    private String marca;
    private String modelo;
    private String processador;
    private String ram;
    private String os;
    private int ativo;
    
    private Laboratorio laboratorio;
    
    //FK laboratorio;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String Marca) {
        this.marca = Marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String Modelo) {
        this.modelo = Modelo;
    }

    public String getProcessador() {
        return processador;
    }

    public void setProcessador(String Processador) {
        this.processador = Processador;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String Ram) {
        this.ram = Ram;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String OS) {
        this.os = OS;
    }

    public int getAtivo() {
        return ativo;
    }

    public void setAtivo(int Ativo) {
        this.ativo = Ativo;
    }

    public Laboratorio getLaboratorio() {
        return laboratorio;
    }

    public void setLaboratorio(Laboratorio Laboratorio) {
        this.laboratorio = Laboratorio;
    }
}
