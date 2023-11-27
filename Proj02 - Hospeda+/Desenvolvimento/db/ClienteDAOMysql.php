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
        $array = [];
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

            $array[] = $c;
        }

        return $array;

    }
    public function update(Cliente $c){

    }
    public function delete($id){

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