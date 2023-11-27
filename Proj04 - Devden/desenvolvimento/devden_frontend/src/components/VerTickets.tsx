import { useEffect, useState } from "react";
import { instance } from "../lib/axios";

interface Ticket {
  TIC_ID: number;
  TIC_MENSAGEM: string;
  FK_USUARIOS_USR_ID: number;
}

export default function VerTickets() {
  const [tickets, setTicket] = useState<Ticket[]>();

  useEffect(() => {
    loadTickets();
  }, []);

  async function loadTickets() {
    const response = await instance.get("/tickets");

    setTicket(response.data);
    console.log(response.data);
  }

  return (
    <ul className="flex flex-col mt-10">
      {tickets ? (
        tickets.map((t, i) => {
          return (
            <li key={i} className="m-2">
              <div className="flex flex-row bg-secondary p-4 rounded-lg justify-between">
                <div className="flex flex-col">
                  <h1 className="text-red-600 font-bold">{t.TIC_MENSAGEM}</h1>
                  <span className="font-bold text-white">
                    Breve descricao do ocorrido:
                  </span>
                  <textarea
                    className="bg-terciary rounded-lg text-white p-2"
                    cols={30}
                    rows={5}
                    readOnly={true}
                    value={"Aconteceu isso, isso e aquilo"}
                    contentEditable={false}
                  ></textarea>
                </div>
                <div className="flex flex-col">
                  <button className="text-white bg-terciary p-2 rounded-lg">
                    Spam
                  </button>
                  <button className="text-white bg-terciary p-2 rounded-lg mt-5">
                    Outro
                  </button>
                </div>
              </div>
            </li>
          );
        })
      ) : (
        <span>Não existe nenhum ticket aberto no momento.</span>
      )}
    </ul>
  );
}
