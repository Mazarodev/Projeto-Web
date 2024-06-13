<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>
        *{
            margin:0px;
        }
        body{
            background-color:#8dbd91;
        }

        .titulo{
            display:flex;
            justify-content: center;
            margin: 0px 0px 20px 0px;
            background-color: #185f39;
            padding: 80px 0px;
        }
        h1{
            font-size: 50px;
            font-family:'overpass Mono';
            color: white;
        }

        .container-conteudoJSP{
            display: flex;
            justify-content: center;
        }

        .conteudoJSP{
            background-color: white;
            padding: 20px 80px;
            border-radius: 15px;
        }
        tr:nth-child(even) {
            background-color: lightgray;
        }
        tr:hover{
            background-color: #6495ED;
        }

        .mensagems{
            padding: 20px;
        }

        .doacao{
            padding: 20px;
        }


        .logo{
            position: fixed;
            bottom: 0;
            margin: 30px;
        }
        .logo a img{
            width: 200px;
        }
        
    </style>
    <!--fontes-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Overpass+Mono:wght@300..700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="titulo">
        <h1>Dados recebidas</h1>
    </div>

    <div class="container-conteudoJSP">
        <div class="conteudoJSP">
            <%
            //variáveis para acessar o banco
                        String banco = "projeto";
                        String endereco = "jdbc:mysql://localhost:3306/" + banco;
                        String usuario = "root";
                        String senha = "";

                        //variável para o driver
                        String driver = "com.mysql.jdbc.Driver";

                        Class.forName( driver );

                        //criar vaiável para conexão
                        Connection conexao;

                        //abro conexao
                        conexao = DriverManager.getConnection( endereco,usuario,senha );

                        String sql = "SELECT * FROM contato";
                        String sql_c = "SELECT * FROM cadastro";
                        String sql_d = "SELECT * FROM doacao";

                        //Criar o statement para executar o comando
                        PreparedStatement stm = conexao.prepareStatement( sql );

                        ResultSet dados = stm.executeQuery();

                        out.print("<h2 class='mensagems'>Mensagems</h2>");

                        out.print("<table border=1>");
                        out.print("<tr>");
                        out.print("<th>Codigo</th>");  
                        out.print("<th>Nome</th>");  
                        out.print("<th>telefone</th>");  
                        out.print("<th>Email</th>");
                        out.print("<th>Mensagem</th>");  
                        out.print("</tr>");

                        while( dados.next() ){
                            out.print("<tr>");
                                out.print("<td>");
                                out.print(dados.getString("id_contato")); 
                                out.print("</td>");
                            
                                out.print("<td>");
                                out.print(dados.getString("nome")); 
                                out.print("</td>");
                            
                                out.print("<td>");
                                out.print(dados.getString("telefone")); 
                                out.print("</td>");
                            
                                out.print("<td>");
                                out.print(dados.getString("email")); 
                                out.print("</td>");

                                out.print("<td>");
                                out.print(dados.getString("mensagem")); 
                                out.print("</td>");
                            out.print("</tr>");    
                        }

                        out.print("</table>");

                        out.print("<h2 class='doacao'>Doacoes</h2>");

                        //Criar o statement para executar o comando
                        PreparedStatement stm_c = conexao.prepareStatement( sql_c );
                        ResultSet dados_c = stm_c.executeQuery();

                        PreparedStatement stm_d = conexao.prepareStatement( sql_d );
                        ResultSet dados_d = stm_d.executeQuery();

                        out.print("<table border=1>");
                        out.print("<tr>");
                        out.print("<th>nome</th>");  
                        out.print("<th>cpf</th>");  
                        out.print("<th>data de nascimento</th>");  
                        out.print("<th>telefone</th>");
                        out.print("<th>email</th>");
                        out.print("<th>doacao</th>");
                        out.print("<th>meio de pagamento</th>");
                        out.print("<th>codigo</th>");
                        out.print("</tr>");

                        while( dados_c.next() ){
                            out.print("<tr>");
                                
                                out.print("<td>");
                                out.print(dados_c.getString("nome")); 
                                out.print("</td>");
                            
                                out.print("<td>");
                                out.print(dados_c.getString("cpf")); 
                                out.print("</td>");
                            
                                out.print("<td>");
                                out.print(dados_c.getString("data_nascimento")); 
                                out.print("</td>");
                            
                                out.print("<td>");
                                out.print(dados_c.getString("telefone")); 
                                out.print("</td>");

                                out.print("<td>");
                                out.print(dados_c.getString("email")); 
                                out.print("</td>");
                                
                        }
                        while(dados_d.next()){
                            out.print("<td>");
                            out.print(dados_d.getString("doacao")); 
                            out.print("</td>");
                                
                            out.print("<td>");
                            out.print(dados_d.getString("pagamento")); 
                            out.print("</td>");

                            out.print("<td>");
                            out.print(dados_d.getString("id_doacao")); 
                            out.print("</td>");
                            out.print("</tr>");
                        }

                        out.print("</table>");

            %>
        </div>
    </div>

    <div class="logo">
        <a href="./pagina_inicial.html">
            <img src="https://recantodosavos.org.br/wp-content/uploads/2021/04/logo-correto.png" alt="logo do site">
        </a>
    </div>
</body>