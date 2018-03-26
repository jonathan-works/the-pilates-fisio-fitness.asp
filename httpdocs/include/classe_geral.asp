<%

'----------------------------------------------------------
'---------------------VERIFICA BANCO BOLETO----------------
'----------------------------------------------------------
Function verificaBancoBoleto(Boleto, linkBoletoConfig)
Dim link_boleto

for x = 0 to ubound(Boleto)
			if Boleto(x) then
				link_boleto = linkBoletoConfig(x) &session("Cod_Venda_recibo")&".htm"
			end if
		next
		
		verificaBancoBoleto = link_boleto
End Function

'-----------------------------------------------------------

function ExibirDerivacaoPreco(cod_produto,preco)
	dim strsql, rs
	strsql="select * from V_Produto_Derivacao where cod_produto = "& cod_produto &" and preco = '"&replace(preco,",",".")&"'"
	set rs=cn.execute(strsql)
	if not rs.eof then
		ExibirDerivacaoPreco = rs("descricao")
	end if
end function

Sub RedirecionamentoDominio()
	dim URL_Redirect
	URL_Redirect = Request.ServerVariables("SERVER_NAME") 
	
	dim PAGINA_Redirect
	PAGINA_Redirect = request.ServerVariables("HTTP_X_REWRITE_URL")
	
	dim URL_completa_redir
	URL_completa_redir = replace(URL_completa,"loja/","")
	
	'HTTP_X_REWRITE_URL
	'pagina_corrente = "Produtos" or 
	IF pagina_corrente = "Produtos" or pagina_corrente = "Destaques" then
		
		'response.Write(replace(replace(replace(URL_completa,"loja/",""),"http://www.",""),".br/",".br"))
		'response.End()
		'response.Write(URL_Redirect)
		'response.End()
		Select Case URL_Redirect 
		Case replace(replace(URL_completa_redir,"http://www.",""),".br/",".br")
			if PAGINA_Redirect = "" then
				   Response.Status="301 Moved Permanently" 
				   Response.AddHeader "Location", URL_completa_redir 
			else
				   Response.Status="301 Moved Permanently" 
				   Response.AddHeader "Location", replace(URL_completa_redir,".br/",".br") & PAGINA_Redirect
			end if
		Case replace(replace(URL_completa_redir,"http://www.",""),".br/","")
			if PAGINA_Redirect = "" then
				   Response.Status="301 Moved Permanently" 
				   Response.AddHeader "Location", URL_completa_redir
			else
				   Response.Status="301 Moved Permanently" 
				   Response.AddHeader "Location", replace(URL_completa_redir,".br/",".br") & PAGINA_Redirect
			end if
		Case replace(replace(URL_completa_redir,".br/",""),"http://","")
			if PAGINA_Redirect = "" then
				   Response.Status="301 Moved Permanently" 
				   Response.AddHeader "Location", URL_completa_redir
			else
				   Response.Status="301 Moved Permanently" 
				   Response.AddHeader "Location", replace(URL_completa_redir,".br/",".br") & PAGINA_Redirect
			end if
		End Select
	end if
End Sub

Function gerarCookieCadastro()
	Response.Cookies(nome_loja).Expires = dateadd("D",dias_cookie_popup,now())
	Response.Cookies(nome_loja)("CADASTRO_EFETIVADO_NOVO") = 1
End Function

function montarDescricaoProduto(descricao,derivacao1,derivacao2)
	if derivacao1 <> "Sem Derivacao" then
		montarDescricaoProduto = descricao & " - " & derivacao1
	end if
	if derivacao2 <> "Sem Derivacao" then
		montarDescricaoProduto = descricao & " - " & derivacao2
	end if
	if derivacao1 <> "Sem Derivacao" and derivacao2 <> "Sem Derivacao" then
		montarDescricaoProduto = descricao & " - " & derivacao1  & " - " & derivacao2
	end if
end function   

function exibirDerivacao(cod_produto,cod_produtocombinacao)
	dim rs, strsql
	strsql="select derivacao from [dbo].[V_Combinacao_Produto_Derivacao] where cod_produto = "& cod_produto &" and Cod_ProdutoCombinacao = "& cod_produtocombinacao &" and derivacao <> 'sem derivação' order by Categoria_derivacao"
	set rs=cn.execute(strsql)
	Do While not rs.eof
		if rs("derivacao") <> "Sem Classificação" then
			if exibirDerivacao = "" then
				exibirDerivacao = rs("derivacao")
			else
				exibirDerivacao = exibirDerivacao & " - " & rs("derivacao")
			end if
		end if
	rs.movenext
	Loop
end function

function TratarTexto(var)
	dim saida
	if var <> "" then
		saida = replace(var,chr(10),"<br>")	
		saida = replace(saida,chr(13),"")	
		saida = replace(saida,"<br />","")	
		'if inStr(saida,chr(10)) then
		'saida = replace(var,"&bull;","<br>&bull;")	
		'end if
		saida = replace(saida,"<p>","")
		saida = replace(saida,"</p>","")
		'saida = replace(saida,"<br /><br>","<br>")
		saida = trim(saida)
		
		if InStr(1,saida,"<") = 1 or InStr(1,saida,"<") = 2 then saida = mid(saida,6,len(saida))
		
		if InStr(1,saida,"<") = 4 then saida = mid(saida,8,len(saida))
		
		TratarTexto = saida
	end if

	dim x
	'for x = 1 to len(var)
		'response.Write("x: " & x)
		'response.Write("<br>")
		'response.Write("letra: " & mid(var,x,1))
		'response.Write("<br>")
		'response.Write("asc: " & asc(mid(var,x,1)))
		'response.Write("<br>")
	'next
End Function

'função para pegar uma palavra e trocar a primeira letra pela versão maiúscula
Function trocarprimeirocaracterM(palavra)

If palavra <> "" then
	Dim letra
	letra = Ucase(left(palavra,1))
	palavra = right(palavra,(len(palavra)-1))
	trocarprimeirocaracterM = letra & palavra
end if

end function

