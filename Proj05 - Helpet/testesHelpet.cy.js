describe('Casos de Teste - Helpet', () => {
    beforeEach(() => {
        cy.visit("http://localhost:8080/Chamaweb/")
    });
    it('Casos de Teste #01: Abrir chamado - Válido', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.contains('button', 'Abrir Chamado').click();
        cy.get('#floatingTitle').clear().type('Sem teclado');
        cy.get('select[name="maquina"]').select('1');
        cy.get('select[name="categoria"]').select('1');
        cy.contains('button', 'Enviar').click();
        cy.get('td').contains('Sem teclado').should('exist');
    });
    it('Casos de Teste #02: Abrir chamado - Título Vazio', () => {
        cy.get('#matricula').type("usuario1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.contains('button', 'Abrir Chamado').click();
        cy.get('#floatingTitle').clear();
        cy.get('select[name="maquina"]').select('1');
        cy.get('select[name="categoria"]').select('1');
        cy.contains('button', 'Enviar').click();
        cy.get('#floatingTitle').should('have.value', '');
    });
    it('Casos de Teste #03: Abrir chamado - Máquina Vazia', () => {
        cy.get('#matricula').type("usuario1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.contains('button', 'Abrir Chamado').click();
        cy.get('#floatingTitle').clear().type('Sem Cabo');
        cy.get('select[name="categoria"]').select('1');
        cy.contains('button', 'Enviar').click();
        cy.get('select[name="maquina"]').should('have.value', '');  
    });
    it('Casos de Teste #04: Alterar Informações do Chamado - Título Válido', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Chamados').click();
        cy.get('.link-light').click();
        cy.get('#floatingID').clear().type('Sem mouse');
        cy.contains('button', 'Salvar Alterações').click();
        cy.get('th').contains('Sem mouse').should('exist');
    });
    it('Casos de Teste #05  : Alterar Informações do Chamado - Título Vazio', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Chamados').click();
        cy.get('.link-light').click();
        cy.get('#floatingID').clear();
        cy.contains('button', 'Salvar Alterações').click();
        cy.get('#floatingID').should('have.value', '');
    });
    it('Casos de Teste #06: Visualizar Lista de Chamados', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Chamados').click();
        cy.get('th').contains('Listagem de Chamados').should('exist');
    });
    it('Casos de Teste #07: Listar Laboratórios', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Laboratórios').click();
        cy.get('th').contains('Listagem de Laboratórios').should('exist');
    });
    it('Casos de Teste #08: Alterar Categoria de Problema - Válido', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Categorias de Problemas').click();
        cy.get('.link-light').click();
        cy.get('#nome').clear().type('Troca');
        cy.contains('button', 'Salvar Alterações').click();
        cy.get('td').contains('Troca').should('exist');
    });
    it('Casos de Teste #09: Alterar Categoria de Problema - Campo não preenchido', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Categorias de Problemas').click();
        cy.get('.link-light').click();
        cy.get('#nome').clear();
        cy.contains('button', 'Salvar Alterações').click();
        cy.get('#nome').should('have.value', '');
    });
    it('Casos de Teste #10: Listar Categorias de Problema', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Categorias de Problemas').click();
        cy.get('th').contains('Listagem de Categorias de Problemas').should('exist');
    });
    it('Casos de Teste #11: Adicionar Nova Categoria de Problema', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Categorias de Problemas').click();
        cy.contains('button', 'Cadastrar Nova Categoria de Problema').click();
        cy.get('#nome').type('Reparo');
        cy.contains('button', 'Enviar').click();
        cy.get('td').contains('Reparo').should('exist');
    });
    it('Casos de Teste #11: Adicionar Nova Categoria de Problema - Categoria Vazia', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains('button', 'Entrar').click();
        cy.get('.nav-link.dropdown-toggle.active').click();
        cy.get('.dropdown-menu').contains('input', 'Categorias de Problemas').click();
        cy.contains('button', 'Cadastrar Nova Categoria de Problema').click();
        cy.contains('button', 'Enviar').click();
        cy.get('#nome').should('have.value', '');
    });
    it('Cadastrar Nova Maquina - Principal', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains("Entrar").click();
        cy.contains("Técnico").click();
        cy.contains("Máquinas").click();
        cy.contains("Cadastrar Nova Máquina").click();
        cy.get('#marca').type("Dell");
        cy.get('#modelo').type("OptiPlex 3100");
        cy.get('#processador').type("Intel Core I5 10300H");
        cy.get('#ram').type("8Gb");
        cy.get('#os').type("Windows");
        cy.contains("Enviar").click();
    });
    it('Cadastrar Nova Maquina - Campos Vazios', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains("Entrar").click();
        cy.contains("Técnico").click();
        cy.contains("Máquinas").click();
        cy.contains("Cadastrar Nova Máquina").click();
        cy.get('#marca').type("Dell");
        cy.get('#modelo').type("OptiPlex 3100");
        cy.get('#ram').type("8Gb");
        cy.get('#os').type("Windows");
        cy.contains("Enviar").click();
    });
    it('Alterar informações máquina - Principal', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains("Entrar").click();
        cy.contains("Técnico").click();
        cy.contains("Máquinas").click();
        cy.get(':nth-child(1) > :nth-child(9) > .link-light').click();
        cy.get('#marca').clear();
        cy.get('#marca').type("Lenovo");
        cy.contains("Salvar Alterações").click();
    });

    it('Alterar informações máquina - campos vazios', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains("Entrar").click();
        cy.contains("Técnico").click();
        cy.contains("Máquinas").click();
        cy.get(':nth-child(1) > :nth-child(9) > .link-light').click();
        cy.get('#marca').clear();
        cy.contains("Salvar Alterações").click();
    });

    it('Acessar informações', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains("Entrar").click();
        cy.contains("Técnico").click();
        cy.contains("Máquinas").click();
    });
    it('Cadastrar Novo Lab - Principal', () => {
        cy.get('#matricula').type("tecnico1");
        cy.get('#senha').type("1234");
        cy.contains("Entrar").click();
        cy.contains("Técnico").click();
        cy.contains("Laboratórios").click();
        cy.contains("Cadastrar Novo Laboratório").click();
        cy.get('#nome').type("lab07");
        cy.contains("Enviar").click();
    });
});
