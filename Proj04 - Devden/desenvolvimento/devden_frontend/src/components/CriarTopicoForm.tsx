import { FormEvent, useState } from "react";
import { instance } from "../lib/axios";

export default function CriarTopicoForm() {
  const [title, setTitle] = useState("");
  const [message, setMessage] = useState("");

  // TODO: Fazer ele carregar as tags e fazer elas serem selecionáveis
  function loadTags() {}

  async function handleSubmit(form: FormEvent) {
    form.preventDefault();

    await instance.post("/topico/new", {
      TOP_TITULO: title,
      TOP_MENSAGEM: message,
      FK_USUARIOS_USR_ID: 4,
    });

    window.location.reload();
  }

  return (
    <form
      className="flex flex-col items-center text-white mt-10"
      onSubmit={handleSubmit}
    >
      <label htmlFor="title">Titulo</label>
      <input
        type="text"
        name="title"
        id="title"
        value={title}
        onChange={(data) => {
          setTitle(data.target.value);
        }}
        className="bg-secondary rounded-md p-2 mt-2"
      />

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

      <label htmlFor="message" className="mt-10">
        Mensagem Inicial
      </label>
      <textarea
        name="message"
        id="message"
        className="bg-secondary rounded-md p-2 mt-2 h-32"
        value={message}
        onChange={(data) => {
          setMessage(data.target.value);
        }}
      />

      <button type="submit" className="bg-secondary p-2 rounded-lg mt-10">
        Criar Topico
      </button>
    </form>
  );
}
