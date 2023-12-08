/// <reference types="cypress" />

describe('Teste de Link para "Vereador"', () => {
    it('deve ir para a página "Vereador"', () => {

        cy.visit('http://localhost/ProjectVotoLyze_V5/');

        cy.wait(3000);

        cy.get(':nth-child(2) > .service-item > h4 > .stretched-link')
        .click();

        cy.url().should('include', 'vereadores.html');
    });
  });