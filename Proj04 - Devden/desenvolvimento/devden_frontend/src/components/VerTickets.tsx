export default function VerTickets() {
  return (
    <ul className="flex flex-col mt-10">
      <li>
        <div className="flex flex-row bg-secondary p-4 rounded-lg justify-between">
          <div className="flex flex-col">
            <h1 className="text-red-600 font-bold">Jorge da Silva</h1>
            <span className="font-bold text-white">
              Breve descricao do ocorrido:
            </span>
            <textarea
              className="bg-terciary rounded-lg text-white p-2"
              cols={30}
              rows={5}
              readOnly={true}
              placeholder="Ocorreu isso, isso e aquilo"
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

      <li>
        <div className="flex flex-row bg-secondary p-4 rounded-lg justify-between mt-10">
          <div className="flex flex-col">
            <h1 className="text-yellow-600 font-bold">Roberto Rodrigo</h1>
            <span className="font-bold text-white">
              Breve descricao do ocorrido:
            </span>
            <textarea
              className="bg-terciary rounded-lg text-white p-2"
              cols={30}
              rows={5}
              readOnly={true}
              placeholder="Ocorreu isso, isso e aquilo"
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
    </ul>
  );
}
