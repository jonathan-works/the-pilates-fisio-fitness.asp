<%
'	
'	ASP include()
'	-------------
'	Simple ASP include() function
'	Parses HTML and inline ASP -- should parse everything apart from <!--# --> -type directives.
'	All variables and functions in the calling scope are rpeserved inside the include file.
'	Similarly, all variables and functions set by the include file are preserved after the file is included
'
'	Intended to simulate the behaviour of the PHP include() function.
'
'	Based on a simple character-by-character traversal of the file to be included. 
'
'
'	USAGE
'	-----
'	include("relative_path_to_local_file.asp")
'
'	Returns true if the file is found. Doesn't handle errors -- you need to trap errors yourself.
'
'	COPYRIGHT
'	---------
'	John Wells, 2009
'	Released under the GNU GPL Version 3
'	http://www.gnu.org/copyleft/gpl.html
'	You may copy, modify, and re-release this library, but this copyright notice must remain intact, and 
'	you must adhere to the full terms of the GPL v3, including making the source code available where applicable.
'
'	I request that you submit any improvements and modifications to jfwhome.com
'

Function include(fileName)
	Const forReading = 1, forWriting = 2, forAppending = 3
	Const asDefault = -2, asUnicode = -1, asAscii = 0
	Dim objFSO, objTS
	
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	fileName = Server.MapPath(fileName)
	
	if objFSO.FileExists(fileName) then
		Set objTS =objFSO.OpenTextFile(fileName, forReading, False, asAscii)
		Execute compile_block(objTS.ReadAll)
		include = true
		objTS.Close
	Else
		include = false
	End If
	
	Set objTS = Nothing
	Set objFSO = Nothing
	
End Function

Function compile_block(txt)

	' Unfortunately, ASP/VB sucks to high heaven, and can't eval a mixed HTML/ASP string, or do dynamic includes
	' Since our blocks contain ASP and HTML, we need to compile them into executable state ourselves 
	' by stepping throguh character by character. This is effectively a dynamic include function for ASP :-)
	'John Wells, 2009
	
	Dim rdStrPos, currChar, buffASPOpTag, buffASPCloTag, buffCode, execState, buffHTML, numLines, strLines
	execState = "HTML"
	numLines = -1
	Redim strLines(0)
	For rdStrPos = 1 To Len(txt) 'VB strings start with index 1, not 0 ?!
		currChar = Mid(txt, rdStrPos, 1) 
		Select Case currChar
			Case "<"
				If execState = "HTML" Then
					buffASPOpTag = "<"
				Else
					buffCode = buffCode & currChar
					buffASPOpTag = ""
				End If
				buffASPCloTag = ""
			Case "%"
				If buffASPOpTag = "<" Then 'We've found the start of a code block
					If execState = "HTML" Then
						If buffHTML <> "" Then
							numLines = numLines + 1
							
							Redim Preserve strLines(numLines)
							strLines(numLines) = "response.write "" " & replace(buffHTML, """", """""") & """ & vbCrLf"
						End If
					End If
					
					execState 		= 	"CODE"
					buffCode 		=	""
					buffHTML 		= 	""
					buffASPCloTag 	= 	""
				Else
					If execState = "HTML" Then
						buffHTML = buffHTML + currChar
					Else
						buffASPCloTag = "%"
					End If
				End If
				buffASPOpTag = ""
			Case ">"
				If buffASPCloTag = "%" Then
					' We now have a full set of code in buffCode. Store it
					If left(buffCode, 1) = "=" Then
						buffCode = "Response.Write" & right(buffCode, len(buffCode) -1)
					End If

					If buffCode <> "" Then
						numLines = numLines + 1
						redim preserve strLines(numLines)							
						strLines(numLines) = buffCode 
					End If
					buffCode 	= 	""
					buffHTML 	= 	""
					execState 	= 	"HTML"
				Else
					buffHTML = buffHTML + currChar
				End If
				buffASPCloTag 	= 	""
				buffASPOpTag 	= 	""
			Case vbLf
				If execState = "HTML" Then
					If buffASPOpTag <> "" Then
						buffHTML = buffHTML + buffASPOpTag
					End If					
					If buffASPCloTag <> "" Then
						buffHTML = buffHTML + buffASPCloTag
					End If
					If buffHTML <> "" Then
						numLines = numLines + 1
						redim preserve strLines(numLines)									
						strLines(numLines) = "response.write "" " & replace(buffHTML, """", """""") & """ & vbCrLf"
					End If
				Else
					If buffCode <> "" Then
						numLines = numLines + 1
						Redim Preserve strLines(numLines)							
						strLines(numLines) = buffCode
					End If
				End If
				buffHTML = ""
				buffCode = ""
				
			Case Else
				If buffASPOpTag <> "" Then
					buffHTML = buffHTML + buffASPOpTag
				End If					
				If buffASPCloTag <> "" Then
					buffHTML = buffHTML + buffASPCloTag
				End If
				If execState = "CODE" Then
					buffCode = buffCode & currChar
				Else
					buffHTML = buffHTML + currChar
				End If
				
				buffASPOpTag 	= 	""
				buffASPCloTag 	= 	""
		End Select
	Next
	compile_block = ""
	For z = 0 to numLines
		If strLines(z) <> "" Then
			strlines(z) 	= 	replace(strlines(z),vbCrLf, "")
			strlines(z) 	= 	replace(strlines(z), vbCr, "")
			strlines(z) 	= 	replace(strlines(z), vbLf, "")
			compile_block 	= 	compile_block & strLines(z) & vbCrLf
		End If
	Next
End Function
%>