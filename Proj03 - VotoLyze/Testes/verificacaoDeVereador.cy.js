/// <reference types="cypress" />

describe('example to-do app', () => {
    beforeEach(() => {
      
    })
  
    it('Verificar Acesso a busca de Vereadores', () => {
        cy.visit('http://localhost:8080/ProjectVotoLyze_V6/vereadores.html')
        cy.get("div h3").should("contain", "Sabrine Luneta");
        //cy.contains("VEREADORES").click();
      //cy.get('.todo-list li').should('have.length', 2)
  
      //cy.get('.todo-list li').first().should('have.text', 'Pay electric bill')
      //cy.get('.todo-list li').last().should('have.text', 'Walk the dog')



    })

  })
  