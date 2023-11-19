import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyB5-PXiXsOUmSjEUxN3TvpGBK1hhTljW7o",
  authDomain: "devden-e1ce8.firebaseapp.com",
  projectId: "devden-e1ce8",
  storageBucket: "devden-e1ce8.appspot.com",
  messagingSenderId: "5543722142",
  appId: "1:5543722142:web:82f08d0a7331c3fa5d8f8f",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);

export { app, auth };
