/// <reference types="cypress" />

describe('Testar Link para "Index"', () => {
    it('deve ir para a página "Index"', () => {

        cy.visit('http://localhost/ProjectVotoLyze_V5/');

        cy.wait(3000);

        cy.get('h1')
        .click();

        cy.url().should('include', 'index.html');
    });
  });