<%
Sub Proc_Incluirdados()
	dim strsql, rs, x, form_campo,banco_field, campo, cod_area, tipo
    set rs=server.CreateObject("ADODB.Recordset")
	strsql="depoimento"
	Rs.Open strsql,cn, 3,3
	Rs.addnew
		 for each x in request.Form
		 	if isnumeric(x) then 
				banco_field=int(x)
				rs.fields(banco_field)=request.Form(x)
				'response.Write(banco_field) & " - " & request.Form(x) & "<br>"
			end if
		 next
	rs.update
    rs.close
	set rs=nothing
	
	%>
	<script language="JavaScript">
	window.open("inc_depoimento.asp?incok=1&acao=1","_self")
	</script>
	<%
End sub

Sub Proc_lerdados(codigo)
	dim strsql, rs, fld, campo
    set rs=server.CreateObject("ADODB.Recordset")
	strsql="SELECT * From depoimento Where Cod_depoimento = " & codigo
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
	strsql="SELECT * From depoimento Where Cod_depoimento = " & codigo
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
	<script language="JavaScript">
	window.open("lista_depoimento_alt.asp","_self")
	</script>
	<%
End sub

Sub Proc_excluirdados(codigo)
	dim strsql,rs,PastaDestino,objFSO,imagem
		
	strsql="DELETE depoimento Where Cod_depoimento = " & codigo
	cn.execute(strsql)
			
	%>
	<script language="JavaScript">
	window.open("lista_depoimento_excluir.asp","_self")
	</script>
	<%
End sub

Sub Proc_listacombocodigo(strsql,valor,campo,codigo)
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