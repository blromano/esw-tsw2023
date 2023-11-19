import { User } from "@phosphor-icons/react";
import * as Popover from "@radix-ui/react-popover";
import { useNavigate } from "react-router-dom";
import { auth } from "../lib/firebase";

export default function UserProfile() {
  const navigate = useNavigate();

  function handleClick() {
    auth.signOut();
  }

  return (
    <div className="mt-6 text-white">
      <Popover.Root>
        <Popover.Trigger asChild className="text-white">
          <button
            className="text-white text-3xl"
            aria-label="Update dimensions"
          >
            <User />
          </button>
        </Popover.Trigger>

        <Popover.Portal>
          <Popover.Content className="text-white bg-secondary rounded-md flex flex-col divide-y divide-solid">
            <button
              className="font-bold p-4"
              onClick={() => {
                navigate("/profile");
              }}
            >
              Profile
            </button>
            <button className="font-bold p-4" onClick={handleClick}>
              Logout
            </button>

            <Popover.Arrow style={{ fill: "white" }} />
          </Popover.Content>
        </Popover.Portal>
      </Popover.Root>
    </div>
  );
}
