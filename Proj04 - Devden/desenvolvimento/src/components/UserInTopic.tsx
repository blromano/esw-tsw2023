interface UserInTopicProps {
  src: string;
  alt?: string;
  nome: string;
  color: string;
}

export default function UserInTopic({
  nome,
  alt,
  src,
  color,
}: UserInTopicProps) {
  return (
    <div className="flex items-center justify-start mt-5">
      <img src={src} alt={alt} className="rounded-lg" width={50} />
      <span className={`${color} ml-5 font-bold`}>{nome}</span>
    </div>
  );
}
