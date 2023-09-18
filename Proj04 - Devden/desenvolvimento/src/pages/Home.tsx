import { X } from "@phosphor-icons/react";
import * as Dialog from "@radix-ui/react-dialog";
import { useNavigate } from "react-router-dom";
import CardTopico from "../components/CardTopico";
import CriarTopicoForm from "../components/CriarTopicoForm";
import FazerTicket from "../components/FazerTicket";
import VerTickets from "../components/VerTickets";

export default function Home() {
  const navigate = useNavigate();

  return (
    <div className="grid grid-cols-3 gap-4 bg-primary w-screen h-fit text-white overflow-hidden">
      {/* Botoes do lado esquerdo */}
      <div>
        {/* Botao do form de Criar topico */}
        <Dialog.Root>
          <Dialog.Trigger
            type="button"
            className="bg-secondary text-white p-2 m-4 font-bold rounded-lg"
          >
            Criar topico
          </Dialog.Trigger>

          <Dialog.Portal>
            <Dialog.Overlay className="w-screen h-screen bg-black/80 fixed inset-0" />
            <Dialog.Content className="absolute p-10 bg-zinc-900 rounded-2xl w-full max-w-xl top-40 left-96 ml-72">
              <Dialog.Close className="absolute right-6 top-6 text-zinc-400 rounded-lg hover:text-zinc-200 focus:outline-none focus:ring-2 focus:ring-violet-700 focus:ring-offset-2 focus:ring-offset-zinc-900">
                <X size={24} aria-label="Fechar" />
              </Dialog.Close>

              <Dialog.Title className="text-white text-center font-bold text-xl">
                Criar Topico
              </Dialog.Title>

              <CriarTopicoForm />
            </Dialog.Content>
          </Dialog.Portal>
        </Dialog.Root>

        {/* Botao do form de Ver tickets */}
        <Dialog.Root>
          <Dialog.Trigger
            type="button"
            className="bg-secondary text-white p-2 m-4 font-bold rounded-lg"
          >
            Ver Tickets
          </Dialog.Trigger>

          <Dialog.Portal>
            <Dialog.Overlay className="w-screen h-screen bg-black/80 fixed inset-0" />
            <Dialog.Content className="absolute p-10 bg-zinc-900 rounded-2xl w-full max-w-xl top-40 left-96 ml-72">
              <Dialog.Close className="absolute right-6 top-6 text-zinc-400 rounded-lg hover:text-zinc-200 focus:outline-none focus:ring-2 focus:ring-violet-700 focus:ring-offset-2 focus:ring-offset-zinc-900">
                <X size={24} aria-label="Fechar" />
              </Dialog.Close>

              <VerTickets />
            </Dialog.Content>
          </Dialog.Portal>
        </Dialog.Root>

        {/* Coluna da parte do meio */}
      </div>
      <div className=" flex flex-col items-center">
        <h1
          className="text-6xl mt-10 text-white font-bold"
          style={{ cursor: "pointer" }}
          onClick={() => {
            navigate("/");
          }}
        >
          DevDen
        </h1>
        <input
          type="text"
          className="p-2 h-10 w-96 bg-text-input text-white rounded-lg m-10 placeholder:text-gray-600"
          placeholder="Ex.: Como fazer casos de uso"
        />
        <div className="flex flex-col justify-evenly h-screen">
          <CardTopico
            titulo="O que é transparência referencial e como ela é 
          implementada em clojure?"
          />

          <CardTopico
            titulo="Como eu posso fazer regressão linear usando a 
          biblioteca Scikit Learn?"
          />

          <CardTopico
            titulo="Como eu poderia aplicar melhor a teoria das cores 
          em meu projeto?"
          />

          <CardTopico titulo="Porque Jorge Aragao eh o cara mais brabo do mundo?" />
        </div>
      </div>
      {/* Botoes do lado direito */}
      <div className="flex flex-row items-start justify-end">
        <Dialog.Root>
          <Dialog.Trigger
            type="button"
            className="bg-secondary text-white p-2 m-4 font-bold rounded-lg"
          >
            Fazer ticket
          </Dialog.Trigger>

          <Dialog.Portal>
            <Dialog.Overlay className="w-screen h-screen bg-black/80 fixed inset-0" />
            <Dialog.Content className="absolute p-10 bg-zinc-900 rounded-2xl w-full max-w-xl top-40 left-96 ml-72">
              <Dialog.Close className="absolute right-6 top-6 text-zinc-400 rounded-lg hover:text-zinc-200 focus:outline-none focus:ring-2 focus:ring-violet-700 focus:ring-offset-2 focus:ring-offset-zinc-900">
                <X size={24} aria-label="Fechar" />
              </Dialog.Close>

              <Dialog.Title className="text-white text-center font-bold text-xl">
                Fazer ticket
              </Dialog.Title>

              <FazerTicket />
            </Dialog.Content>
          </Dialog.Portal>
        </Dialog.Root>
        <button
          className="text-white w-fit m-4 bg-secondary p-2 rounded-lg font-bold"
          onClick={() => navigate("/login")}
        >
          Login / Signup
        </button>
      </div>
    </div>
  );
}
