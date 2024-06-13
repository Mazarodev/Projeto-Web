<%@page language="java" import="java.sql.*" %>

<%
 //criar as variaveis que vão armazenar as informações
    String vemail = request.getParameter("txtEmail");
    String vtelefone = request.getParameter("txtTelefone");
    String vmensagem =request.getParameter("txtMensagem");
    String vnome = request.getParameter("txtNome");

//Variaveis para acessar o banco
    String banco = "projeto";
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

    String sql = "insert into contato (email,telefone,mensagem,nome) values (?,?,?,?)";

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vemail);
    stm.setString(2, vtelefone);
    stm.setString(3, vmensagem);
    stm.setString(4, vnome);

    stm.execute();
    stm.close();

    out.print("<h2> Dados gravados com sucesso </h2>");
    %>