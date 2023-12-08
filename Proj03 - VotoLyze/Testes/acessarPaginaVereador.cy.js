/// <reference types="cypress" />

describe('Teste para acessar o perfil de um vereador', () => {
    it('deve ir para o perfil de um vereador', () => {

        cy.visit('http://localhost/ProjectVotoLyze_V5/vereadores.html');

        cy.wait(3000);

        cy.get(':nth-child(1) > .gallery-item > .gallery-links')
        .click();

        cy.url().should('include', 'perfil_vereador.html');
    });
  });
  