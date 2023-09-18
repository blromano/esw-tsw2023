interface CardTopicoProps {
  titulo: string;
}

export default function CardTopico({ titulo }: CardTopicoProps) {
  return (
    <div className="bg-secondary p-4 rounded-lg max-w-lg">
      <h2 className="text-white font-bold text-xl">{titulo}</h2>
    </div>
  );
}
