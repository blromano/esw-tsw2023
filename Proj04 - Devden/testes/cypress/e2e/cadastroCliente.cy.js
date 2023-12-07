/// <reference types="cypress" />

describe("Cadastro de clientes", () => {
  beforeEach(() => {
    cy.visit("http://localhost:8080/");
  });

  it("Cpf com 10 caracteres", () => {
    cy.get(".container > :nth-child(2) > .btn").click();

    // nome do cliente
    cy.get(
      "#createAccount > .modal-dialog > .modal-content > .modal-body > :nth-child(1) > #floatingInput"
    ).type("Felipe Andrade");

    // cpf
    cy.get(":nth-child(2) > #floatingInput").type("1234567890");

    // endereço
    cy.get(":nth-child(3) > #floatingInput").type("Rua 1234");

    // email
    cy.get(":nth-child(4) > #floatingInput").type("teste@mail.com");

    // senha
    cy.get(":nth-child(5) > #floatingPassword").type("senhaTeste");

    // confirmar senha
    // ele é preenchido pela senha já, tirei aqui pra poupar tempo
    // cy.get(":nth-child(6) > #floatingPassword").type("senhaTeste");

    // botão de salvar
    cy.get(":nth-child(1) > button").click();

    cy.on("window:alert", (str) => {
      expect(str).to.equal(`Não é possível cadastrar o cpf com 10 caracteres!`);
    });

    expect(true).to.equal(false);
  });

  it("Cpf com 11 caracteres", () => {
    cy.get(".container > :nth-child(2) > .btn").click();

    // nome do cliente
    cy.get(
      "#createAccount > .modal-dialog > .modal-content > .modal-body > :nth-child(1) > #floatingInput"
    ).type("Felipe Andrade");

    // cpf
    cy.get(":nth-child(2) > #floatingInput").type("12345678901");

    // endereço
    cy.get(":nth-child(3) > #floatingInput").type("Rua 1234");

    // email
    cy.get(":nth-child(4) > #floatingInput").type("teste@mail.com");

    // senha
    cy.get(":nth-child(5) > #floatingPassword").type("senhaTeste");

    // confirmar senha
    // ele é preenchido pela senha já, tirei aqui pra poupar tempo
    // cy.get(":nth-child(6) > #floatingPassword").type("senhaTeste");

    // botão de salvar
    cy.get(":nth-child(1) > button").click();

    cy.get(".container > :nth-child(2) > .btn").should(
      "have.text",
      "Não possui conta?"
    );
  });

  it("Cpf com 12 caracteres", () => {
    cy.get(".container > :nth-child(2) > .btn").click();

    // nome do cliente
    cy.get(
      "#createAccount > .modal-dialog > .modal-content > .modal-body > :nth-child(1) > #floatingInput"
    ).type("Felipe Andrade");

    // cpf
    cy.get(":nth-child(2) > #floatingInput").type("123456789012");

    // endereço
    cy.get(":nth-child(3) > #floatingInput").type("Rua 1234");

    // email
    cy.get(":nth-child(4) > #floatingInput").type("teste@mail.com");

    // senha
    cy.get(":nth-child(5) > #floatingPassword").type("senhaTeste");

    // confirmar senha
    // ele é preenchido pela senha já, tirei aqui pra poupar tempo
    // cy.get(":nth-child(6) > #floatingPassword").type("senhaTeste");

    // botão de salvar
    cy.get(":nth-child(1) > button").click();

    cy.on("window:alert", (str) => {
      expect(str).to.equal(`Não é possível cadastrar o cpf com 10 caracteres!`);
    });

    expect(true).to.equal(false);
  });

  it("Senha com 0 caracteres", () => {
    cy.get(".container > :nth-child(2) > .btn").click();

    // nome do cliente
    cy.get(
      "#createAccount > .modal-dialog > .modal-content > .modal-body > :nth-child(1) > #floatingInput"
    ).type("Felipe Andrade");

    // cpf
    cy.get(":nth-child(2) > #floatingInput").type("12345678901");

    // endereço
    cy.get(":nth-child(3) > #floatingInput").type("Rua 1234");

    // email
    cy.get(":nth-child(4) > #floatingInput").type("teste@mail.com");

    // senha (vazia, no caso)
    // cy.get(":nth-child(5) > #floatingPassword").type("");

    // confirmar senha
    // ele é preenchido pela senha já, tirei aqui pra poupar tempo
    // cy.get(":nth-child(6) > #floatingPassword").type("senhaTeste");

    // botão de salvar
    cy.get(":nth-child(1) > button").click();

    cy.on("window:alert", (str) => {
      expect(str).to.equal(`Não é possível cadastrar a senha vazia!`);
    });

    expect(true).to.equal(false);
  });

  it("Senha com 1 caracteres", () => {
    cy.get(".container > :nth-child(2) > .btn").click();

    // nome do cliente
    cy.get(
      "#createAccount > .modal-dialog > .modal-content > .modal-body > :nth-child(1) > #floatingInput"
    ).type("Felipe Andrade");

    // cpf
    cy.get(":nth-child(2) > #floatingInput").type("12345678901");

    // endereço
    cy.get(":nth-child(3) > #floatingInput").type("Rua 1234");

    // email
    cy.get(":nth-child(4) > #floatingInput").type("teste@mail.com");

    // senha
    cy.get(":nth-child(5) > #floatingPassword").type("s");

    // confirmar senha
    // ele é preenchido pela senha já, tirei aqui pra poupar tempo
    // cy.get(":nth-child(6) > #floatingPassword").type("senhaTeste");

    // botão de salvar
    cy.get(":nth-child(1) > button").click();

    cy.get(".container > :nth-child(2) > .btn").should(
      "have.text",
      "Não possui conta?"
    );
  });

  it("Senha com 255 caracteres", () => {
    cy.get(".container > :nth-child(2) > .btn").click();

    // nome do cliente
    cy.get(
      "#createAccount > .modal-dialog > .modal-content > .modal-body > :nth-child(1) > #floatingInput"
    ).type("Felipe Andrade");

    // cpf
    cy.get(":nth-child(2) > #floatingInput").type("12345678901");

    // endereço
    cy.get(":nth-child(3) > #floatingInput").type("Rua 1234");

    // email
    cy.get(":nth-child(4) > #floatingInput").type("teste@mail.com");

    // senha
    cy.get(":nth-child(5) > #floatingPassword").type(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mi proin sed libero enim sed. Elit ut aliquam purus sit amet. Nec dui nunc mattis enim ut tellus elementum sagittis. Augue utt"
    );

    // confirmar senha
    // ele é preenchido pela senha já, tirei aqui pra poupar tempo
    // cy.get(":nth-child(6) > #floatingPassword").type("senhaTeste");

    // botão de salvar
    cy.get(":nth-child(1) > button").click();

    cy.get(".container > :nth-child(2) > .btn").should(
      "have.text",
      "Não possui conta?"
    );
  });
});
