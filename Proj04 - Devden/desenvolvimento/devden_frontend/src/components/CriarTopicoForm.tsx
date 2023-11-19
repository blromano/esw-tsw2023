export default function CriarTopicoForm() {
  return (
    <form className="flex flex-col items-center text-white mt-10">
      <label htmlFor="">Titulo</label>
      <input type="text" className="bg-secondary rounded-md p-2 mt-2" />

      <label htmlFor="" className="mt-10">
        Tags
      </label>
      <div className="flex flex-row">
        <div className="p-2 bg-secondary rounded-lg text-red-600">HTML</div>
        <div className="p-2 bg-secondary rounded-lg text-blue-600 ml-2">
          CSS
        </div>
        <div className="p-2 bg-secondary rounded-lg text-yellow-600 ml-2">
          JS
        </div>
      </div>

      <label htmlFor="" className="mt-10">
        Mensagem Inicial
      </label>
      <textarea className="bg-secondary rounded-md p-2 mt-2 h-32" />

      <button type="submit" className="bg-secondary p-2 rounded-lg mt-10">
        Criar Topico
      </button>
    </form>
  );
}
