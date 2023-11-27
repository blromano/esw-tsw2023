<?php
require_once 'config/PDO.php';
require_once 'models/Quarto.php';

class QuartoDAOMysql implements QuartoDAO{
    private $pdo;

    public function __construct() {
        $conn = new Conexao();
        $this->pdo = $conn->getConexao();
    }

    public function add(Quarto $q){
        $sql = $this->pdo->prepare("INSERT INTO quartos
        (ID_QUARTO, QRT_CAPACIDADE, QRT_TIPO_CAMA, QRT_DISPONIVEL, QRT_PRECO_DIARIA)
        VALUES(:id_quarto, :capacidade, :tipo_cama, :disponivel, :preco_diaria);");
        $sql->bindValue(':id_quarto', $q->getId_quarto());
        $sql->bindValue(':capacidade', $q->getQrt_capacidade());
        $sql->bindValue(':tipo_cama', $q->getQrt_tipo_cama());
        $sql->bindValue(':disponivel', $q->getQrt_disponivel());
        $sql->bindValue(':preco_diaria', $q->getQrt_preco_diaria());
        
        $sql->execute();
        exit();
    }

    public function findAll(){
        $array = [];
        $sql = $this->pdo->query("SELECT * FROM quartos");
        if ($sql->rowCount() > 0) {
            $data = $sql->fetchAll();

            foreach ($data as $value) {
                $q = new Quarto();
                $q->setId_quarto($value['ID_QUARTO']);
                $q->setQrt_capacidade($value['QRT_CAPACIDADE']);
                $q->setQrt_tipo_cama($value['QRT_TIPO_CAMA']);
                $q->setQrt_disponivel($value['QRT_DISPONIVEL']);
                $q->setQrt_preco_diaria($value['QRT_PRECO_DIARIA']);

                $array[] = $q;
            }            
        }

        return $array;

    }
    public function findById($id){
        $sql = $this->pdo->query("SELECT * FROM quartos WHERE ID_QUARTO=$id;");
        if ($sql->rowCount() > 0) {
            $data = $sql->fetch();

            $q = new Quarto();
            $q->setId_quarto($data['ID_QUARTO']);
            $q->setQrt_capacidade($data['QRT_CAPACIDADE']);
            $q->setQrt_tipo_cama($data['QRT_TIPO_CAMA']);
            $q->setQrt_disponivel($data['QRT_DISPONIVEL']);
            $q->setQrt_preco_diaria($data['QRT_PRECO_DIARIA']);
        }
        
        return $q;

    }
    public function update(Quarto $q){
        $sql = $this->pdo->prepare("UPDATE quartos SET QRT_CAPACIDADE=:capacidade, QRT_TIPO_CAMA=:tipo_cama, QRT_DISPONIVEL=:disponivel, QRT_PRECO_DIARIA=:preco_diaria WHERE ID_QUARTO=:id_quarto;");
        $sql->bindValue(':id_quarto', $q->getId_quarto());
        $sql->bindValue(':capacidade', $q->getQrt_capacidade());
        $sql->bindValue(':tipo_cama', $q->getQrt_tipo_cama());
        $sql->bindValue(':disponivel', $q->getQrt_disponivel());
        $sql->bindValue(':preco_diaria', $q->getQrt_preco_diaria());
        
        $sql->execute();
        exit();
        return header("Location: listarquartos.php");
    }
    
    public function delete($id){
        $sql = $this->pdo->query("SELECT * FROM quartos WHERE ID_QUARTO=$id;");

		if ($sql->rowCount() > 0) {
			$sql = $this->pdo->query("DELETE FROM quartos WHERE ID_QUARTO=$id;");

			return true;
		}else{
			return false;
		}

    }

}


?>