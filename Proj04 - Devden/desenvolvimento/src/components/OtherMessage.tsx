interface OtherMessageProps {
  texto: string;
  nome: string;
}

export default function OtherMessage({ texto, nome }: OtherMessageProps) {
  return (
    <div className="flex flex-col m-2">
      <span className="text-amber-900 font-bold text-md">{nome}</span>
      <span className="bg-terciary w-fit max-w-lg  px-2 py-1 rounded-lg text-white font-bold text-sm">
        {texto}
      </span>
    </div>
  );
}
