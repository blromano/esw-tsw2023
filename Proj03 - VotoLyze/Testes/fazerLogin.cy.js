/// <reference types="cypress" />


describe('example to-do app', () => {
    beforeEach(() => {
  
      cy.visit('http://localhost:8080/ProjectVotoLyze_V6.html')
    })

it('Fazer o login', () => {
    cy.visit('http://localhost:8080/ProjectVotoLyze_V6/login.html')
    cy.get('#email').type("gui@email.com");
    cy.get('#password').type("Gui@123");
    cy.contains('button', 'Entrar').click();
    cy.get("div h2").should("contain", "Nós somos a ");
  
})

})