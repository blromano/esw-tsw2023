const { empty } = require("check-more-types");

describe('Votolyze - UC08', () => {
    beforeEach(() => {
        login('petrikfarbo@gmail.com', 'Senha123@');
    });

    
    it('UC08 - Dar o Feedback', () => {
        cy.wait(2000);
        darFeedbackPositivo();
        cy.log("O sistema está selecionando o feedback mas nao informa se foi salvo.")
        cy.get('elemento_que_confirma_feedback').should('be.visible').should('not.exist');
    });

    it('UC08 - Cancela o feedback', () => {
        cy.wait(2000);
        darFeedbackPositivo();
        cy.log("O sistema está selecionando o feedback mas nao tem opção de cancelar.")
        cy.get('elemento_que_cancela_feedback').should('be.visible').should('not.exist');
        
    });
    
    

});

function darFeedbackPositivo() {

    cy.contains('a', 'PREFEITOS').click();
    cy.get(':nth-child(2) > .gallery-item > .gallery-links > .details-link > .bi').click();
    cy.get(':nth-child(1) > .pricing-item > [value="curti"]').click();
    
}


function login (email, senha){
    cy.visit('http://localhost:8080/ProjectVotoLyze_V6/login.html');
    cy.wait(2000);

    cy.get('#email').type(email);
    cy.get('#password').type(senha);

    cy.contains('button', 'Entrar').click();
}