import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Chat from "./pages/Chat.tsx";
import Home from "./pages/Home.tsx";
import Login from "./pages/Login.tsx";
import NewAccount from "./pages/NewAccount.tsx";
import PersonalPage from "./pages/PersonalPage.tsx";
import "./styles/public.css";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home />,
  },
  {
    path: "login",
    element: <Login />,
  },
  {
    path: "signup",
    element: <NewAccount />,
  },
  {
    path: "chat",
    element: <Chat />,
  },
  {
    path: "profile",
    element: <PersonalPage />,
  },
]);

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
