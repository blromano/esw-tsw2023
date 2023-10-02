import { Link } from "react-router-dom";

interface CardTopicoProps {
  titulo: string;
}

export default function CardTopico({ titulo }: CardTopicoProps) {
  return (
    <Link
      to="/chat"
      state={{ titulo: titulo }}
      className="bg-secondary p-4 rounded-lg max-w-lg"
    >
      <h2 className="text-white font-bold text-xl">{titulo}</h2>
    </Link>
  );
}
