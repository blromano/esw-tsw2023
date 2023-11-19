export default function FazerTicket() {
  return (
    <form className="flex flex-col items-center text-white mt-10">
      <label htmlFor="">Email / Nome do usuario</label>
      <input type="text" className="bg-secondary rounded-md p-2 mt-2" />

      <label htmlFor="" className="mt-10">
        Motivo da denuncia
      </label>
      <div className="flex flex-col">
        <div>
          <input type="checkbox" /> Spam
        </div>
        <div>
          <input type="checkbox" /> Conteudo improprio / explicito
        </div>
        <div>
          <input type="checkbox" /> Assedio / misoginia
        </div>
        <div>
          <input type="checkbox" /> Xenofobia
        </div>
        <div>
          <input type="checkbox" /> Racismo
        </div>
        <div>
          <input type="checkbox" /> Homofobia / transfobia
        </div>
        <div>
          <input type="checkbox" /> Pedofilia
        </div>
        <div>
          <input type="checkbox" /> Outro
        </div>
      </div>

      <label htmlFor="" className="mt-10">
        Breve descricao do acontecido
      </label>
      <textarea className="bg-secondary rounded-md p-2 mt-2 h-32" />

      <button type="submit" className="bg-secondary p-2 rounded-lg mt-10">
        Enviar
      </button>
    </form>
  );
}
