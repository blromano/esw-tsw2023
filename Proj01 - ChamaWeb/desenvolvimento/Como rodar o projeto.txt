Para executar o projeto:

1) Baixe e instale o Apache Netbeans 18 e o Java 17. Disponivel no link a seguir: 
	https://www.apache.org/dyn/closer.cgi/netbeans/netbeans-installers/18/Apache-NetBeans-18-bin-windows-x64.exe
   Ao acessar esse link, a versão 18 do Apache NetBeans para Windows será baixada.

   Execute o instalador. As versões atuais dos instaladores NetBeans farão
   a instalação completa da IDE. Basta seguir o assistente, escolher o JDK 17 e aguardar o fim da instalação.

2) Abra o Netbeans e instale o Glassfish Server 7.0.3
   
   Com o NetBeans aberto, do lado esquerdo, clique na aba Services. Nessa aba, há um nó chamado Servers. Clique com
   o botão direito do mouse nele e escolha "Add Server...". O assistente aparecerá. 
   No primeiro passo, na lista de servidores suportados, escolha "GlassFish Server". 
   Na caixa de texto "Name:" edite o nome da instância do servidor, ficando “GlassFish Server 7.0.3”. Ao fazer isso, clique em "Next >".

   O segundo passo do assistente precisamos definir onde os arquivos do servidor ficarão. 
   Nesse passo, clique no botão Browse... e defina onde a instalação ficará. 
   Deixe a opção Local Domain selecionada, escolha a versão do servidor para download (GlassFish Server 7.0.3),
   marque a opção “I have read...” e clique em Download Now . Ao finalizar o download,
   uma mensagem logo abaixo do assistente indicará que foi encontrada uma instalação
   do servidor no local escolhido, então basta clicar em "Next >".

   Defina o nome do usuário no campo "User Name:" como "admin", sem as aspas, e clique em "Finish"

3) Instale o Driver Java Database Conectivity

  Baixe o arquivo acessível através do link https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/3.1.4/mariadb-java-client-3.1.4.jar 
  e, ao terminar de baixar, copie-o para o diretório onde foi instalado o glassfish, dentro da pasta "glassfish\domains\domain1\lib\".

4) Execute os arquivos .sql e gere o banco de dados a ser usado
   
   Para que o acesso ao banco de dados funcione, o usuário MySQL deve ser "root", sem senha.

5) Abra o projeto Chamaweb no netbeans e execute-o, através do botão "Play" na barra de navegação, ou pelo atalho "
