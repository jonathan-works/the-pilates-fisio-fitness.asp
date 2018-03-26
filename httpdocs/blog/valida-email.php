<?php
require_once("phpmailer/class.phpmailer.php");
$erro = false;
if(!empty($_POST)) {
    if(isset($_POST['nome'])) $nome = $_POST['nome'];
    if(isset($_POST['email'])) $email = $_POST['email'];

    $conn = new mysqli("172.16.1.17", "thepilates3", "wsws8443", "thepilates3");

    if ($conn->connect_error) {
        //die("Falha na conexão: " . $conn->connect_error);
        $erro = true;
    }

    $sql = "INSERT INTO base_ebook(nome, email) VALUES('{$nome}', '{$email}')";

    if (!$conn->query($sql) === TRUE) {
        $erro = true;
    }
    $conn->close();

    $mail = new PHPMailer(true);
 
    $mail->IsSMTP(); // Define que a mensagem será SMTP

    $mail->Host = 'mail.thepilatesfisiofitness.com.br'; // Endereço do servidor 
    $mail->SMTPAuth   = true;
    $mail->Port       = 587; //  Usar 587 porta SMTP
    $mail->Username = 'envio_blog@thepilatesfisiofitness.com.br'; // Usuário do 
    $mail->Password = 'wsws8443';
 
    $mail->SetFrom('envio_blog@thepilatesfisiofitness.com.br', 'Lista E-book'); 
    $mail->AddReplyTo($_POST['email'], $_POST['nome']); //Seu e-mail
    $mail->Subject = "Cadastro E-book";//Assunto do e-mail
  
    $mail->AddAddress('blogpilates@thepilatesfisiofitness.com.br', 'Junior');
 
    $msg = "Um cliente se cadastou para baixar o E-book: <br/> Nome: " . $_POST['nome'] . "<br/> Email: " . $_POST['email'];
    //Define o corpo do email
    $mail->MsgHTML($msg); 
  
    $mail->Send();
} else $erro = true;

if(!$erro) {
    header("Location: http://www.thepilatesfisiofitness.com.br/blog/e-book-de-pilates-baixar/");
} else {
    echo "<script>alert('Houve um erro ao redirecionar para o ebook, tente novamente.'); window.location = 'http://www.thepilatesfisiofitness.com.br/blog/e-book-de-pilates/';</script>";
}


