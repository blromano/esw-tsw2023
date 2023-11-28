<?php
require_once 'config/PDO.php';
require_once 'models/Cliente.php';

class ClienteDAOMysql implements ClienteDAO {
    private $pdo;

    public function __construct() {
        $conn = new Conexao();
        $this->pdo = $conn->getConexao();
    }

    public function add(Cliente $c){
        
        $sql = $this->pdo->prepare("INSERT INTO clientes 
            (CLI_BAIRRO, CLI_NUMERO, CLI_CIDADE, CLI_CEP, CLI_ESTADO, CLI_NOME, CLI_CPF, CLI_RG, CLI_NASCIMENTO, CLI_CELULAR, CLI_EMAIL, CLI_SEXO, CLI_SENHA) 
        VALUES(:bairro, :numero, :cidade, :cep, :estado, :nome, :cpf, :rg, :nascimento, :celular, :email, :sexo, :senha);");
        $sql->bindValue(':bairro', $c->getCli_bairro());
        $sql->bindValue(':numero', $c->getCli_numero());
        $sql->bindValue(':cidade', $c->getCli_cidade());
        $sql->bindValue(':cep', $c->getCli_cep());
        $sql->bindValue(':estado', $c->getCli_estado());
        $sql->bindValue(':nome', $c->getCli_nome());
        $sql->bindValue(':cpf', $c->getCli_cpf());
        $sql->bindValue(':rg', $c->getCli_rg());
        $sql->bindValue(':nascimento', $c->getCli_nascimento());
        $sql->bindValue(':celular', $c->getCli_celular());
        $sql->bindValue(':email', $c->getCli_email());
        $sql->bindValue(':sexo', $c->getCli_sexo());
        $sql->bindValue(':senha', $c->getCli_senha());
        
        $sql->execute();
        exit();
        return header("Location: login.php");
    }
    public function findAll(){
        $array = [];
        $sql = $this->pdo->query("SELECT * FROM clientes");
        if ($sql->rowCount() > 0) {
            $data = $sql->fetchAll();

            foreach ($data as $value) {
                $c = new Cliente();
                $c->setId_cliente($value['ID_CLIENTE']);
                $c->setCli_bairro($value['CLI_BAIRRO']);
                $c->setCli_numero($value['CLI_NUMERO']);
                $c->setCli_cidade($value['CLI_CIDADE']);
                $c->setCli_cep($value['CLI_CEP']);
                $c->setCli_estado($value['CLI_ESTADO']);
                $c->setCli_nome($value['CLI_NOME']);
                $c->setCli_cpf($value['CLI_CPF']);
                $c->setCli_rg($value['CLI_RG']);
                $c->setCli_nascimento($value['CLI_NASCIMENTO']);
                $c->setCli_celular($value['CLI_CELULAR']);
                $c->setCli_email($value['CLI_EMAIL']);
                $c->setCli_sexo($value['CLI_SEXO']);
                $c->setCli_senha($value['CLI_SENHA']);

                $array[] = $c;
            }            
        }

        return $array;

    }
    public function findById($id){
        $sql = $this->pdo->query("SELECT * FROM clientes WHERE ID_CLIENTE = $id");
        if ($sql->rowCount() > 0) {
            $data = $sql->fetch();

            $c = new Cliente();
            $c->setId_cliente($data['ID_CLIENTE']);
            $c->setCli_bairro($data['CLI_BAIRRO']);
            $c->setCli_numero($data['CLI_NUMERO']);
            $c->setCli_cidade($data['CLI_CIDADE']);
            $c->setCli_cep($data['CLI_CEP']);
            $c->setCli_estado($data['CLI_ESTADO']);
            $c->setCli_nome($data['CLI_NOME']);
            $c->setCli_cpf($data['CLI_CPF']);
            $c->setCli_rg($data['CLI_RG']);
            $c->setCli_nascimento($data['CLI_NASCIMENTO']);
            $c->setCli_celular($data['CLI_CELULAR']);
            $c->setCli_email($data['CLI_EMAIL']);
            $c->setCli_sexo($data['CLI_SEXO']);
            $c->setCli_senha($data['CLI_SENHA']);
        }

        return $c;

    }
    public function update(Cliente $c){
        $sql = $this->pdo->prepare("UPDATE clientes SET 
        CLI_NOME=:nome, CLI_CPF=:cpf, CLI_RG=:rg, CLI_NASCIMENTO=:nascimento, CLI_CELULAR=:celular, CLI_EMAIL=:email, CLI_SEXO=:sexo WHERE ID_CLIENTE=:id");
        $sql->bindValue(':nome', $c->getCli_nome());
        $sql->bindValue(':cpf', $c->getCli_cpf());
        $sql->bindValue(':rg', $c->getCli_rg());
        $sql->bindValue(':nascimento', $c->getCli_nascimento());
        $sql->bindValue(':celular', $c->getCli_celular());
        $sql->bindValue(':email', $c->getCli_email());
        $sql->bindValue(':sexo', $c->getCli_sexo());
        $sql->bindValue(':id', $c->getId_cliente());
        
        $sql->execute();
    }

    public function delete($id){
        $sql = $this->pdo->query("SELECT * FROM clientes WHERE ID_CLIENTE=$id;");

		if ($sql->rowCount() > 0) {
			$sql = $this->pdo->query("DELETE FROM clientes WHERE ID_CLIENTE=$id;");

			return true;
		}else{
			return false;
		}

    }
    
    public function auth($user, $pass){
        $sql = $this->pdo->prepare("SELECT * FROM clientes WHERE CLI_EMAIL = :email AND CLI_SENHA = :senha");

		$sql->bindValue(':email', $user);
		$sql->bindValue(':senha', $pass);
		$sql->execute();

        if ($sql->rowCount() > 0) {
			$data = $sql->fetch();
            $_SESSION['id'] = $data['ID_CLIENTE'];
            return true;
		}else{
			return false;
		}

    }
}

?>