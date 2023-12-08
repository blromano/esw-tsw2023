/// <reference types="cypress" />

describe('Testar Link para "Prefeito"', () => {
  it('deve ir para a página "Prefeitos"', () => {

    cy.visit('http://localhost/ProjectVotoLyze_V5/');

    cy.wait(3000);

    cy.get(':nth-child(1) > .service-item > h4 > .stretched-link')
    .click();

    cy.url().should('include', 'prefeitos.html');
  });
});
