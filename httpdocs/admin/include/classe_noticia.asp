<%
Function Pega_DadoBanco(fctTabela,fctCampoConsultado,fctCampoCondicao,fctCondicao)
    
    Set RS_Pega_Dado = Server.CreateObject("ADODB.Recordset")
    RS_Pega_Dado.CursorLocation = 3
    RS_Pega_Dado.CursorType = 0
    RS_Pega_Dado.LockType = 3

    'Monta query conforme parametros postados.
    Query_Pega_DadoBanco = "SELECT "&fctCampoConsultado&" FROM "&fctTabela&" WHERE "&fctCampoCondicao&" = "&fctCondicao&""
    'Executa query de consulta.
    'response.write Query_Pega_DadoBanco
    RS_Pega_Dado.Open Query_Pega_DadoBanco, cn
        If Not RS_Pega_Dado.Eof Then
            Pega_DadoBanco = RS_Pega_Dado(fctCampoConsultado)
        Else
            Pega_DadoBanco = ""
        End If
    
    'Fecha e Libera recordset da memria
    RS_Pega_Dado.Close
    Set RS_Pega_Dado = Nothing

End Function

Sub Proc_Incluirdados()
	dim strsql, rs, x, form_campo,banco_field, campo, cod_area, tipo, codigo, titulo, titulo_email
    set rs=server.CreateObject("ADODB.Recordset")
	strsql="Noticia"
	Rs.Open strsql,cn, 3,3
	Rs.addnew
		 for each x in request.Form
		 	if isnumeric(x) then
				banco_field=int(x)
				rs.fields(banco_field)=request.Form(x)
			end if
		 next
	rs.fields(8) = replace(request.Form("1")," ","-") & ".htm"
	rs.update
	codigo=rs("cod_noticia")
	titulo=rs("titulo")
    rs.close
	set rs=nothing
	%>
    <script language="javascript">
	alert("Notcia Publicada no site")
	window.open("inc_Noticia.asp?incok=1&acao=1","_self")
	</script>
	<%
End sub

Sub Proc_lerdados(codigo)
	dim strsql, rs, fld, campo
    set rs=server.CreateObject("ADODB.Recordset")
	strsql="SELECT * From Noticia Where Cod_Noticia = " & codigo
	Rs.Open strsql,cn, 3,3	
		 for each fld in RS.fields
		 	vetor(UBound(vetor))=fld.value
			ReDim preserve vetor(UBound(vetor)+1) 
		 next
	rs.update
    rs.close
	set rs=nothing
	strNomeBotao = "Alterar"
End sub

Sub Proc_Alterardados(codigo)
	dim strsql, rs,x,banco_field,campo, cod_area, tipo
    set rs=server.CreateObject("ADODB.Recordset")
	strsql="SELECT * From Noticia Where Cod_Noticia = " & codigo
	Rs.Open strsql,cn, 3,3
		 for each x in request.Form
		 	if isnumeric(x) then
				banco_field=int(x)
				rs.fields(banco_field)=request.Form(x)
			end if
		 next
	rs.update
    rs.close
	set rs=nothing
	%>
    <script language="javascript">
	alert("Notcia Publicada no site")
	window.open("lista_Noticia_alt.asp","_self")
	</script>
    <%
End sub

Sub Proc_excluirdados(codigo)
	dim strsql,rs,PastaDestino,objFSO,imagem
		
	strsql="DELETE Noticia Where Cod_Noticia = " & codigo
	cn.execute(strsql)

	%>
	<script language="JavaScript">
	window.open("lista_Noticia_excluir.asp","_self")
	</script>
	<%
End sub
Sub Proc_listcombocodigo(strsql,valor,campo,codigo)
	dim combo,rscombo
	set rscombo=cn.execute(strsql)
	Do While not rscombo.eof
		
		combo = "<option value= """ & rscombo(valor) & """"  

		if codigo = rscombo(valor) then 
			combo = combo & " selected" 
		end if
		
		combo = combo &" >"& rscombo(campo) &"</option>"
		
		response.Write(combo)
	rscombo.movenext
	Loop
		
	set rscombo=nothing
End sub


%>