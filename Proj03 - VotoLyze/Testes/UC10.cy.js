const { empty } = require("check-more-types");

describe('Votolyze - UC10', () => {
    beforeEach(() => {
        login('petrikfarbo@gmail.com', 'Senha123@');
    });

    
    it('UC10 - Alterar dados pessoais', () => {
        cy.wait(2000);
        cy.get('.mobile-nav-show').click();
        cy.contains('#loginLink > a', 'petrikfarbo@gmail.com').click();
        cy.contains('.btn-info > a', 'Alterar dados pessoais').click();

        alterarDados('Alfredo Natalino', 'anatalino@gmail.com', 'Natal1990@', '1990-05-05', 'Brasileiro', 'Prefeito', '123.Png');
    });    

});

function alterarDados(nome, email, senha, data, naturalidade, tipo, foto) {
    cy.log("O sistema está faltando dados.")
    cy.get('#nome').type(nome);
    cy.get('#emailInput').type(email);
    cy.get('#dataNascimento').type(data);

    cy.get('#naturalidade').type(naturalidade);
    cy.get('#tipo').type(tipo);
    cy.get('#foto').type(foto);
    
    cy.contains('.btn', 'Enviar').click();
}


function login (email, senha){
    cy.visit('http://localhost:8080/ProjectVotoLyze_V6/login.html');
    cy.wait(2000);

    cy.get('#email').type(email);
    cy.get('#password').type(senha);

    cy.contains('button', 'Entrar').click();
}