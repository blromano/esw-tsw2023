import { Alert, Button } from "@mui/joy";
import { GoogleLogo } from "@phosphor-icons/react";

export default function AlertSucess() {
  return (
    <Alert
      variant="soft"
      color="success"
      startDecorator={<GoogleLogo />}
      endDecorator={
        <Button
          size="sm"
          variant="outlined"
          color="success"
          sx={{
            textTransform: "uppercase",
            fontSize: "xs",
            fontWeight: "xl",
          }}
        >
          Close
        </Button>
      }
    >
      Your message was sent successfully.
    </Alert>
  );
}
