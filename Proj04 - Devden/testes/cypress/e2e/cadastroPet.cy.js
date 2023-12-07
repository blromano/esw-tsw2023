/// <reference types="cypress" />

describe("Cadastro de Pets", () => {
  beforeEach(() => {
    cy.visit("http://localhost:8080/client");
  });

  it("Cpf com 10 caracteres", () => {
    cy.get('[href="/cadastros"]').click();

    // Nome do pet
    cy.get('[placeholder="Nome do Pet"]').type("Lindinha");

    // Tipo do pet
    cy.get('[placeholder="Tipo do Pet"]').type("Gato");

    // Tamanho do pet
    cy.get('[placeholder="Tamanho do Pet"]').type("P");

    // Sexo do pet
    cy.get('[placeholder="Sexo do Pet"]').type("M");

    // Raca do pet
    cy.get('[placeholder="Raca do Pet"]').type("Ragdoll");

    // Cor do pet
    cy.get('[placeholder="Cor do Pet"]').type("Brango com bege");

    // Cpf do tutor
    cy.get('[placeholder="CPF do Tutor"]').type("4966663452");

    // Nome do tutor
    cy.get('[placeholder="Nome do Tutor"]').type("Filipe Muniz");

    cy.on("window:alert", (str) => {
      expect(str).to.equal(`Não é possível cadastrar o cpf com 10 caracteres!`);
    });

    expect(true).to.equal(false);
  });

  it("Cpf com 11 caracteres", () => {
    cy.get('[href="/cadastros"]').click();

    // Nome do pet
    cy.get('[placeholder="Nome do Pet"]').type("Lindinha");

    // Tipo do pet
    cy.get('[placeholder="Tipo do Pet"]').type("Gato");

    // Tamanho do pet
    cy.get('[placeholder="Tamanho do Pet"]').type("P");

    // Sexo do pet
    cy.get('[placeholder="Sexo do Pet"]').type("M");

    // Raca do pet
    cy.get('[placeholder="Raca do Pet"]').type("Ragdoll");

    // Cor do pet
    cy.get('[placeholder="Cor do Pet"]').type("Brango com bege");

    // Cpf do tutor
    cy.get('[placeholder="CPF do Tutor"]').type("49666634522");

    // Nome do tutor
    cy.get('[placeholder="Nome do Tutor"]').type("Filipe Muniz");

    cy.get(".container > :nth-child(2) > .btn").should(
      "have.text",
      "Não possui conta?"
    );
  });

  it("Cpf com 12 caracteres", () => {
    cy.get('[href="/cadastros"]').click();

    // Nome do pet
    cy.get('[placeholder="Nome do Pet"]').type("Lindinha");

    // Tipo do pet
    cy.get('[placeholder="Tipo do Pet"]').type("Gato");

    // Tamanho do pet
    cy.get('[placeholder="Tamanho do Pet"]').type("P");

    // Sexo do pet
    cy.get('[placeholder="Sexo do Pet"]').type("M");

    // Raca do pet
    cy.get('[placeholder="Raca do Pet"]').type("Ragdoll");

    // Cor do pet
    cy.get('[placeholder="Cor do Pet"]').type("Brango com bege");

    // Cpf do tutor
    cy.get('[placeholder="CPF do Tutor"]').type("496666345222");

    // Nome do tutor
    cy.get('[placeholder="Nome do Tutor"]').type("Filipe Muniz");

    cy.on("window:alert", (str) => {
      expect(str).to.equal(`Não é possível cadastrar o cpf com 12 caracteres!`);
    });

    expect(true).to.equal(false);
  });

  it("Tamanho com 254 caracteres", () => {
    cy.get('[href="/cadastros"]').click();

    // Nome do pet
    cy.get('[placeholder="Nome do Pet"]').type("Lindinha");

    // Tipo do pet
    cy.get('[placeholder="Tipo do Pet"]').type("Gato");

    // Tamanho do pet
    cy.get('[placeholder="Tamanho do Pet"]').type(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mi proin sed libero enim sed. Elit ut aliquam purus sit amet. Nec dui nunc mattis enim ut tellus elementum sagittis. Augue ut"
    );

    // Sexo do pet
    cy.get('[placeholder="Sexo do Pet"]').type("M");

    // Raca do pet
    cy.get('[placeholder="Raca do Pet"]').type("Ragdoll");

    // Cor do pet
    cy.get('[placeholder="Cor do Pet"]').type("Brango com bege");

    // Cpf do tutor
    cy.get('[placeholder="CPF do Tutor"]').type("49666634522");

    // Nome do tutor
    cy.get('[placeholder="Nome do Tutor"]').type("Filipe Muniz");

    cy.get(".container > :nth-child(2) > .btn").should(
      "have.text",
      "Não possui conta?"
    );
  });

  it("Tamanho com 255 caracteres", () => {
    cy.get('[href="/cadastros"]').click();

    // Nome do pet
    cy.get('[placeholder="Nome do Pet"]').type("Lindinha");

    // Tipo do pet
    cy.get('[placeholder="Tipo do Pet"]').type("Gato");

    // Tamanho do pet
    cy.get('[placeholder="Tamanho do Pet"]').type(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mi proin sed libero enim sed. Elit ut aliquam purus sit amet. Nec dui nunc mattis enim ut tellus elementum sagittis. Augue utt"
    );

    // Sexo do pet
    cy.get('[placeholder="Sexo do Pet"]').type("M");

    // Raca do pet
    cy.get('[placeholder="Raca do Pet"]').type("Ragdoll");

    // Cor do pet
    cy.get('[placeholder="Cor do Pet"]').type("Brango com bege");

    // Cpf do tutor
    cy.get('[placeholder="CPF do Tutor"]').type("49666634522");

    // Nome do tutor
    cy.get('[placeholder="Nome do Tutor"]').type("Filipe Muniz");

    cy.get(".container > :nth-child(2) > .btn").should(
      "have.text",
      "Não possui conta?"
    );
  });

  it("Tamanho com 256 caracteres", () => {
    cy.get('[href="/cadastros"]').click();

    // Nome do pet
    cy.get('[placeholder="Nome do Pet"]').type("Lindinha");

    // Tipo do pet
    cy.get('[placeholder="Tipo do Pet"]').type("Gato");

    // Tamanho do pet
    cy.get('[placeholder="Tamanho do Pet"]').type(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mi proin sed libero enim sed. Elit ut aliquam purus sit amet. Nec dui nunc mattis enim ut tellus elementum sagittis. Augue utt"
    );

    // Sexo do pet
    cy.get('[placeholder="Sexo do Pet"]').type("M");

    // Raca do pet
    cy.get('[placeholder="Raca do Pet"]').type("Ragdoll");

    // Cor do pet
    cy.get('[placeholder="Cor do Pet"]').type("Brango com bege");

    // Cpf do tutor
    cy.get('[placeholder="CPF do Tutor"]').type("49666634522");

    // Nome do tutor
    cy.get('[placeholder="Nome do Tutor"]').type("Filipe Muniz");

    cy.on("window:alert", (str) => {
      expect(str).to.equal(
        `Não é possível cadastrar o tamanho com 256 caracteres!`
      );
    });

    expect(true).to.equal(false);
  });
});
