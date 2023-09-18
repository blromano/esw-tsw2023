import { GoogleLogo } from "@phosphor-icons/react";
import { signInWithEmailAndPassword } from "firebase/auth";
import { FormEvent, useState } from "react";
import { useNavigate } from "react-router-dom";
import { auth } from "../lib/firebase";

export default function Login() {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");

  async function handleLogin(event: FormEvent) {
    event.preventDefault();

    const user = await signInWithEmailAndPassword(auth, email, senha);

    console.log(user);
  }

  return (
    <div className="bg-primary w-screen h-screen text-white flex flex-col items-center justify-center">
      <div className="bg-secondary rounded-lg flex flex-col p-10">
        <h1
          className="text-6xl font-bold"
          style={{ cursor: "pointer" }}
          onClick={() => {
            navigate("/");
          }}
        >
          DevDen
        </h1>

        <h2 className="text-3xl mt-10 font-bold">Login</h2>

        <label htmlFor="email" className="mt-10">
          Email
        </label>
        <input
          type="email"
          name="email"
          id="email"
          className="p-2 bg-terciary rounded-lg"
          value={email}
          onChange={(event) => {
            setEmail(event.target.value);
          }}
        />

        <label htmlFor="senha" className="mt-10">
          Senha
        </label>
        <input
          type="password"
          name="senha"
          id="senha"
          className="p-2 bg-terciary rounded-lg"
          value={senha}
          onChange={(event) => {
            setSenha(event.target.value);
          }}
        />

        <button
          className="mt-10 p-4 bg-terciary rounded-lg font-bold"
          onClick={handleLogin}
        >
          Entrar
        </button>

        <button className="mt-10 p-4 w-64 bg-terciary rounded-3xl flex items-center justify-around">
          <GoogleLogo /> Continuar com o Google
        </button>

        <div className="flex justify-center items-center">
          <p>
            Primeira vez aqui?{" "}
            <span
              className="text-blue-600 mt-4"
              onClick={() => {
                navigate("/signup");
              }}
              style={{ cursor: "pointer" }}
            >
              Cadastre-se
            </span>
          </p>
        </div>
      </div>
    </div>
  );
}
