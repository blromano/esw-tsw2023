describe("votolyze", () => {
  it("tests votolyze", () => {
    cy.viewport(796, 519);
    cy.visit("http://localhost:8080/ProjectVotoLyze_V6/index.html");
    cy.get("i.mobile-nav-show").click();
    cy.get("#loginLink > a").click();
    cy.location("href").should("eq", "http://localhost:8080/ProjectVotoLyze_V6/login.html");
    cy.get("#email").click();
    cy.get("#email").type("bunnyland@gmail.com");
    cy.get("#password").click();
    cy.get("#password").clear();
    cy.get("#password").type("Atumalaka");
    cy.get("button").click();

    const mensagemErro = cy.get(".error-message");

    mensagemErro.should("have.text", "Login com sucesso");

    cy.get("#email").clear();
    cy.get("#email").type("bunnyland.dev@gmail.com");
    cy.get("#contact").click();
    cy.get("#password").clear();
    cy.get("#password").type("Atumalaka");
    cy.get("button").click();

    mensagemErro.should("have.text", "Número máximo de carácters excedido");

    cy.get("#contact").click();
    cy.get("#email").clear();
    cy.get("#email").type("bunnyland");
    cy.get("#email").type("bunnylandgmail.com");

    mensagemErro.should("have.text", "Formato de email inválido");

    cy.get("#contact > div > div > div").click();
    cy.get("#email").clear();
    cy.get("#email").type("bunnyland@gmail.com");
    cy.get("#contact").click();
    cy.get("#password").clear();
    cy.get("#password").type("Pedra");
    cy.get("button").click();

    mensagemErro.should("have.text", "Senha insuficiente.");
  });
});