function selecionarImagem(rs)
	dim rs2,foto_produto, strsql
	
	'if not isnull(rs("cod_derivacao")) then					
	strsql="select imagem from produto_combinacao where cod_produto = " & rs("cod_produto") & " and imagem is not null and imagem <> '' and qtde > 0 and preco = '"& replace(rs("preco"),",",".") &"' "& completaSTRSQLPromocao() 
	set rs2=cn.execute(strsql)
	'else
	'response.Write(strsql)
	'end if
	if rs2.eof then
		strsql="select imagem from produto_combinacao where cod_produto = " & rs("cod_produto") & " and imagem is not null and imagem <> '' and qtde > 0 and preco = '"& replace(rs("preco"),",",".") &"'"
		set rs2=cn.execute(strsql)
	end if
	
	if not rs2.eof then
		foto_produto = rs2("imagem")
	else
		foto_produto = "indisp.jpg"
	end if
	selecionarImagem = foto_produto
end function




'SELECIONA AÇÃO DE DESCONTO A SER ENVIADA NO EMAIL DE CADASTRO
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Sub seleciona_acao_cupom(codigo_acao_desconto_config,email,nome)

if codigo_acao_desconto_config<>0 then

		call Proc_EnviarEmailCupom2(from_email,email,nome,codigo_acao_desconto_config)

end if

End sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''







Sub Proc_CadastrarMail(ip,email,nome)
Dim cmd,cadastro_retorno',from_email

'from_email="atendimento@ecomart.com.br"

Set cmd = Server.CreateObject("ADODB.Command")

	Set cmd.ActiveConnection = cn
	cmd.CommandText = "PROC_CadastrarMailing"
	cmd.CommandType = 4
	cmd.Parameters.Refresh
	
	'if nome = "Nome" then
		'nome = null
	'end if	
	
	cmd.Parameters("@ip") = ip
	cmd.Parameters("@email") = email
	cmd.Parameters("@nome") = nome
	'cmd.Parameters("@nome") = data
	'cmd.Parameters("@desconto") = desconto

	cmd.Execute
	
	'retorna o codigo do login, se =1 OK, se =0 NOK

	cadastro_retorno = cmd.Parameters.Item("@retorno")
	
	if cadastro_retorno <> 0 then
		if pagina_corrente <> "Indique Ecovacs" Then
			response.Write("<script>alert('Seu e-mail foi cadastrado com sucesso! Boas Compras!')</script>")
		end if
		if request.Form("email") <> "" then
			call seleciona_acao_cupom(codigo_acao_desconto_config,email,nome)
			
			'Proc_EnviarEmailCupom2 FROM_Email,request.Form("news_text"),request.Form("Nome"),1 'ENVIA O EMAIL AQUI TAMBÉM
		end if
	else
		if pagina_corrente <> "Indique Ecovacs" then
			response.Write("<script>alert('Esse Email já existe!')</script>")	
		end if
	end if
	'response.Write("333:"&request.Form("url_action_cadastro"))
	if request.Form("url_action_cadastro") <> "" then
		response.Write("<script>window.open('"& request.Form("url_action_cadastro") &"','_self');</script>")	
	end if
	
	'call Proc_EnviarEmailCupom2(from_email,email,nome,1)
	'call seleciona_acao_cupom(0)
	
End sub



SUB Proc_EnviarEmailCupom2(FROM,to_email,nome,cod_acao)
	dim rs, linha1, linha2,email_cced_Subject
	
	email_cced_Subject="Você realizou seu cadastro com sucesso"
	
	set rs = cn.execute("SELECT * FROM v_acao_cupom WHERE cod_acao = " & cod_acao & " AND data_envio is null ")
	
	
	linha1 = "Parabéns <strong>" & nome & "</strong>! <br /> <br />" & _
	"Você realizou seu cadastro com sucesso, a partir de agora receberá por e-mail nossas novidades, dicas e promoções. <br />	<br />"
		
		if (cint(rs("Valor"))=0) then
			linha1 = linha1 & "Para obter o <strong>desconto de " & rs("Percentual") & "%</strong> em sua primeira compra, deverá digitar o código abaixo no campo do cupom de desconto no <strong>carrinho de compras</strong>. <br />"
		else
			linha1 = linha1 & "Para obter o <strong>desconto de "& FormatCurrency(rs("Valor")) & "</strong> em sua primeira compra, deverá digitar o código abaixo no campo do cupom de desconto no <strong>carrinho de compras</strong>. <br />"
		end if
		
		linha1 = linha1 & "<strong>Código promocional: </strong>" & Replace(rs("Cupom")," ","") & "<br />"
		
		linha1 = linha1 & "<strong>Cupom válido para 7 dias.</strong><br />"'"<strong>Data Validade do Cupom: </strong>" & formatdatetime(rs("data_validade"),2) & "<br />"
		
		dim verifica
		verifica = false
		if(not isNull(rs("Secao"))) then
			linha1 = linha1 & "<br/>Pode-se usar o cupom nas seguintes opções abaixo:<br/>"
			linha1 = linha1 & "Na seção de bolsas: <b>" & rs("Secao")& "</b><br/>"
			verifica = true
		end if
		
		if(not isNull(rs("Categoria"))) then
			if verifica = false then
				linha1 = linha1 & "<br/>Pode-se usar o cupom nas seguintes opções abaixo:<br/>"
				verifica = true
			end if
			linha1 = linha1 & "Na categoria: <b>" & rs("Categoria")& "</b><br/>"
		end if	
		
		if(not isNull(rs("Produto"))) then
			if verifica = false then
				linha1 = linha1 & "<br/>Pode-se usar o cupom nas seguintes opções abaixo:<br/>"
				verifica = true
			end if
			linha1 = linha1 & "No produto: <b>" & rs("Produto")& "</b><br/>"
		end if
		
		if formatnumber(rs("valor_minimo"),2) > 0.00 then
			if verifica = false then
				linha1 = linha1 & "<br/>Pode-se usar o cupom nas seguintes opções abaixo:<br/>"
				verifica = true
			end if
			linha1 = linha1 & " Compras acima de : <b> " & FormatCurrency(rs("valor_minimo")) & "</b><br/>"
		end if
			 
	call EnviarEmailPadraoLocal("",linha1,linha2,From_Email,to_email,email_cced_Subject)
	
	cn.execute("update cupom_desconto set data_envio = getdate() where cod_cupom = " & rs("cod_cupom"))
	
END SUB






