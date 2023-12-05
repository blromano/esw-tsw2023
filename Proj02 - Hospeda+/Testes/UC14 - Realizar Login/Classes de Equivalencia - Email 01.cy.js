/// <reference types="cypress" />

describe('Classes de Equivalência - Classes Inválidas', () => {
    beforeEach(() => {
      cy.on('uncaught:exception', (err, runnable) => {
        // returning false here prevents Cypress from failing the test
        return false
      })
      //Devido a implementação do Hospeda+, é necessário alterar a URL de acordo com o local onde se encontram os arquivos do projeto
      cy.visit('http://localhost:3000/login.php')
      cy.wait(1000)
      cy.intercept('POST', 'http://localhost:3000/login.php').as('login')
    })

    afterEach(() => {
      cy.wait(500)
    })

    it('Classes Inválidas - Email 01', () => {
      cy.get('#password').type('A@1234')
      cy.get('#bnt_auth').click()
      cy.wait('@login').then((intercept) => {
          expect(intercept.response.statusCode).to.eq(400)
      })
    })

});
