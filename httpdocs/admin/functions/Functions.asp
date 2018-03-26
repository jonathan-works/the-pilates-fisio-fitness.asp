<%

Function FormataDataAmericano(Data)
	Dim dia6,mes6,ano6, hora6, minuto6, segundo6
    dia6 = DatePart("d", Data)
    mes6 = DatePart("m", Data)
	ano6 = DatePart("yyyy", Data)
	hora6 = datePart("h", Data)
	minuto6 = datePart("n", Data)
	segundo6 = datePart("s", Data)
    FormataDataAmericano = mes6  &"/" & dia6 & "/" & ano6 & " " & hora6 &":"& minuto6
End Function


function condominioFromID(id)

	Select Case id
		Case false
			condominioFromID = "N&atilde;o"
		Case true
			condominioFromID = "Sim"
	End Select

end function

function tipoUsuarioFromID(id)

	Select Case id
		Case 0
			tipoUsuarioFromID = "Operador"
		Case 1
			tipoUsuarioFromID = "Administrador"
	End Select

end function

function weekDayFromID(id)
	
	Select Case id
		Case 0
			weekDayFromID = "Domingo"
		Case 1
			weekDayFromID = "Segunda"
		Case 2
			weekDayFromID = "Terça"
		Case 3
			weekDayFromID = "Quarta"
		Case 4
			weekDayFromID = "Quinta"
		Case 5
			weekDayFromID = "Sexta"
		Case 6
			weekDayFromID = "Sábado"
	End Select
	
end function


%>