<%@page language="java" import="java.sql.*" %>

<%
    //criar as variaveis que vão armazenar as informações
    //variaveis do cadastro
    String vnome = request.getParameter("txtNome");
    Long vcpf = Long.parseLong(request.getParameter("txtCpf"));
    String vemail = request.getParameter("txtEmail");
    String vdata_nascimento = request.getParameter("txtDat_nascimento");
    String vtelefone = request.getParameter("txtTelefone");

    //variaveis da doação
    String vdoacao = request.getParameter("txtValor");
    String vpagamento = request.getParameter("pagamento");

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

    String sql = "insert into cadastro (nome,telefone,email,data_nascimento,cpf) values (?,?,?,?,?)";

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setString(2, vtelefone);
    stm.setString(3, vemail);
    stm.setString(4, vdata_nascimento);
    stm.setLong(5, vcpf);

    stm.execute();
    stm.close();

    String sql_doacao = "insert into doacao (doacao,pagamento) values (?,?)";

    PreparedStatement stm_doacao = conexao.prepareStatement(sql_doacao);
    stm_doacao.setString(1, vdoacao);
    stm_doacao.setString(2, vpagamento);

    stm_doacao.execute();
    stm_doacao.close();

    out.print("<h2> Dados gravados com sucesso </h2>");
%>