Sub montarderivacaoProduto(cod_produto)
dim strsql, rs
%>
	<select name="cod_derivacao" id="cod_derivacao">
    <%
    strsql = "Select derivacao.cod_derivacao, derivacao.descricao from derivacao inner join produto_derivacao on produto_derivacao.cod_produto = "& cod_produto & " and produto_derivacao.cod_derivacao = derivacao.cod_derivacao order by descricao"
    set rs=cn.execute(strsql)
    Do While not rs.eof
    %>
    	<option value="<%= rs("cod_derivacao") %>"><%= rs("descricao") %></option>
    <%
    rs.movenext
    Loop
    %>
    </select>
<%
End Sub

Sub PROC_NavegacaoVMax(pg)
	dim PagAtual, TotalPages,max_n_mostrados, inicio, final, intervalo, i
	PagAtual = cint(pag)
	TotalPages = Consulta.pagecount
	
	Response.Write("<font color='black' face='Arial' size='1'><B><strong> P&aacute;gina " & PagAtual & " de " & TotalPages & " </strong></B></font> - ") 
	
	If PagAtual > 1 THEN 
%>

        <B><font color= '#660066 ' size= '1 ' face= 'Arial '>
        <a class="red"  href='<%= pg & "&pagina=1" %>'>Primeira</a></font></B> | 
                
        <B><font color= '#660066 ' size= '1 ' face= 'Arial '>
        <a class="red" href='<%= pg & "pagina=" & PagAtual-1 %>'>Anterior</a></font></B>

        |
        <%
	Else
%>
        <B><font color= '#EEEEEE ' size= '1 ' face= 'Arial'>Primeira</font></B>
        <B><font color= '#CCCCCC ' size= '1 ' face= 'Arial'>Anterior</font></B>
<%
	End If
	
	'------------------- numero -------------------------
	'---------- Numero de numeros para ser mostrados ----
	max_n_mostrados = 7
	
	intervalo = Int(max_n_mostrados /2)
	inicio = PagAtual - intervalo
	final = PagAtual + intervalo
	
	If CInt(inicio) <1 Then 
		inicio = 1
		final = max_n_mostrados
	END IF
	
	If CInt(final) > CInt(TotalPages) Then final = TotalPages
	
	For i = inicio To final
		If CInt(i)=CInt(PagAtual) Then
			%>
            <font color= '#660066 ' size= '2 ' face= 'Arial '>[ <B><%= i %></B> ]</font>
<%
		End If
		
		If CInt(i) < CInt(PagAtual) Then
			%>
            <b><a class="preto" href='<%= pg &"&pagina=" & i %>'><%=  i %></a></b>
<%
		End If
		
		If CInt(i) > CInt(PagAtual) Then
			%>
             <b><a class="preto"  href='<%= pg &"&pagina=" & i %>'><%=  i %></a> </b>
<%
		End If
	Next
	
	'------------------------------------------------------
	
	IF CInt(PagAtual) <> CInt(TotalPages) THEN 
		'Se estiver na Última página, mostra apenas o botão Anterior e Primeira
			%>
|            <B><font color= '#660066 ' size= '1 ' face= 'Arial '>
<a class="red"  href='<%= pg &"&pagina=" & PagAtual + 1 %>'>Pr&oacute;xima</a></font></B> | 
			<B><font color= '#660066 ' size= '1 ' face= 'Arial '>
			<a class="red"  href='<%= pg &"&pagina=" & TotalPages  %>'>Ultima</a></font></B>
            <%
	Else
			%>
            <B><font color= '#CCCCCC ' size= '1 ' face= 'Arial '>Pr&oacute;xima</font></B>
			<B><font color= '#EEEEEE ' size= '1 ' face= 'Arial '>Ultima</font></B>
            <%
	End If 

End Sub



'-------------------------------------------------------------------------------
'----------  Função para evnio de e-mail
'-------------------------------------------------------------------------------

SUB Proc_Email_Local_Texto(FROM,to_email,Subject,TextBody)

	Dim objCDOSYSMail, objCDOSYSCon
	'cria o objeto para o envio de e-mail
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
	'cria o objeto para configuração do SMTP
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
	'SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
	'porta do SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
	'porta do CDO
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	'timeout
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
	objCDOSYSCon.Fields.update
	'atualiza a configuração do CDOSYS para o envio do e-mail
	Set objCDOSYSMail.Configuration = objCDOSYSCon
	'e-mail do remetente
	objCDOSYSMail.From = From_Email
	'e-mail do destinatário
	
	objCDOSYSMail.To = to_email
	objCDOSYSMail.ReplyTo = FROM
	
	objCDOSYSMail.Subject = Subject
	'conteúdo da mensagem
	objCDOSYSMail.TextBody = TextBody
	'para envio da mensagem no formato html altere o TextBody para HtmlBody
	'envia o e-mail
	objCDOSYSMail.Send
	'destrói os objetos
	Set objCDOSYSMail = Nothing
	Set objCDOSYSCon = Nothing

END SUB
'-------------------------------------------------------------------------------
'----------  Função para evnio de e-mail
'-------------------------------------------------------------------------------


'-------------------------------------------------------------------------------
'----------  Função para devolver o valor em htmlencode para o Ajax não ter problemas de acentuação
'-------------------------------------------------------------------------------
Function retornaValorXML(valor)
	if not isnull(valor) and valor <> "" Then
		retornaValorXML = server.HTMLEncode(valor)
	else
		retornaValorXML = "-"
	end if
End Function
'-------------------------------------------------------------------------------
'----------  Função para devolver o valor em htmlencode para o Ajax não ter problemas de acentuação
'-------------------------------------------------------------------------------


'-------------------------------------------------------------------------------
'-----------  Procedure para montar combos
'-------------------------------------------------------------------------------
Sub Proc_listacombocodigo(strsql,valor,campo,codigo)
	dim combo, rscombo
	set rscombo = cn.execute(strsql)
	
		Do While not rscombo.eof
		   combo = "<option value='" & rscombo(valor) & "'"  
		   If IsNumeric(codigo) Then codigo=Int(codigo) End If
		   If codigo = rscombo(valor) Then 
				combo = combo & " selected" 
		   End If
		   combo = combo &" >"& rscombo(campo) &"</option>"
		   response.Write(combo)
		rscombo.movenext
		Loop
				   
	set rscombo=nothing
