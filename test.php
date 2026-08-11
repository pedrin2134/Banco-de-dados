<?php

require_once "conexzo.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nome = $_POST["nome"];
    $email = $_POST["email"];
    $senha = $_POST["senha"];
    $perfil_id = $_POST["perfil_id"];

    $pdo = Conexao::getConexao();

    $sql = "INSERT INTO login (nome, email, senha, perfil_id)
            VALUES (:nome, :email, :senha, :perfil_id)";

    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        ":nome" => $nome,
        ":email" => $email,
        ":senha" => $senha,
        ":perfil_id" => $perfil_id
    ]);

     header("Location: ola.php");
        exit;

   
}

?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
</head>

<body>

    <h1>Cadastro</h1>

    <form method="POST">

        <label>Nome:</label>
        <input type="text" name="nome">

        <br><br>

        <label>Email:</label>
        <input type="email" name="email">

        <br><br>

        <label>Senha:</label>
        <input type="password" name="senha">

        <br><br>

        <label for="perfil_id">Perfil</label>

<select id="perfil_id" name="perfil_id" required>

    <option value="">-- Selecione o perfil --</option>

    <option value="1">Administrador</option>

    <option value="2">Cliente</option>

</select>

        <button type="submit">Cadastrar</button>

    </form>

</body>

</html>