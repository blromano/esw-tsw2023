import { ArrowLeft, Image, PaperPlaneRight } from "@phosphor-icons/react";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import EdFoto from "../assets/edw.png";
import { instance } from "../lib/axios";
import { auth } from "../lib/firebase";

export default function PersonalPage() {
  const navigate = useNavigate();
  const [message, setMessage] = useState("");

  async function handleClick() {
    const response = await instance.post("/post", {
      POS_MENSAGEM: message,
      POS_URL_FOTO: "",
      FK_USUARIOS_USR_ID: 4,
    });

    if (response.status == 201) {
      setMessage("");
      window.location.reload();
    } else {
      console.error(
        `Status: ${response.status}\nMensagem: ${response.statusText}`
      );
    }
  }
  return (
    <div className="bg-primary w-screen h-screen flex flex-row">
      <button className="text-white h-fit m-2" onClick={() => navigate("/")}>
        <ArrowLeft size={32} />
      </button>
      <img
        src={EdFoto}
        alt="foto de eduardo"
        width={400}
        className="rounded-lg m-10 max-h-64"
      />
      <span className="text-blue-600 font-bold text-5xl mt-24">
        {auth.currentUser?.email}
      </span>
      <div className="flex flex-col w-screen h-screen">
        <textarea
          rows={5}
          className="m-2 mt-20 bg-secondary rounded-lg p-2 text-white w-5/12"
          placeholder="O que você está pensando?"
          value={message}
          onChange={(data) => {
            setMessage(data.target.value);
          }}
        />
        <div className="flex flex-row place-content-between w-5/12">
          <span className="text-white ml-2">
            <Image
              size={32}
              style={{ cursor: "pointer" }}
              onClick={() => {
                console.log("Clicou no botao de imagem!");
              }}
            />
          </span>
          <button className="text-white" onClick={handleClick}>
            <PaperPlaneRight size={32} />
          </button>
        </div>
      </div>
    </div>
  );
}
