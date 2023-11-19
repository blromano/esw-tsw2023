interface OtherMessageProps {
  texto: string;
  nome: string;
  color: string;
}

export default function OtherMessage({
  texto,
  nome,
  color,
}: OtherMessageProps) {
  return (
    <div className="flex flex-col m-2">
      <span className={`${color} font-bold text-md`}>{nome}</span>
      <span className="bg-terciary w-fit max-w-lg  px-2 py-1 rounded-lg text-white font-bold text-sm">
        {texto}
      </span>
    </div>
  );
}
