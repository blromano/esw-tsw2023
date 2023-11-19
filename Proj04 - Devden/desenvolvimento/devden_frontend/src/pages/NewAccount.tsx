import { createUserWithEmailAndPassword } from "firebase/auth";
import { FormEvent, useState } from "react";
import { useNavigate } from "react-router-dom";
import { auth } from "../lib/firebase";

export default function NewAccount() {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [nomeCompleto, setNomeCompleto] = useState("");
  const [username, setUsername] = useState("");
  const [confirmSenha, setConfirmSenha] = useState("");

  async function handleNewUser(event: FormEvent) {
    event.preventDefault();

    try {
      const user = await createUserWithEmailAndPassword(auth, email, senha);

      // COLOCAR DEPOIS O AVISO VERDE DE QUE DEU CERTO
      // setTimeout(() => {
      //   console.log("entrou aqui");
      //   <AlertSucess />;
      // }, 5000);

      navigate("/");
    } catch (e) {
      console.log("Ocorreu um erro. Erro: " + e);
    }
  }

  return (
    <div className="bg-primary w-screen h-screen text-white flex flex-col items-center justify-center">
      <div className="bg-secondary flex flex-col rounded-lg p-10">
        <h1
          className="text-6xl font-bold"
          style={{ cursor: "pointer" }}
          onClick={() => {
            navigate("/");
          }}
        >
          DevDen
        </h1>

        <h2 className="text-3xl mt-10 font-bold">Criar Conta</h2>

        <form className="flex flex-col" onSubmit={handleNewUser}>
          <label htmlFor="nome" className="mt-5">
            Nome Completo
          </label>
          <input
            type="text"
            name="nome"
            id="nome"
            className="p-2 bg-terciary rounded-lg"
            value={nomeCompleto}
            onChange={(event) => {
              setNomeCompleto(event.target.value);
            }}
          />

          <label htmlFor="username" className="mt-5">
            Nome de usuário
          </label>
          <input
            type="text"
            name="username"
            id="username"
            className="p-2 bg-terciary rounded-lg"
            value={username}
            onChange={(event) => {
              setUsername(event.target.value);
            }}
          />

          <label htmlFor="email" className="mt-5">
            Email
          </label>
          <input
            type="email"
            name="email"
            id="email"
            value={email}
            className="p-2 bg-terciary rounded-lg"
            onChange={(event) => {
              setEmail(event.target.value);
            }}
          />

          <label htmlFor="senha" className="mt-5">
            Senha
          </label>
          <input
            type="password"
            name="senha"
            id="senha"
            value={senha}
            className="p-2 bg-terciary rounded-lg"
            onChange={(event) => {
              setSenha(event.target.value);
            }}
          />

          <label htmlFor="confirmarSenha" className="mt-5">
            Confirmar Senha
          </label>
          <input
            type="password"
            name="confirmarSenha"
            id="confirmarSenha"
            className="p-2 bg-terciary rounded-lg"
            value={confirmSenha}
            onChange={(event) => {
              setConfirmSenha(event.target.value);
            }}
          />

          <button
            className="mt-5 p-4 bg-terciary rounded-lg font-bold"
            type="submit"
          >
            Entrar
          </button>
        </form>
      </div>
    </div>
  );
}
