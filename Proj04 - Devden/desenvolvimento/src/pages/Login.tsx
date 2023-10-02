import { GoogleLogo } from "@phosphor-icons/react";
import { UserCredential, signInWithEmailAndPassword } from "firebase/auth";
import { FormEvent, createContext, useState } from "react";
import { useNavigate } from "react-router-dom";
import { auth } from "../lib/firebase";

const UserContext = createContext<UserCredential | undefined>(undefined);

export default function Login() {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [user, setUser] = useState<UserCredential>();

  async function handleLogin(event: FormEvent) {
    event.preventDefault();

    try {
      const tryUser = await signInWithEmailAndPassword(auth, email, senha);

      setUser(tryUser);

      console.log(user);

      history.pushState(user, "user");
      navigate("/");
    } catch (error) {}
  }

  return (
    <UserContext.Provider value={user}>
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
            onKeyDown={(key) => {
              if (key.code === "Enter") {
                handleLogin;
              }
            }}
          >
            Entrar
          </button>

          <div className="flex flex-col gap-4 text-center">
            <button className="mt-10 p-4 w-64 bg-terciary rounded-3xl flex items-center justify-around">
              <GoogleLogo /> Continuar com o Google
            </button>

            <div className="flex justify-center items-center">
              <p>
                Primeira vez aqui?
                <br />
                <span
                  className="text-blue-600"
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
      </div>
    </UserContext.Provider>
  );
}
