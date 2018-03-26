<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<%
conecta()

'abre o banco de dados

Dim Contador, Tamanho
Dim ConteudoBinario, ConteudoTexto
Dim Delimitador, Posicao1, Posicao2
Dim ArquivoNome, ArquivoConteudo, PastaDestino
Dim objFSO, objArquivo,delimitar
Dim Jpeg, Path, nome_foto, fso, fileName, myFileUpload
Dim codigo

Sub Tamanho_Imagem(Jpeg, Width, Height)
	
	Dim aux_Width, aux_Height
	Dim Height_VO
	Dim Width_VO
	Dim largura_invalida, altura_invalida
	
	Height_VO = Height
	Width_VO = Width
	
	aux_Width = 0
	aux_Height = 0
	
	largura_invalida = false
	altura_invalida = false
							
	if Jpeg.OriginalWidth > Width then
		largura_invalida = true
	end if
							
	if Jpeg.OriginalHeight > Height then
		altura_invalida = true
	end if
		
	if (Jpeg.OriginalHeight - Height) > (Jpeg.OriginalWidth - Width) Then
		if altura_invalida then
			Do While aux_Width >= Width_VO or aux_Width = 0
				aux_Height = Height			
				aux_Width = (Height * Jpeg.OriginalWidth)/Jpeg.OriginalHeight
				Height = Height -1
			Loop		
		end if
	else						
		if largura_invalida then
			While aux_Height >= Height_VO or aux_Height = 0 
				aux_Width = Width
				aux_Height = (Width * Jpeg.OriginalHeight)/Jpeg.OriginalWidth
				Width = Width -1
'				response.Write("aux_Width " & aux_Width & "<br>")
'				response.Write("aux_Height " & aux_Height & "<br>")
'				response.Write("Width " & Width & "<br><br>")
			Wend
		end if
	end if
	
	if altura_invalida or largura_invalida Then
		Jpeg.Width = aux_Width
		Jpeg.Height = aux_Height
	end if
	
End Sub

codigo = session("codigo")

	PastaDestino = Server.MapPath("../images/noticia/")

	Set myFileUpload = Server.CreateObject("SoftArtisans.FileUp")  

    ArquivoNome = Mid(myFileUpload.UserFilename, InstrRev(myFileUpload.UserFilename, "\") + 1)
	ArquivoNome = trim(ArquivoNome)
    ' diretório em que a imagem será salva
    myFileUpload.Path = PastaDestino 
    myFileUpload.Save
	Set myFileUpload = nothing
	
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	
	If fso.FileExists(Server.MapPath("../images/noticia/p_" &codigo & ArquivoNome)) Then
		fso.DeleteFile(Server.MapPath("../images/noticia/p_"&codigo &ArquivoNome))
	End If
	
	If fso.FileExists(Server.MapPath("../images/noticia/g_" &codigo & ArquivoNome)) Then
		fso.DeleteFile(Server.MapPath("../images/noticia/g_"&codigo &ArquivoNome))
	End If

	Set Jpeg = Server.CreateObject("Persits.Jpeg")
		Jpeg.Open PastaDestino & "/"& ArquivoNome
		'Tamanho_Imagem Jpeg, 300, 300
		Jpeg.Save PastaDestino & "/" &codigo & ArquivoNome
	Set Jpeg = Nothing
	
	Set Jpeg = Server.CreateObject("Persits.Jpeg")
		Jpeg.Open PastaDestino & "/"& ArquivoNome
		Tamanho_Imagem Jpeg, 300, 300
		Jpeg.Save PastaDestino & "/g_" &codigo & ArquivoNome
	Set Jpeg = Nothing
	
	Set Jpeg = Server.CreateObject("Persits.Jpeg")
		Jpeg.Open PastaDestino & "/"& ArquivoNome
		Tamanho_Imagem Jpeg, 150, 150
		Jpeg.Save PastaDestino & "/p_" &codigo & ArquivoNome
	Set Jpeg = Nothing
				
	ArquivoNome = codigo&ArquivoNome
	conecta()
	
	cn.execute("update Noticia set imagem"&session("ordem")&" = '"&ArquivoNome&"' where Cod_Noticia = " & codigo)
	desconecta()
	
	
	response.Redirect("Imagem_Noticia_ordem.asp?ordem="&session("ordem")&"&codigo="&codigo&"&upload=	s")
    
%> 