End Sub
'-------------------------------------------------------------------------------
'-----------  Procedure para montar combos
'-------------------------------------------------------------------------------

Sub Proc_listacombocodigoAjax(strsql,valor,campo,codigo)
	dim combo, rscombo
	set rscombo = cn.execute(strsql)
	
		Do While not rscombo.eof
		   combo = "<option value='" & rscombo(valor) & "'"  
		   If IsNumeric(codigo) Then codigo=Int(codigo) End If
		   If codigo = rscombo(valor) Then 
				combo = combo & " selected" 
		   End If
		   combo = combo &" >"& server.HTMLEncode(rscombo(campo)) &"</option>"
		   response.Write(combo)
		rscombo.movenext
		Loop
				   
	set rscombo=nothing
End Sub

'-------------------------------------------------------------------------------
'----------  Função para retirar todos caracteres que não sejam números
'-------------------------------------------------------------------------------
Function RetornaNumero(valor)
    
    Dim tamString, i, caracterVez, caracterAcum
	
	tamString = Len(valor)

    For i=1 To tamString
        caracterVez = Mid(valor, i, 1)
        If IsNumeric(caracterVez) Then
            caracterAcum = caracterAcum & caracterVez
        End If
    Next

    RetornaNumero = caracterAcum

End Function
'-------------------------------------------------------------------------------
'----------  Função para retirar todos caracteres que não sejam números
'-------------------------------------------------------------------------------


