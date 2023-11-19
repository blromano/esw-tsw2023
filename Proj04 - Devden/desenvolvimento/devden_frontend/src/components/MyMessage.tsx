interface MyMessageProps {
  nome: string;
  texto: string;
}

export default function MyMessage({ nome, texto }: MyMessageProps) {
  return (
    <div className="flex flex-col m-2 items-end">
      <span className="text-blue-600 font-bold text-md">{nome}</span>
      <span className="bg-terciary w-fit max-w-lg  px-2 py-1 rounded-lg text-white font-bold text-sm">
        {texto}
      </span>
    </div>
  );
}
