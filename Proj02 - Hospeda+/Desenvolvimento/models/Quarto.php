<?php
class Quarto {
    private $id_quarto;
    private $qrt_capacidade;
    private $qrt_tipo_cama;
    private $qrt_disponivel;
    private $qrt_preco_diaria;



    public function getId_quarto(){
		return $this->id_quarto;
	}

	public function setId_quarto($id_quarto){
		$this->id_quarto = trim($id_quarto);
	}

	public function getQrt_capacidade(){
		return $this->qrt_capacidade;
	}

	public function setQrt_capacidade($qrt_capacidade){
		$this->qrt_capacidade = trim($qrt_capacidade);
	}

	public function getQrt_tipo_cama(){
		return $this->qrt_tipo_cama;
	}

	public function setQrt_tipo_cama($qrt_tipo_cama){
		$this->qrt_tipo_cama = ucwords(trim($qrt_tipo_cama));
	}

	public function getQrt_disponivel(){
		return $this->qrt_disponivel;
	}

	public function setQrt_disponivel($qrt_disponivel){
		$this->qrt_disponivel = $qrt_disponivel;
	}

	public function getQrt_preco_diaria(){
		return $this->qrt_preco_diaria;
	}

	public function setQrt_preco_diaria($qrt_preco_diaria){
		$this->qrt_preco_diaria = trim($qrt_preco_diaria);
	}
}
interface QuartoDAO{
    public function add(Quarto $q);
    public function findAll();
    public function findById($id);
    public function update(Quarto $q);
    public function delete($id);
}

?>