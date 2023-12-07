/// <reference types="cypress" />

//O projeto do Hospeda+ possui exceções não tratadas, e o cypress não consegue ignorar essas exceções para multiplos casos de teste dentro de um mesmo arquivo
//Por isso, cada caso de teste se encontrará em um arquivo diferente, para que o cypress não pare a execução

describe('Classes de Equivalência - Nome Completo 01', () => {
    beforeEach(() => {
      cy.on('uncaught:exception', (err, runnable) => {
        // returning false here prevents Cypress from failing the test
        return false
      })
	    //Devido a implementação do Hospeda+, pode ser necessário alterar a URL de acordo com o modo que foi hospedado o projeto
      cy.visit('http://localhost:3000/telaCadastro.php')
      cy.wait(1000)
      cy.intercept('POST', 'http://localhost:3000/telaCadastro.php').as('telaCadastro')
    })

    afterEach(() => {
      cy.wait(500)
    })

    it('Classes Inválidas - Nome Completo 01', () => {
        
      preencherFormulário(
        '', 
        '2010-10-10', 
        '12345678910', 
        '20.674.839-5', 
        'Masculino', 
        '(19) 12345-6789',
        'xxx@xxx.xxx',
        'Cidade das Cidades',
        '10',
        'A@1234',
        'A@1234'
      )

      cy.wait('@telaCadastro').then((intercept) => {
        expect(intercept.response.statusCode).to.not.eq(302)
      })

    })

  })


// função para preencher o formulário
function preencherFormulário(nome, dataNascimento, cpf, rg, sexo, celular, email, cidade, numero, senha, confirmarSenha) {
  if (nome != '') {
    cy.get(':nth-child(1) > .book_n').type(nome)
  }
  if (dataNascimento != '') {
    cy.get(':nth-child(2) > .book_n').type(dataNascimento)
  }
  if (cpf != '') {
    cy.get(':nth-child(3) > .book_n').type(cpf)
  }
  if (rg != '') {
    cy.get(':nth-child(4) > .book_n').type(rg)
  }
  if (sexo != '') {
    cy.get(':nth-child(5) > .book_n').select(sexo)
  }
  if (celular != '') {
    cy.get(':nth-child(6) > .book_n').type(celular)
  }
  if (email != '') {
    cy.get('.col-md-10 > .book_n').type(email)
  }
  if (cidade != '') {
    cy.get(':nth-child(8) > .book_n').type(cidade)
  }
  if (numero != '') {
    cy.get(':nth-child(9) > .book_n').type(numero)
  }
  if (senha != '') {
    cy.get(':nth-child(10) > .book_n').type(senha)
  }
  if (confirmarSenha != '') {
    cy.get(':nth-child(11) > .book_n').type(confirmarSenha)
  }

  cy.get('.book_btn').click()

}
  