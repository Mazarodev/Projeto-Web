
<%@page language="java" import="java.sql.*" %>
<%

        /*abrir esse site/executar somente caso não tenha as tabelas do banco de dados feitas 

        esse codigo cria a tabela completa de cadastro, doação e contato.

        no site do banco de dados, crie o banco.

        coloque esse arquivo dentro da pasta do banco, na linha 20 mude o nome do conteudo nas "" da String banco para o nome que voce deu no banco de dados.

        agora abra esse site no navegador apenas uma vez, depois verifique no banco de dados se as tabelas foram criadas corretamente e faça o teste de gravar e consulta.

        */



     //Variaveis para acessar o banco
    String banco = "abacate";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "";

    //driver
    String driver = "com.mysql.jdbc.Driver";

    //Carregando o driver na memoria
    Class.forName( driver);

    //Cria a variavel para conectar no banco
    Connection conexao;

    //Abrir a conexao com o banco
    conexao = DriverManager.getConnection( endereco , usuario , senha);

    String sql = "create table contato ( id_contato int(11) PRIMARY KEY AUTO_INCREMENT NOT null, email varchar(250), telefone varchar(11), mensagem varchar(300), nome varchar(250) );";
    

    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.execute();
    stm.close();

    String sql2 = "create table cadastro ( nome varchar(250), telefone varchar(11), email varchar(250), data_nascimento date, cpf bigint(11) PRIMARY KEY AUTO_INCREMENT NOT null );";

    PreparedStatement stm2 = conexao.prepareStatement(sql2);

    stm2.execute();
    stm2.close();

    String sql3 = "create table doacao ( id_doacao int(11) PRIMARY KEY AUTO_INCREMENT NOT null, doacao varchar(250), pagamento varchar(250), email varchar(250), nome varchar(250) );";

    PreparedStatement stm3 = conexao.prepareStatement(sql3);

    stm3.execute();
    stm3.close();

    out.print("<h1>Tabelas criadas com sucesso.</h1>");
    out.print("<h3>Verifique no banco de dados se elas foram criadas e faça o teste</h3>");
%>