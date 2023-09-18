import { Image } from "@phosphor-icons/react";
import EdFoto from "../assets/edw.png";

export default function PersonalPage() {
  return (
    <div className="bg-primary w-screen h-screen flex flex-row">
      <img
        src={EdFoto}
        alt="foto de eduardo"
        width={400}
        className="rounded-lg m-10 max-h-64"
      />
      <span className="text-blue-600 font-bold text-5xl mt-24">
        Eduardo Eurico Lisin
      </span>
      <div className="flex flex-col w-screen h-screen">
        <textarea
          rows={5}
          className="m-2 mt-20 bg-secondary rounded-lg p-2 text-white w-5/12"
          placeholder="O que você está pensando?"
        />
        <span className="text-white ml-2">
          <Image
            size={32}
            style={{ cursor: "pointer" }}
            onClick={() => {
              console.log("Clicou no botao de imagem!");
            }}
          />
        </span>
      </div>
    </div>
  );
}
