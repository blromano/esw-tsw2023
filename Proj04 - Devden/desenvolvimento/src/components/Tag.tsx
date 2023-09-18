interface TagProps {
  text: string;
}

export default function Tag({ text }: TagProps) {
  return (
    <span className="text-green-600 bg-secondary p-2 rounded-xl m-2 h-fit w-fit">
      {text}
    </span>
  );
}
