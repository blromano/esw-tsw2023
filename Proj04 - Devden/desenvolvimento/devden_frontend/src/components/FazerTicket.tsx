import { FormEvent, useState } from "react";
import { instance } from "../lib/axios";

export default function FazerTicket() {
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");

  async function handleSubmit(form: FormEvent) {
    form.preventDefault();

    const response = await instance.post("tickets/new", {
      TIC_MENSAGEM: message,
      FK_USUARIOS_USR_ID: 4,
    });

    if (response.status == 201) {
      window.location.reload();
    } else {
      console.error("Erro na requisição.");
    }
  }

  return (
    <form
      className="flex flex-col items-center text-white mt-10"
      onSubmit={handleSubmit}
    >
      <label htmlFor="identification">Email</label>
      <input
        type="text"
        name="identification"
        id="identification"
        className="bg-secondary rounded-md p-2 mt-2"
        value={email}
        onChange={(data) => {
          setEmail(data.target.value);
        }}
      />
      {/* TODO: fazer de forma dinâmica essas tipos de denuncia */}
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
      <label htmlFor="message" className="mt-10">
        Breve descricao do acontecido
      </label>
      <textarea
        className="bg-secondary rounded-md p-2 mt-2 h-32"
        id="message"
        name="message"
        value={message}
        onChange={(data) => {
          setMessage(data.target.value);
        }}
      />
      <button type="submit" className="bg-secondary p-2 rounded-lg mt-10">
        Enviar
      </button>
    </form>
  );
}
