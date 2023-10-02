import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Chat from "./pages/Chat.tsx";
import Home from "./pages/Home.tsx";
import Login from "./pages/Login.tsx";
import NewAccount from "./pages/NewAccount.tsx";
import PersonalPage from "./pages/PersonalPage.tsx";
import "./styles/public.css";

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" Component={Home} />
        <Route path="/login" Component={Login} />
        <Route path="/signup" Component={NewAccount} />
        <Route path="/chat" Component={Chat} />
        <Route path="/profile" Component={PersonalPage} />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);
