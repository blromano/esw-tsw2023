<?php
final class Funcionario {
    private $id_funcionario;
    private $fun_nome;
    private $fun_cpf;
    private $fun_rg;
    private $fun_bairro;
    private $fun_numero;
    private $fun_cidade;
    private $fun_cep;
    private $fun_estado;
    private $fun_sexo;
    private $fun_senha;
    private $fun_email;
    private $fun_celular;
    private $fun_nascimento;
    private $fun_tipo;



    public function getId_funcionario(){
		return $this->id_funcionario;
	}

	public function setId_funcionario($id_funcionario){
		$this->id_funcionario = trim($id_funcionario);
	}
    
    public function getFun_nome(){
        return $this->fun_nome;
    }

    public function setFun_nome($fun_nome){
        $this->fun_nome = ucwords(trim($fun_nome));
    }

    public function getFun_cpf(){
        return $this->fun_cpf;
    }

    public function setFun_cpf($fun_cpf){
        $this->fun_cpf = trim($fun_cpf);
    }

    public function getFun_rg(){
        return $this->fun_rg;
    }

    public function setFun_rg($fun_rg){
        $this->fun_rg = trim($fun_rg);
    }

    public function getFun_bairro(){
        return $this->fun_bairro;
    }

    public function setFun_bairro($fun_bairro){
        $this->fun_bairro = trim($fun_bairro);
    }

    public function getFun_numero(){
        return $this->fun_numero;
    }

    public function setFun_numero($fun_numero){
        $this->fun_numero = trim($fun_numero);
    }

    public function getFun_cidade(){
        return $this->fun_cidade;
    }

    public function setFun_cidade($fun_cidade){
        $this->fun_cidade = trim($fun_cidade);
    }
 
    public function getFun_cep(){
        return $this->fun_cep;
    }

    public function setFun_cep($fun_cep){
        $this->fun_cep = trim($fun_cep);
    }

    public function getFun_estado(){
        return $this->fun_estado;
    }

    public function setFun_estado($fun_estado){
        $this->fun_estado = trim($fun_estado);
    }

    public function getFun_sexo(){
        return $this->fun_sexo;
    }

    public function setFun_sexo($fun_sexo){
        $this->fun_sexo = trim($fun_sexo);
    }

    public function getFun_senha(){
        return $this->fun_senha;
    }

    public function setFun_senha($fun_senha){
        $this->fun_senha = md5($fun_senha);
    }
 
    public function getFun_email(){
        return $this->fun_email;
    }

    public function setFun_email($fun_email){
        $this->fun_email = strtolower(trim($fun_email));
    }

    public function getFun_celular(){
        return $this->fun_celular;
    }

    public function setFun_celular($fun_celular){
        $this->fun_celular = trim($fun_celular);
    }

    public function getFun_nascimento(){
        return $this->fun_nascimento;
    }

    public function setFun_nascimento($fun_nascimento){
        $this->fun_nascimento = trim($fun_nascimento);
    }

    public function getFun_tipo(){
        return $this->fun_tipo;
    }

    public function setFun_tipo($fun_tipo){
        $this->fun_tipo = trim($fun_tipo);
    }
}

interface FuncionarioDAO {
    public function add(Funcionario $f);
    public function findAll();
    public function findById($id);
    public function update(Funcionario $f);
    public function delete($id);
    public function auth($user, $pass);
}


?>