<?php
class Cliente {
    private $id_cliente;
    private $cli_bairro;
    private $cli_numero;
    private $cli_cidade;
    private $cli_cep;
    private $cli_estado;
    private $cli_nome;
    private $cli_cpf;
    private $cli_rg;
    private $cli_nascimento;
    private $cli_celular;
    private $cli_email;
    private $cli_sexo;
    private $cli_senha;


    
    public function getId_cliente(){
		return $this->id_cliente;
	}

	public function setId_cliente($id_cliente){
		$this->id_cliente = trim($id_cliente);
	}

	public function getCli_bairro(){
		return $this->cli_bairro;
	}

	public function setCli_bairro($cli_bairro){
		$this->cli_bairro = trim($cli_bairro);
	}

	public function getCli_numero(){
		return $this->cli_numero;
	}

	public function setCli_numero($cli_numero){
		$this->cli_numero = trim($cli_numero);
	}

	public function getCli_cidade(){
		return $this->cli_cidade;
	}

	public function setCli_cidade($cli_cidade){
		$this->cli_cidade = trim($cli_cidade);
	}

	public function getCli_cep(){
		return $this->cli_cep;
	}

	public function setCli_cep($cli_cep){
		$this->cli_cep = trim($cli_cep);
	}

	public function getCli_estado(){
		return $this->cli_estado;
	}

	public function setCli_estado($cli_estado){
		$this->cli_estado = trim($cli_estado);
	}

	public function getCli_nome(){
		return $this->cli_nome;
	}

	public function setCli_nome($cli_nome){
		$this->cli_nome = ucwords(trim($cli_nome));
	}

	public function getCli_cpf(){
		return $this->cli_cpf;
	}

	public function setCli_cpf($cli_cpf){
		$this->cli_cpf = trim($cli_cpf);
	}

	public function getCli_rg(){
		return $this->cli_rg;
	}

	public function setCli_rg($cli_rg){
		$this->cli_rg = trim($cli_rg);
	}

	public function getCli_nascimento(){
		return $this->cli_nascimento;
	}

	public function setCli_nascimento($cli_nascimento){
		$this->cli_nascimento = trim($cli_nascimento);
	}

	public function getCli_celular(){
		return $this->cli_celular;
	}

	public function setCli_celular($cli_celular){
		$this->cli_celular = trim($cli_celular);
	}

	public function getCli_email(){
		return $this->cli_email;
	}

	public function setCli_email($cli_email){
		$this->cli_email = strtolower(trim($cli_email));
	}

	public function getCli_sexo(){
		return $this->cli_sexo;
	}

	public function setCli_sexo($cli_sexo){
		$this->cli_sexo = trim($cli_sexo);
	}

	public function getCli_senha(){
		return $this->cli_senha;
	}

	public function setCli_senha($cli_senha){
		$this->cli_senha = md5($cli_senha);
	}
}

interface ClienteDAO {
    public function add(Cliente $c);
    public function findAll();
    public function findById($id);
    public function update(Cliente $c);
    public function delete($id);
    public function auth($user, $pass);
}

?>