'-------------------------------------------------------------------------------
'----------  Função para limpar string
'-------------------------------------------------------------------------------
Function LimpaString(valor)
    
    valor = Trim(valor) ' Retira espaços no inicio e fim
    valor = Replace(valor,"'","") ' Retira aspa simples
    valor = Replace(valor,"&","") ' Retira &
    valor = Replace(valor,"""","") ' Retira aspa dupla

    LimpaString = valor

End Function
'-------------------------------------------------------------------------------
'----------  Função para limpar string
'-------------------------------------------------------------------------------


'-------------------------------------------------------------------------------
'----------  Procedure para recuperar as informações de cadastro dos correios
'-------------------------------------------------------------------------------
Sub Encontra_Endereco(CEP_str)
 
	Dim CEP_obj

    ' Retira caracteres se houver
    CEP_str = RetornaNumero(CEP_str)

    Set CEP_obj = CreateObject("Correios.CEP")
	
    CEP_obj.EncontraCEP(CEP_str)

    If CEP_obj.Erro = 0 Then

        logradouro    = LimpaString(CEP_obj.Endereco)
        bairro        = LimpaString(CEP_obj.Bairro)
        cidade        = LimpaString(CEP_obj.Cidade)
        estado        = CEP_obj.Estado
        cep           = cep_str
     Else
        logradouro    = ""
        bairro        = ""
        cidade        = ""
        estado        = ""
        cep           = ""
     End If

    Set CEP_obj = Nothing

End Sub
'-------------------------------------------------------------------------------
'----------  Procedure para recuperar as informações de cadastro dos correios
'-------------------------------------------------------------------------------

'-------------------------------------------------------------------------------
'----------  Função para executar o DECODE informações passadas via AJAX
'-------------------------------------------------------------------------------
Function URLDecode(sConvert) 
    Dim aSplit
    Dim sOutput
    Dim I
    If IsNull(sConvert) or sConvert = "" Then
       URLDecode = ""
       Exit Function
    End If
	
    ' convert all pluses to spaces
    sOutput = REPLACE(sConvert, "+", " ")
	
    ' next convert %hexdigits to the character
    aSplit = Split(sOutput, "%")
	
    If IsArray(aSplit) Then
      sOutput = aSplit(0)
      For I = 0 to UBound(aSplit) - 1
        sOutput = sOutput & _
          Chr("&H" & Left(aSplit(i + 1), 2)) &_
          Right(aSplit(i + 1), Len(aSplit(i + 1)) - 2)
      Next
    End If
	
    URLDecode = sOutput
End Function
'-------------------------------------------------------------------------------
'----------  Função para executar o DECODE informações passadas via AJAX
'-------------------------------------------------------------------------------

'-------------------------------------------------------------------------------
'----------  Função para executar a autenticação das páginas restritas
'-------------------------------------------------------------------------------
Sub Verificar_Login()
	If session("login_site") = "" Then 
		response.redirect("cadastro-login.asp")
		session("msn") = "EXPIROU"
	End If
End Sub
'-------------------------------------------------------------------------------
'----------  Função para executar a autenticação das páginas restritas
'-------------------------------------------------------------------------------


SUB Proc_Email_Local(FROM,to_email,Subject,HtmlBody)

	Dim objCDOSYSMail, objCDOSYSCon
	'cria o objeto para o envio de e-mail
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
	'cria o objeto para configuração do SMTP
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
	'SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
	'porta do SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
	'porta do CDO
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	'timeout
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
	objCDOSYSCon.Fields.update
	'atualiza a configuração do CDOSYS para o envio do e-mail
	Set objCDOSYSMail.Configuration = objCDOSYSCon
	'e-mail do remetente
	objCDOSYSMail.From = From_Email
	'e-mail do destinatário
	
	'objCDOSYSMail.bcc = "contato@produtoswoow.com.br;marcelo@ddwb.com.br;henrique@ddwb.com.br"
	objCDOSYSMail.To = to_email
	'response.Write(to_email)
	objCDOSYSMail.ReplyTo = FROM
	
	objCDOSYSMail.Subject = Subject
	'conteúdo da mensagem
	objCDOSYSMail.HtmlBody = HtmlBody
	'para envio da mensagem no formato html altere o TextBody para HtmlBody
	'envia o e-mail
	objCDOSYSMail.Send
	'response.Write(HtmlBody)
	'response.End()
	'destrói os objetos
	Set objCDOSYSMail = Nothing
	Set objCDOSYSCon = Nothing
	
	'response.End()

END SUB
'-------------------------------------------------------------------------------
'----------  Função para evnio de e-mail
'-------------------------------------------------------------------------------

'-------------------------------------------------------------------------------
'----------  SUB para formatar e enviar email - local
'-------------------------------------------------------------------------------
Sub EnviarEmailPadraoLocal(nome,linha1,linha2,FROM,to_email,Subject)
Dim html
html = "<html><table width='90%' border='0' align='center' cellpadding='3' cellspacing='0'><tr><td align='left' valign='top'><img src='"&img_logo_loja&"'></td></tr><tr><td valign='top'><p><font face='verdana' size='2' color='#000000'>"&linha1&"</font></p><p><font face='verdana' size='2' color='#000000'>Em caso de dúvidas entre em contato conosco ou envie email para:<a href='mailto:"&From_Email&"' class='azul'><strong>"&From_Email&"</strong></a>.</font></p></p></td></tr></table></html>"
		
		call Proc_Email_Local(FROM,to_email,Subject,html)
End Sub
'-------------------------------------------------------------------------------
'----------  SUB para formatar e enviar email
'-------------------------------------------------------------------------------

'-------------------------------------------------------------------------------
'----------  SUB para formatar e enviar email
'-------------------------------------------------------------------------------

Sub EnviarEmailPadrao(nome,linha1,linha2,FROM,to_email,Subject)
Dim html
html = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><title>Produtos Woow</title></head><body><table width='700' border='0' cellspacing='0' cellpadding='0'><tr><td bgcolor='#EEEEEE' style='padding:10px;'><table width='680' border='0' cellspacing='0' cellpadding='0'><tr><td width='340'><img src='"& img_logo_loja &"' /></td><td width='340' align='right' valign='middle' style='font-family:Arial, Helvetica, sans-serif; font-size:16px; color:#666; font-weight:bold;'>&nbsp;</td></tr></table></td></tr><tr><td height='200' style='padding:10px; border-top:3px solid #cccccc;  font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666'>"

'if nome <> "" Then
'	html = html & "<p>Olá, "& replace(nome," ","") &"<br /><br />"
'end if

html = html & ""& linha1 &"<br /><br />"& linha2 &"<br /><br />Boas compras!<br /><br /><br /><a href='"& URL_completa &"' style='background:#bbbbbb; line-height:24px; text-align:center; padding:4px; float:left; color:#030; font-weight:bold; text-decoration:none;'>ACESSE AGORA</a></p></td></tr><tr><td bgcolor='#FFFFFF' style=' border-bottom:3px solid #F05923; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666'>Em caso de dúvidas entre em nossa central de atendimento ou envie um email para <a href='mailto:"&From_Email&"' style='font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666;'>"&From_Email&"</a>. <br /><br />"& Nome_Loja &"<br />Departamento de Vendas.<br /><a href='mailto:"&From_Email&"' style='font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666; '>"&From_Email&"</a><br /><a href='"&Replace(url_completa,"/","")&"' title='Acesse "& Nome_Loja &"' target='_blank' style='font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666; '>"& replace(URL_completa,"http://","") &"</a></td></tr></table></body></html>"
	
		call Proc_Email_Local(FROM,to_email,Subject,html)
End Sub
'-------------------------------------------------------------------------------
'----------  SUB para formatar e enviar email
'-------------------------------------------------------------------------------

'-------------------------------------------------------------------------------
'----------  Função para retornar o primeiro nome
'-------------------------------------------------------------------------------
Function F_PrimeiroNome (nome)
	Dim ProcuraString, ProcuraChar, MinhaPos

	ProcuraString = Trim(nome) ' String onde procurar
	ProcuraChar = " " ' Procurar por espaço
	
	MinhaPos = Instr(1, ProcuraString, ProcuraChar, 1)
	If MinhaPos > 0 Then
		F_PrimeiroNome = left(nome,MinhaPos-1)
	else
		F_PrimeiroNome = Nome
	End If
End Function
'-------------------------------------------------------------------------------
'----------  Função para retornar o primeiro nome
'-------------------------------------------------------------------------------


'-------------------------------------------------------------------------------
'----------  Função para contato de E-Mail
'-------------------------------------------------------------------------------

Function TrataDadosEMailAssunto(email_destino,assunto)
Dim campo,topo,stremail,nome,nome_form,inf_form
Dim from_email, from, objMail,to_email,bcc_email
Dim strsql, rs, cod_formContato

from_email=Trim(request.Form("txt1_Email"))
'to_email="cristiano@ddwb.com.br"
'to_email="contato@macsiacessorios.com.br"
to_email= email_destino


stremail="<html> " & _
		"<head> " & _
		"<title>Untitled Document</title> " & _
		"<meta http-equiv=Content-Type content=text/html; charset=iso-8859-1> " & _
		"<style>"&_
		"td { font-family: Verdana, Helvetica, sans-serif; font-size: 10px;  color: #000000}"&_
		"</style>"&_
		"</head> " & _
		"<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0> " & _
		"<table width=600 border=0> " & _
		"  <tr> " & _
		"    <td>" & _
		"<table width=100% border=0 align=center> " 


for each campo in request.Form
	if mid(campo,1,4) = "txt_" or mid(campo,1,5) = "txt1_" then
		nome_form=mid(campo,5,30)
		nome_form=replace(nome_form,"_","")
		inf_form=request.Form(campo)
		inf_form = Replace(inf_form, vbCrLf, "<br>")
'		response.Write("nome_form: " & nome_form & "<br>")
'		response.Write("inf_form: " & inf_form & "<br><br>")
				stremail=stremail&" <tr>  " & _
								  "          <td width=100 bgcolor=f5f5f5>" & nome_form & "</td> " & _
								  "          <td width=400>" & inf_form & "</td> " & _
								  "        </tr> "
	end if
next

stremail=stremail & "      </table> " & _
					"      <p>&nbsp;</p> " & _
					"      </td> " & _
					"  </tr> " & _
					"</table> " & _
					"</body> " & _
					"</html>"
call Proc_Email_Local(from_email,to_email,assunto,stremail)
'Proc_Email from_email,to_email,assunto,stremail,user,pass
'Proc_Email from_email,"cristiano@ddwb.com.br",assunto,stremail
End Function




Function enviarSenhaEmail(email)
	Dim nome_envio,linha1,linha2,FROM,Subject
	
	Dim cmd
	Dim senha_retorno
	Dim nome_retorno
	Dim user, pass
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = cn
	cmd.CommandText = "PROC_RecuperarSenha"
	cmd.CommandType = 4
	cmd.Parameters.Refresh
	cmd.Parameters("@Email") = email
	cmd.Execute
	retorno = cmd.Parameters.Item("@retorno")
	senha_retorno = cmd.Parameters("@Senha_retorno")
	nome_retorno = cmd.Parameters("@nome_retorno")
	Set cmd = nothing	
	
	if retorno = 1 then
		nome_envio = F_PrimeiroNome(nome_retorno)
		linha1 = nome_envio & ",<br><br>Segue abaixo sua senha de acesso conforme solicitado."
		linha2 = "Senha: " &  senha_retorno
		Subject = Nome_Loja & " - Resgate de Senha"
		call EnviarEmailPadrao("",linha1,linha2,From_Email,email,Subject)
	end if 
	enviarSenhaEmail = retorno
End Function


Function RemoveAcentos(ByVal Texto)
    Dim ComAcentos
    Dim SemAcentos
    Dim Resultado
	Dim Cont
    'Conjunto de Caracteres com acentos
    ComAcentos = "ÁÍÓÚÉÄÏÖÜËÀÌÒÙÈÃÕÂÎÔÛÊáíóúéäïöüëàìòùèãõâîôûêÇç"
    'Conjunto de Caracteres sem acentos
    SemAcentos = "AIOUEAIOUEAIOUEAOAIOUEaioueaioueaioueaoaioueCc"
    Cont = 0
    Resultado = Texto
    Do While Cont < Len(ComAcentos)
	Cont = Cont + 1
	Resultado = Replace(Resultado, Mid(ComAcentos, Cont, 1), Mid(SemAcentos, Cont, 1))
    Loop
    RemoveAcentos = Resultado
End Function


Sub Exibir_Menu_Alfabeto()
%>
<table width="90%" border="0">
<tr>
<%
Dim x
for x = 65 to 90
	%>
		<td width="22" onMouseOver="bgColor='B5D1EB'"onMouseOut="bgColor='ffffff'" bgcolor="#FFFFFF"><div align="center" class="style16"><a class="azul" href="<%= request.ServerVariables("SCRIPT_NAME") %>?idc=<%= chr(x) %>"><%= chr(x) %></a></div></td>

	<%
next
%>
</tr>
</table>
<%
End Sub

Sub Exibir_Menu_Alfabeto_Parceiro()
%>
<table width="90%" border="0">
<tr>
<%
Dim x
for x = 65 to 90
	%>
		<td width="22" onMouseOver="bgColor='B5D1EB'"onMouseOut="bgColor='ffffff'" bgcolor="#FFFFFF"><div align="center" class="style16"><a class="azul" href="<%= request.ServerVariables("SCRIPT_NAME") %>?idc=<%= chr(x) %>&id=<%= cod_oferta %>"><%= chr(x) %></a></div></td>
	<%
next
%>
</tr>
</table>
<%
End Sub



Function RemoveHTMLTags(ByVal strHTML)
    Dim objER
    Dim strTexto

    'Configurando o objeto de Expressão Regular
    Set objER            = New RegExp 
    objER.IgnoreCase    = True
    objER.Global        = True
    objER.Pattern        = "<[^>]*>"
    
    'Substituindo as tags encontradas pela expressão
    strTexto            = strHTML
    strTexto            = objER.Replace(strTexto, "")
    
    Set objER            = Nothing

    'Retornando a função
    RemoveHTMLTags = strTexto
End Function

Function FormataDataDoisDigitos(Data)
   If Data <> "" Then FormataDataDoisDigitos = Right("0" & DatePart("d", Data),2) & "/" & Right("0" & DatePart("m", Data),2) & "/" & DatePart("yyyy", Data)
End Function

Function FormataDataAmericano(Data)
	Dim dia,mes,ano
	dia = DatePart("d", Data)
	mes = DatePart("m", Data)
	ano = DatePart("yyyy", Data)
	FormataDataAmericano = ano  &"/" & mes & "/" & dia
End Function

Function PROC_CadastrarEmailCidade(Email,cod_cidade)
	Dim cmd, erro, ID_Link, retorno
	Set cmd = Server.CreateObject("ADODB.Command")
	
	if cod_cidade = "" then cod_cidade = 108366
	'response.Write(email)
	Set cmd.ActiveConnection = cn
	cmd.CommandText = "PROC_CadastrarMailingCodCidade"
	cmd.CommandType = 4
	cmd.Parameters.Refresh
	
	cmd.Parameters("@email") = Email
	cmd.Parameters("@cod_cidade") = cod_cidade
	cmd.Execute
	'retorna o codigo do login, se =1 OK, se =0 NOK
	retorno = cmd.Parameters.Item("@Retorno")
	
	if retorno = 1 then
		PROC_CadastrarEmailCidade = true
	else
		PROC_CadastrarEmailCidade = false
	end if	
End Function

Sub montar_navegacao(cod_categoria,cod_subcategoria)
	Dim strsql, rs
	if cod_categoria <> "" then
		strsql="select cod_categoria, descricao from categoria where cod_categoria = " & cod_categoria
		set rs=cn.execute(strsql)
		if not rs.eof then
			%>
            	<img src="img/seta-branca.png" width="6" height="8" border="0" /> <span class="fonte-branca-16"> <a class="branco" href="produto-listagem.asp?id=<%= rs("cod_categoria") %>"><%= rs("Descricao") %></a> </span>
            <%
		end if
	end if
	if Cod_SubCategoria <> "" then
		strsql="select cod_categoria, cod_subcategoria, descricao from SubCategoria where cod_subcategoria = " & cod_subcategoria
		'response.Write(strsql)
		set rs=cn.execute(strsql)
		if not rs.eof then
		%>
           	<img src="img/seta-branca.png" width="6" height="8" border="0" />
            <span class="fonte-branca-16">
            <a  class="branco"  href="produto-listagem.asp?id=<%= rs("cod_categoria") %>&id2=<%= rs("cod_subcategoria") %>"><%= rs("Descricao") %></a>
            </span>
        <%
		end if
	end if
End Sub

Function RemoveAcentos(ByVal Texto)
    Dim ComAcentos
    Dim SemAcentos
    Dim Resultado
	Dim Cont
    'Conjunto de Caracteres com acentos
    ComAcentos = "ÁÍÓÚÉÄÏÖÜËÀÌÒÙÈÃÕÂÎÔÛÊáíóúéäïöüëàìòùèãõâîôûêÇç"
    'Conjunto de Caracteres sem acentos
    SemAcentos = "AIOUEAIOUEAIOUEAOAIOUEaioueaioueaioueaoaioueCc"
    Cont = 0
    Resultado = Texto
    Do While Cont < Len(ComAcentos)
	Cont = Cont + 1
	Resultado = Replace(Resultado, Mid(ComAcentos, Cont, 1), Mid(SemAcentos, Cont, 1))
    Loop
    RemoveAcentos = Resultado
End Function

Function RetonarValorDesc(nome,var)
	dim strsql
	if var <> "" then
		strsql = "Select cod_"&nome&" from "& nome &" where url = '"&var&"'"
		set rs=cn.execute(strsql)
		if not rs.eof then
			RetonarValorDesc = rs("cod_"&nome)
		else
			RetonarValorDesc = 0
		end if
	else
		RetonarValorDesc = 0
	end if
End Function

Function RetonarInf(coluna,tabela,codigo)
	dim strsql
	strsql = "Select "&coluna&" from "&tabela&" where cod_"&tabela&" = " & codigo
	set rs=cn.execute(strsql)
	if not rs.eof then
		RetonarInf = rs(coluna)
	else
		RetonarInf = 0
	end if
End Function


Function selecionarOpcao(url_fabricante,fabricante)
	dim vetor,x
	vetor = split(url_fabricante,"_")
	for x = 0 to ubound(vetor)
		if vetor(x) = fabricante then
			selecionarOpcao = "checked"
		end if
	next
End Function

Function montarURLProduto(cod_produto,url_derivacao)
	dim strsql, rs,url
	strsql = "select * from V_Produto_URL_V2 where cod_produto = " & cod_produto
	set rs=cn.execute(strsql)
	if not rs.eof then
		url = "produtos/" & rs("url_secao") & "/" & rs("url_categoria")
		if rs("url_subcategoria") <> "sem-classificaçao" then
			url = url & "_" & rs("url_subcategoria") & "/"
		else
			url = url & "/"
		end if
			if url_derivacao <> "sem-derivacao" and not isnull(url_derivacao) then
				url = url & rs("url_seo") & "_" & rs("cod_produto") & "_" & url_derivacao & ".htm"
			else
				url = url & rs("url_seo") & "_" & rs("cod_produto") & ".htm"
			end if
	else
		url = "#"
	end if		
	montarURLProduto = url
end function

Sub estrutura_navegacao()
	url_secao = request.QueryString("id1")
	url_categoria = request.QueryString("id2")
	
	url_preco=request.QueryString("preco")
	url_fabricante=request.QueryString("fabricante")
	
	
	if instr(url_categoria,"_") then
		vetor = split(url_categoria,"_")
		url_categoria = vetor(0)
		url_subcategoria = vetor(1)	
	end if
	
	cod_secao = RetonarValorDesc("secao",url_secao)
	cod_categoria = RetonarValorDesc("categoria",url_categoria)
	cod_subcategoria = RetonarValorDesc("subcategoria",url_subcategoria)
	
	'response.Write("url_Secao: "& url_secao)
	'response.Write("<br>")
	'response.Write("url_categoria: " & url_categoria)
	'response.Write("<br>")
	'response.Write("url_subcategoria: " & url_subcategoria)
	'response.Write("<br>")
	
	'response.Write("cod_secao: " & cod_secao)
	'response.Write("<br>")
	'response.Write("cod_categoria: " & cod_categoria)
	'response.Write("<br>")
	'response.Write("cod_subcategoria: " & cod_subcategoria)
	'response.Write("<br>")
	
	URL_Busca = url_completa & "produtos/"
	
	if cod_secao > 0 then
		secao = RetonarInf("descricao","secao",cod_secao)
		Filtros = " and cod_secao = "& cod_secao &" "
		URL_Busca = URL_Busca & url_secao & "/"
		caminho_produto(0) = "produtos/"&url_secao&"/|"&secao
		categoria_seo = secao
		categoria_seo_descricao = RetonarInf("descricao_seo","secao",cod_secao)
	end if
	
	if cod_categoria > 0 then
		categoria = RetonarInf("descricao","categoria",cod_categoria)
		Filtros = Filtros & " and cod_categoria = "& cod_categoria &" "
		URL_Busca = URL_Busca & url_categoria 
		redim preserve caminho_produto(1)
		caminho_produto(1) = "produtos/"&url_secao&"/"&url_categoria&"/|"&categoria
		categoria_seo = categoria_seo & " - " & categoria
		categoria_seo_descricao = RetonarInf("descricao_seo","categoria",cod_categoria)
	end if
	
	if cod_subcategoria > 0 then
		subcategoria = RetonarInf("descricao","subcategoria",cod_subcategoria)
		Filtros = Filtros & " and cod_subcategoria = "& cod_subcategoria &" "
		URL_Busca = URL_Busca & "_" & url_subcategoria & "/"
		redim preserve caminho_produto(2)
		caminho_produto(2) = "produtos/"&url_secao&"/"&url_categoria&"_"&url_subcategoria&"/|"&subcategoria
		categoria_seo = categoria_seo & " - " & subcategoria
		categoria_seo_descricao = RetonarInf("descricao_seo","subcategoria",cod_subcategoria)
	else
		URL_Busca = URL_Busca & "/"
	end if
End Sub

Sub contarRegistros()
	dim strsql, rs
			
	strsql = " Select count(*) as total From Tabela_Rapida_Categoria_SubCategoria_Derivacao_SIte_Busca Where Descricao is not null "
	strsql = strsql & Filtros & filtro_derivacao & filtro_preco
	set rs=cn.execute(strsql)
	if not rs.eof then
		total_registros_consulta = rs("total")
	else
		total_registros_consulta = 0
	end if
				
	strsql = " Select count(*) as total From Tabela_Rapida_Categoria_SubCategoria_Derivacao_SIte_Busca Where Descricao is not null "
	set rs=cn.execute(strsql)
	if not rs.eof then
		total_registros = rs("total")
	else
		total_registros = 0
	end if				
End Sub

'Declaração variaveis
dim strsql, rs, rs2, rs3

dim vetor, x, derivacao_dincamica
dim url_fabricante,url_preco
Dim filtro_derivacao

dim cod_secao, cod_categoria, cod_subcategoria

Dim contador

Dim Filtros, cod_fabricante

Dim url_secao, url_categoria, url_subcategoria

dim foto_produto,produto_listado
produto_listado = "0"

Dim link_Produto

dim valor_produto

'navegação paginas
dim link_corrente,pagina_corrente
redim caminho_produto(0)

Dim URL_Busca

dim secao, categoria, subcategoria, categoria_seo

dim categoria_seo_descricao


''''''''''''''''''''''''''


function FormataDataBTG(data)
	FormataDataBTG = year(data) & "-" & month(data) & "-" & day(data)
end function


Sub btg360_v2(cod_cliente,cod_venda,email,cod_produto,nome_pagina,secao,categoria,compra_concluida)
	dim id_site, rs
	
	
	if cod_cliente = "" then
		cod_cliente = 0
		email = ""
	end if
	
	%>
		<script src="//i.btg360.com.br/bs.js" type="text/javascript"></script>
        <script type="text/javascript">
            try{
                __bsd["id"]="<%= id_allin %>";
                __bsd["expiraCarrinho"]=30;
                __bsd["expiraCarrinhoTempo"] = 1;
        
            }catch(e){
            }
		
        <%
		if cod_cliente > 0 then
		%>
		
		try{
		 bs.setaCliente({ "id":"<%=cod_cliente%>",
						  "email":"<%=email%>"
		  });
		 }catch(e){
		 }
		<%
		end if
		
		if cod_produto > 0 or nome_pagina <> "" then
			%>
			try{
			<%
			if cod_produto > 0 and nome_pagina = "" then

					strsql = "select (convert(float,oferta)/"&parcelas_promocao_pagseguro&") as oferta_parcela, nome,subcategoria,categoria,valor,oferta,qtde_estoque, fabricante from v_btg360_Produto where id_produto = " & cod_produto
					set rs=cn.execute(strsql)
					%>
						bs.setaPagina({ "nome":"<%= rs("nome") %>",
										"categoria":"<%= rs("categoria") %>",
										"categoria_sub":"<%= rs("subcategoria") %>",
										"id_produto":"<%= cod_produto %>",
										"valor":"<%= rs("valor") %>",
										"oferta":"<%= rs("oferta") %>",
										"disponibilidade":"<% if rs("qtde_estoque") > 0 then response.write(1) %>",
										"outra_oferta":"<%=parcelas_promocao_pagseguro%>x<%= rs("oferta_parcela")%>",
										"desc_oferta":"5% de desconto no Boleto",
										"marca":"<%=rs("fabricante")%>"
						
						 });
			<%
			else
				 %>
					 bs.setaPagina({ "nome":"<%= nome_pagina %>",
									"categoria":"<%=secao%>",
									"categoria_sub":"<%=categoria%>",		
					 });
			<%
			end if
			%>
				 
			}catch(e){
			}
		<%
		end if
		%>
			
			<%
			if cod_venda > 0 and not compra_concluida then
			%>
			try{	
				<%
				dim cod_produto_lista
				strsql = "select distinct fabricante, DataADD_Carrinho, id_produto, nome,categoria,valor,oferta,qtde,Desconto_Item,subcategoria from v_btg360_carrinho where id_venda = "&cod_venda&" order by id_produto, valor"
				'response.Write(strsql)
				set rs=cn.execute(strsql)
				do while not rs.eof
				if cod_produto_lista <> rs("id_produto") then
				
				%>
				
				 bs.addProdutoCarrinho({ "id_produto":"<%= rs("id_produto") %>",
										 "nome_produto":"<%= rs("nome") %>",
										 "valor_unitario":"<%= rs("oferta") %>",
										 "desconto":"<%= replace(formatnumber(rs("Desconto_Item"),2),",",".") %>",
										 "quantidade":"<%= rs("qtde") %>",
										 "dt_adicao":"<%= FormataDataBTG(rs("DataADD_Carrinho")) %>",
										 "categoria":"<%= rs("categoria") %>",
										 "categoria_sub":"<%= rs("subcategoria") %>",
										 "marca":"<%=rs("fabricante")%>"
			
				 });
				 
				 <%
				 end if
				 cod_produto_lista = rs("id_produto")
				 rs.movenext
				 Loop
				 %>
				  
				 }catch(e){
				 }
			 <%
			 end if
			 %>
			
			
			<%
			Dim cod_lista_produto
			if compra_concluida then
			%>
			try{
				
				<%
				strsql = "select distinct valor_total, valor_frete,nf,forma_pagamento,DataADD_Carrinho, id_produto, nome,categoria,valor,oferta,qtde,Desconto_Item,subcategoria,fabricante from v_btg360_carrinho where id_venda = " & Cod_Venda
				set rs=cn.execute(strsql)
				
				%>
				
				bs.finalizaCompra({ "valor_total":"<%= rs("valor_total") %>",
									"frete":"<%= rs("valor_frete") %>",
									"dt_prevista_para_entrega":"<% if rs("nf") then response.Write("3") else response.Write("15") %>",
									"metodo_de_pagamento":"<%= rs("forma_pagamento") %>",
									"cod_compra":"<%= Cod_Venda %>"
				   });
			
			
			 }catch(e){
			 }
			 
			 
			 try{
			 <%
			 do while not rs.eof
			 if cod_lista_produto <> rs("id_produto") then
			 %>
			 bs.addProdutoComprado({ "cod_compra":"<%= Cod_Venda %>",
									"id_produto":"<%= rs("id_produto") %>",
									"nome_produto":"<%= rs("nome") %>",
									"valor_unitario":"<%= rs("oferta") %>",
									"desconto":"<%= rs("Desconto_Item") %>",
									"quantidade":"<%= rs("qtde") %>",
									"dt_adicao":"<%= FormataDataBTG(rs("DataADD_Carrinho")) %>",
									"categoria":"<%= rs("categoria") %>",
									"categoria_sub":"<%= rs("subcategoria") %>",
									"marca":"<%=rs("fabricante")%>"
			   });
			  <%
			  end if
			  cod_lista_produto = rs("id_produto")
			  rs.movenext
			  Loop
			  %> 
			 }catch(e){
			}
			
		<%
			end if
		%>
	</script>
	<%
end sub

'''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''

%> 