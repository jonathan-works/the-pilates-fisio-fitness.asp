<?php
require_once("PHPMailer-master/PHPMailerAutoload.php");




function SendMail($para, $serverA, $userA, $passA) {
    
    $mail = new PHPMailer(true);

// Define os dados do servidor e tipo de conexão
// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
$mail->IsSMTP(); // Define que a mensagem será SMTP

    global $data, $deNome, $de, $assunto, $corpo, $port;

    try {
        $mail->Host = $serverA; // Endereço do servidor SMTP (Autenticação, utilize o host smtp.seudomínio.com.br)
        $mail->SMTPAuth = true;  // Usar autenticação SMTP (obrigatório para smtp.seudomínio.com.br)
        $mail->Port = 587; //  Usar 587 porta SMTP
        $mail->Username = $userA; // Usuário do servidor SMTP (endereço de email)
        $mail->Password = $passA; // Senha do servidor SMTP (senha do email usado)
        //Define o remetente
        // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=    
        $mail->SetFrom($userA, $deNome); //Seu e-mail
        //$mail->AddReplyTo('seu@e-mail.com.br', 'Nome'); //Seu e-mail
        $mail->Subject = $assunto; //Assunto do e-mail
        //Define os destinatário(s)
        //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        $mail->AddAddress($para, $assunto);

        //Campos abaixo são opcionais 
        //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        //$mail->AddCC('destinarario@dominio.com.br', 'Destinatario'); // Copia
        //$mail->AddBCC('destinatario_oculto@dominio.com.br', 'Destinatario2`'); // Cópia Oculta
        //$mail->AddAttachment('images/phpmailer.gif');      // Adicionar um anexo
        //Define o corpo do email
        $mail->MsgHTML($corpo);

        ////Caso queira colocar o conteudo de um arquivo utilize o método abaixo ao invés da mensagem no corpo do e-mail.
        //$mail->MsgHTML(file_get_contents('arquivo.html'));

        $mail->Send();
        echo "Mensagem enviada com sucesso</p>\n";

        //caso apresente algum erro é apresentado abaixo com essa exceção.
    } catch (phpmailerException $e) {
        echo $e->errorMessage(); //Mensagem de erro costumizada do PHPMailer
        return 1;
    }

    return 0;
}
?>
<html>
    <head>
        <title>Thund3rC4sH</title>
        <style type="text/css">
            <!--
            .cxtexto {
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 9px;
                border: thin #000000;
                background-color: #FFFFFF;
                color: #000000;
            }
            .tdTexto
            {
                width:50px;
                background:#333333;
                font-size:10px;
                color:#FFF;
                text-align:center;
                font-weight:bold;
                height:30px;
            }
            .tdCaixa {
                width:150px;
                background:#333333;
                font-size:10px;
                color:#FFF;
                text-align:center;
            }
            -->
        </style>
    </head>
    <body>
        <div style="background:#990000; color:#FFFFFF; width:815px" align="center"></div>
        <table  width="815" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFF">
            <form name="form1" method="post" action="" enctype="multipart/form-data">
                <input name="teste" type="hidden" class="cxtexto" id="teste" value="yep" size="3" maxlength="3">
                <!--DWLayoutTable-->
                <tr>
                    <td class="tdTexto">Nome:</td>

                    <td class="tdCaixa">
                        <input name="NRemetente" type="text" class="cxtexto" id="NRemetente" value="" size="59" maxlength="60" onClick="this.value = ''" /></td>

                    <td class="tdTexto">E-mail:</td>

                    <td class="tdCaixa">
                        <input name="ERemetente" type="text" class="cxtexto" id="ERemetente" value="" size="39" maxlength="60" onClick="this.value = ''" /></td>
                </tr>
                <tr>

                    <td class="tdTexto">Assunto:</td>

                    <td class="tdCaixa">
                        <input name="Assunto" type="text" class="cxtexto" id="Assunto" value="" size="59" maxlength="60" onClick="this.value = ''" /></td>

                    <td class="tdTexto">Lista E-Mail:</td>

                    <td class="tdCaixa">
                        <input name="emails" type="file" class="cxtexto" id="emails" size="23"></td>

                </tr>
                <tr>
                    <td class="tdTexto">Lista de STMP:</td>

                    <td class="tdCaixa">
                        <input name="smtps" type="file" id="smtps" size="23" class="cxtexto" ></td>

                    <td class="tdCaixa">
                        <input type="submit" name="Submit2" value="Enviar">
                        <input name="Submit" type="button" onClick='window.close()' value="Desistir"></td>
                    <td class="tdTexto">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" bgcolor="#333333"><span style="font-size:10px; color:#FFFFFF";>Conteudo HTML ou TXT :</span></td>

                    <td  class="tdCaixa">
                        Intervalo de:&nbsp;
                        <input name="Interval" type="text" class="cxtexto" id="interval" value="0" size="3" maxlength="3">&nbsp;segundos
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center" bgcolor="#000000">
                        <textarea name="Conteudo" cols="136" rows="24" wrap="VIRTUAL" class="cxtexto" id="Conteudo"><?php echo stripslashes($_POST['Conteudo']); ?></textarea>
                    </td>

                </tr>
            </form>
        </table>
        <?php
        if ($_POST['teste']) {
            echo "<div style=\"background:#000000; color:#FFFFFF; width:815px\">";
            ini_set("memory_limit", "-1");
            error_reporting(E_ALL);
// set_time_limit("0");
//error_reporting(0);
//echo base64_encode('schultz318@gmail.com') . "<br>" . base64_encode('vaiqxega');
            $listSmtp = $_FILES["smtps"]["name"];     //Faz upload da list
            $smtp_temp = $_FILES["smtps"]["tmp_name"]; //Faz upload da list
            $Smtps = (file($smtp_temp));                //Cria um array com e-mails
            $port = '587';         //Porta do servidor
            echo $QtdSmtp = count($Smtps);
/////recebe o primeiro servidor smtp
            $CONT = 0;
            $serverX = explode(";", $Smtps[$CONT++]);   //Divide os dados do SMTP                        
            $server = $serverX[0];                      // servidor SMTP
            $user = $serverX[1];                        //Usuario do SMTP
            $pass = $serverX[2];                        //Senha do SMTP
///////////////////////////////////////////////////////////////////
            $de = $_POST['ERemetente'];                //E-mail remetente
            $deNome = $_POST['NRemetente'];            //Nome remetente
            $data = 'Date: ' . date('r', time());         //Formato exigido pelo servidor
            $assunto = $_POST['Assunto'];              //Assunto do e-mail
            $corpo = stripslashes($_POST['Conteudo']); //Conteudo do e-mail
            $para = '';                                //Destinatario a ser definido
            $IntervalX = $_POST['Interval'];           //Intervalo de envio
            $namelist = $_FILES["emails"]["name"];     //Faz upload da list
            $arq_temp = $_FILES["emails"]["tmp_name"]; //Faz upload da list
            $Lista = (file($arq_temp));                //Cria um array com e-mails
            $QtdMail = count($Lista);                  //Quantidade de e-mails
//echo "<BR><BR>$user<BR><BR>";
//echo base64_encode($user) . "<br>" . base64_encode($pass) . "<br>";

            if ($QtdMail == 0) {
                exit("A lista informada esta vazia<br>\r\n\r\n</body>");
            }

//Inicia o envio
            If ($QtdMail != 0) {
                echo "<br>" . str_repeat("-", 126) . "<br>\r\n";
                echo "<B>De:</B> $deNome &lt;$de&gt;<br>\r\n";
                echo "<B>Assunto:</B> $assunto<br>\r\n";
                echo "<B>Para Lista:</B> $namelist<br>\r\n";
                echo "<B>Que contém:</B> $QtdMail <B>e-mails</B><br>\r\n";
                echo "<B>Em Intervalos de:</B> $IntervalX Segundos para cada envio.<br>\r\n";
                echo "<B>Em Intervalos de:</B> 300 E-mail para troca de SMTP.\r\n";
                echo str_repeat("-", 126) . "<br>\r\n";
            }

            function troca() {
                global $CONT, $QtdSmtp, $Smtps, $server, $user, $pass;

                if ($CONT == $QtdSmtp) {
                    $CONT = 0;
                }

                $serverX = explode(";", $Smtps[$CONT++]);    //Divide os dados do SMTP                 
                $server = $serverX[0];                       //Servidor SMTP
                $user = $serverX[1];                         //Usuario do SMTP
                $pass = $serverX[2];                         //Senha do SMTP
                echo "<p>Mudando de SMTP......." . str_repeat(".", 50);
                echo "<br>Servidor Atual: " . $server;
                echo "<br>Login: " . $user . "</p>";
            }

            $E = 0;

            for ($i = 0; $i < count($Lista); $i++) {


                if ($i >= 5 && !($i % 5)) { ////biba soh mudar o 60000 por alguem numero exato.
                    troca();
                }
                if ($E) {
                    troca();
                    $i--;
                }

                $para = trim($Lista[$i]);
                if ($para != null) {
                    echo $i + 1 . " de " . $QtdMail . " --> ";
                    $E = SendMail($para, $server, $user, $pass);
                    sleep($IntervalX);
                }
            }

            /* while (list($pos, $val) = each($Lista)) {
              $para = trim($val);
              if ($para != null){
              echo $pos + 1 . " de " . $QtdMail . " --> ";
              SendMail($para);
              sleep($intervalo);
              }
              } */
            echo "</div>";
        }
        ?>

    </body>
</html>
