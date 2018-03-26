<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<%


Dim Contador, Tamanho
Dim ConteudoBinario, ConteudoTexto
Dim Delimitador, Posicao1, Posicao2
Dim ArquivoNome, ArquivoConteudo, PastaDestino
Dim objFSO, objArquivo,delimitar
Dim Jpeg, Path, nome_foto, fso, fileName, myFileUpload
Dim codigo,strsql


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

codigo=session("codigo")


Set Upload = Server.CreateObject("Persits.Upload")
' Capture files
Upload.Save '"D:\http\vhosts\thepilatesfisiofitness.com.br\httpdocs\images\"
' Obtain file object
Set File = Upload.Files("file2")
If Not File Is Nothing Then
  
 	 
	arquivonome=File.filename
	'response.Write(arquivonome)
	
	
	For Each File in Upload.Files
	File.SaveAs "D:\http\vhosts\thepilatesfisiofitness.com.br\httpdocs\images\"&"p_"&codigo&arquivonome
	
	'arquivonome="p_"&codigo&arquivonome
  	
 	Next
	
	'response.Write(arquivonome)
  'response.Write(arquivonome)
  
  ' Save to database
 	Conecta()
			
	strsql="INSERT INTO Imagem (cod_turma,imagem) VALUES ("&codigo&",'"&codigo&arquivonome&"')"
	'response.Write(strsql)
	cn.execute(strsql)
	
	desconecta()  


Else
  Response.Write "File not selected."
End If

response.Redirect("Imagem_turma.asp?codigo="&codigo)

%> 
