<?php
require_once 'config/PDO.php';
require_once 'models/Funcionario.php';

class FuncionarioDAOMysql implements FuncionarioDAO {
    private $pdo;

    public function __construct() {
        $conn = new Conexao();
        $this->pdo = $conn->getConexao();
    }

    public function add(Funcionario $f){

    }
    public function findAll(){

    }
    public function findById($id){
        $array = [];
        $sql = $this->pdo->query("SELECT * FROM funcionarios WHERE ID_FUNCIONARIO = $id");
        if ($sql->rowCount() > 0) {
            $data = $sql->fetch();

            $f = new Funcionario();
            $f->setId_funcionario($data['ID_FUNCIONARIO']);
            $f->setFun_bairro($data['FUN_BAIRRO']);
            $f->setFun_numero($data['FUN_NUMERO']);
            $f->setFun_cidade($data['FUN_CIDADE']);
            $f->setFun_cep($data['FUN_CEP']);
            $f->setFun_estado($data['FUN_ESTADO']);
            $f->setFun_nome($data['FUN_NOME']);
            $f->setFun_cpf($data['FUN_CPF']);
            $f->setFun_rg($data['FUN_RG']);
            $f->setFun_nascimento($data['FUN_NASCIMENTO']);
            $f->setFun_celular($data['FUN_CELULAR']);
            $f->setFun_email($data['FUN_EMAIL']);
            $f->setFun_sexo($data['FUN_SEXO']);
            $f->setFun_senha($data['FUN_SENHA']);
            $f->setFun_tipo($data['FUN_TIPO']);

            $array = $f;
        }

        return $array;

    }
    public function update(Funcionario $f){

    }
    public function delete($id){

    }

    public function auth($user, $pass){
        $sql = $this->pdo->prepare("SELECT * FROM funcionarios WHERE FUN_EMAIL = :email AND FUN_SENHA = :senha");

		$sql->bindValue(':email', $user);
		$sql->bindValue(':senha', $pass);
		$sql->execute();

        if ($sql->rowCount() > 0) {
			$data = $sql->fetch();
            $_SESSION['id_fun'] = $data['ID_FUNCIONARIO'];
            return true;
		}else{
			return false;
		}

    }
}

?>