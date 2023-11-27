import { useLocation } from "react-router-dom";
import MyMessage from "../components/MyMessage";
import OtherMessage from "../components/OtherMessage";
import Tag from "../components/Tag";
import UserInTopic from "../components/UserInTopic";

import { PaperPlane } from "@phosphor-icons/react";
import { useState } from "react";
import CupheadFoto from "../assets/cuphead.png";
import DevilManRicardoLima from "../assets/devilman.jpeg";
import EdFoto from "../assets/edw.png";
import AkameFoto from "../assets/kameeeee.png";
import lighFoto from "../assets/lightYagami.jpeg";
import MichaelFoto from "../assets/michael.jpg";
import WesleyFoto from "../assets/wesleyDdaSilva.png";
import { instance } from "../lib/axios";

export default function Chat() {
  const { state } = useLocation();

  const [message, setMessage] = useState("");

  async function handleClick() {
    const response = await instance.post("/message/new", {
      MEN_MENSAGEM: message,
      FK_TOPICO_TOP_ID: 2,
      FK_USUARIOS_USR_ID: 4,
    });

    if (response.status == 201) {
      setMessage("");
      console.log("mensagem enviada com sucesso");
    } else {
      console.error("Ocorreu um erro ao enviar a mensagem...");
    }
  }

  return (
    <div className="bg-primary h-screen w-screen grid grid-rows-3">
      {/* parte de cima do chat */}
      <div className="grid grid-cols-4">
        <div>
          <img
            src={EdFoto}
            alt="Imagem de Edward Elric"
            width={400}
            className="m-10 rounded-lg"
          />
        </div>
        <div className="flex flex-col mt-10">
          <span className="text-blue-600">Eduardo Elrico</span>
          <span className="text-white font-bold text-3xl">{state.titulo}</span>
          <div className="flex flex-row w-max">
            <Tag color="text-green-600" text="Engenharia de Software" />
            <Tag color="text-red-600" text="Gestão" />
            <Tag color="text-yellow-300" text="Desenvolvimento de Software" />
            <Tag color="text-blue-600" text="Documentação" />
            <Tag color="text-white" text="+" />
          </div>
        </div>

        <div className="col-span-2 flex justify-end items-center m-10">
          <input
            type="text"
            placeholder="Buscar Mensagem"
            className="w-64 h-12 bg-secondary rounded-lg p-2 text-white"
          />
        </div>
      </div>

      {/* chat em si, com as conversas e as pessoas do chat*/}
      <div className="grid grid-cols-4 row-span-2">
        <div className="flex flex-col ml-10 bg-secondary m-5 p-5 rounded-lg">
          <h1 className="mb-10 text-white font-bold text-xl self-center">
            Pessoas na conversa
          </h1>

          {/* Aqui vai precisar colocar um scroll infinito pra colocar os usuarios. Talvez tenha que fazer uma <ul> */}
          <UserInTopic
            src={MichaelFoto}
            alt="foto da akame"
            nome="João Jorge"
            color="text-red-700"
          />
          <UserInTopic
            src={lighFoto}
            alt="foto do light"
            nome="Rogérinho Sabe Tudo"
            color="text-yellow-500"
          />

          <UserInTopic
            src={AkameFoto}
            alt="foto da Akame :3"
            nome="Anne Lucy"
            color="text-blue-500"
          />

          <UserInTopic
            src={WesleyFoto}
            alt="foto do Ricardo quando está 5 dias programando em java"
            nome="Roberto Terroso"
            color="text-pink-600"
          />

          <UserInTopic
            src={CupheadFoto}
            alt="foto do cuphead"
            nome="Cauê Henrique"
            color="text-green-500"
          />

          <UserInTopic
            src={DevilManRicardoLima}
            alt="foto do Ricardo quando está 5 dias programando em java"
            nome="Arnaldo de Lima"
            color="text-purple-300"
          />
        </div>
        <div className="col-span-3 bg-secondary m-5 max-h-screen rounded-lg">
          <OtherMessage
            nome="João Jorge"
            texto="Não escute o Rogerinho!!"
            color="text-red-700"
          />

          <OtherMessage
            nome="Anne Lucy"
            texto="What are you talking about? Please speak in gringo."
            color="text-blue-500"
          />

          <OtherMessage
            nome="Rogérinho Sabe Tudo"
            texto="Eu faria dessa forma aqui se eu fosse você, mas como eu 
            não sou eu vou me retirar dessa conversa. Não conceba 
            uma nova tendência."
            color="text-yellow-500"
          />

          <MyMessage
            nome="Eduardo Eorico"
            texto="Não quero fazer dessa forma que você propôs"
          />

          <OtherMessage
            nome="Caue Henrique"
            texto="Mas é a melhor forma."
            color="text-green-500"
          />

          <OtherMessage
            nome="Roberto Terroso"
            texto="Faz dessa forma sim que vai dar certo."
            color="text-pink-600"
          />

          <MyMessage
            nome="Eduardo Eorico"
            texto="Então tá bom, vou fazer dessa forma que vocês falaram"
          />

          <OtherMessage
            nome="Arnaldo de Lima"
            texto="Esse Rogerinho não sabe é nada..."
            color="text-purple-300"
          />

          <div className="flex flex-row">
            <input
              type="text"
              className="w-11/12 ml-16 p-2 rounded-lg bg-terciary text-white"
              placeholder="Conversar no chat"
              value={message}
              onChange={(data) => {
                setMessage(data.target.value);
              }}
            />
            <button onClick={handleClick}>
              <PaperPlane size={32} className="text-white ml-2" />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
