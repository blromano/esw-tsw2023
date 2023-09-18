/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#121212",
        secondary: "#232323",
        terciary: "#343434",
        "text-input": "#232323",
      },
    },
  },
  plugins: [],
};
