<?php
date_default_timezone_set('America/Sao_Paulo');
class Conexao {

	private $servidor;
	private $usuario;
	private $senha;
	private $database;
	private $pdo;

	public function __construct()
    {
        $this->servidor = "localhost";
        $this->usuario = "root";
        $this->senha = "";
        $this->database = "hospeda_mais";

		try
		{
			$this->pdo = new PDO("mysql:host=$this->servidor;dbname=$this->database", $this->usuario, $this->senha);
			$this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}
		catch (PDOException $e)
		{
			echo "Erro banco de dados: " . $e->getMessage() . "<br/>";
			exit;
		}
    }

	public function getConexao() {
        return $this->pdo;
    }

}
?>