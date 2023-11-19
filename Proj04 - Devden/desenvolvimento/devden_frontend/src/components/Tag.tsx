interface TagProps {
  text: string;
  color: string;
}

export default function Tag({ text, color }: TagProps) {
  let style: string = `${color} bg-secondary p-2 rounded-xl m-2 h-fit w-fit`;
  return <span className={style}>{text}</span>;
}
