<%
//variáveis para acessar o banco
            String banco = "cadastro";
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

            String sql = "SELECT * FROM cadastro ORDER BY nome";

            //Criar o statement para executar o comando
            PreparedStatement stm = conexao.prepareStatement( sql );

            ResultSet dados = stm.executeQuery();

            out.print("<table border=1>");
            out.print("<tr>");
            out.print("<th>Codigo</th>");  
            out.print("<th>Nome</th>");  
            out.print("<th>Idade</th>");  
            out.print("<th>Email</th>");  
            out.print("</tr>");

            while( dados.next() ){
                out.print("<tr>");
                    out.print("<td>");
                    out.print(dados.getString("codigo")); 
                    out.print("</td>");
                   
                    out.print("<td>");
                    out.print(dados.getString("nome")); 
                    out.print("</td>");
                   
                    out.print("<td>");
                    out.print(dados.getString("idade")); 
                    out.print("</td>");
                   
                    out.print("<td>");
                    out.print(dados.getString("email")); 
                    out.print("</td>");
                out.print("</tr>");    
            }

            out.print("</table>");
        %>