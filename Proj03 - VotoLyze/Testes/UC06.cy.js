const { empty } = require("check-more-types");

describe('Votolyze - UC06', () => {
    beforeEach(() => {
        login('jennifer@gmail.com.br', 'Senha123@');
    });

    
    it('UC06 - Inserir Promessas de Campanha e Propostas', () => {
        cy.wait(2000);
        cy.get('.mobile-nav-show').click();
        cy.contains('#loginLink > a', 'jennifer@gmail.com.br').click();
        cy.contains('.btn-dark > a', ' Promessas de campanha e propostas').click();

        criarPromessas('Rotatória', 'Rotatória na pista com acesso ao bairro', '2024-08-29');
    });
    
    it('UC06 - Campos não preenchidos', () => {
        cy.wait(2000);
        cy.get('.mobile-nav-show').click();
        cy.contains('#loginLink > a', 'jennifer@gmail.com.br').click();
        cy.contains('.btn-dark > a', ' Promessas de campanha e propostas').click();
        cy.wait(2000);
        criarPromessas('Rotatória', 'Rotatória na pista com acesso ao bairro');
    });

    it('UC06 - Cancelar operação', () => {
        cy.wait(2000);
        cy.get('.mobile-nav-show').click();
        cy.contains('#loginLink > a', 'jennifer@gmail.com.br').click();
        cy.contains('.btn-dark > a', ' Promessas de campanha e propostas').click();
        //Faltando a parte do cancelar.
        fail("O sistema está faltando a parte do cancelar.");
    });

    

});

function criarPromessas(titulo, desc, data) {
    cy.get('#novaPropostaTitulo').type(titulo);
    cy.get('#novaPropostaDescricao').type(desc);
    if (data) {
        cy.get('#novaPropostaData').type(data);
    }
    
    cy.contains('button', 'Inserir nova promessa/proposta').click();
}


function login (email, senha){
    cy.visit('http://localhost:8080/ProjectVotoLyze_V6/login.html');
    cy.wait(2000);

    cy.get('#email').type(email);
    cy.get('#password').type(senha);

    cy.contains('button', 'Entrar').click();
}