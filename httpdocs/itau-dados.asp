<HTML>
<HEAD>
<TITLE>Exemplo de codigo HTML</TITLE>
</HEAD>
<BODY>
<FORM ACTION="itau-transicao.asp" METHOD="Post" NAME="form1"> <CENTER>Entre com os Dados
<TABLE width=100% border=1 align=center>
<TR>
<TD width=25% align=center><B>Pedido (99999999):</B></TD>
<TD><INPUT type="text" maxlength=8 size=8 name="pedido" value="188"></TD> </TR>
<TR>
<TD width=25% align=center><B>Valor (99999999,99):</B></TD>
<TD><INPUT type="text" maxlength=10 size=10 name="valor" value="200,00"></TD> </TR>
<TR>
<TD width=25% align=right><B>Observacao:</B></TD>
<TD><INPUT type="text" maxlength=40 size=40 name="observacao" value="1"></TD>
</TR> <TR>
<TD width=25% align=right><B>Nome do Sacado:</B></TD>
<TD><INPUT type="text" maxlength=30 size=30 name="nomeSacado" value="Alan Oliveira"></TD> </TR>
<TR>
<TD width=25% align=right><B>Codigo de Inscricao (01 CPF, 02 CNPJ):</B></TD> <TD><INPUT type="text" maxlength=2 size=2 name="codigoInscricao" value="01"></TD>
</TR> <TR>
<TD width=25% align=right><B>Numero de Inscricao (CPF, CNPJ):</B></TD>
<TD><INPUT type="text" maxlength=14 size=14 name="numeroInscricao" value="40815309805"></TD> </TR>
<TR>
<TD width=25% align=right><B>Endereco do Sacado:</B></TD>
<TD><INPUT type="text" maxlength=40 size=40 name="enderecoSacado" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>Bairro:</B></TD>
<TD><INPUT type="text" maxlength=15 size=15 name="bairroSacado" value="Cj Res José Bonifácio"></TD> </TR>
<TR>
<TD width=25% align=right><B>CEP (99999999):</B></TD>
<TD><INPUT type="text" maxlength=8 size=8 name="cepSacado" value="08253070"></TD>
</TR> <TR>
<TD width=25% align=right><B>Cidade:</B></TD>
<TD><INPUT type="text" maxlength=15 size=15 name="cidadeSacado" value="São Paulo"></TD> </TR>
<TR>
<TD width=25% align=right><B>Estado:</B></TD>
<TD><INPUT type="text" maxlength=2 size=2 name="estadoSacado" value="SP"></TD>
</TR> <TR>
<TD width=25% align=right><B>Data de Vencimento (ddmmaaaa):</B></TD>
<TD><INPUT type="text" maxlength=8 size=8 name="dataVencimento" value="07062016"></TD> </TR>
<TR>
<TD width=25% align=right><B>URL retorna:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="urlRetorna" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>ObsAdicional1:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="ObsAdicional1" value="Não aceitar após data de vencimento"></TD> </TR>
<TR>
<TD width=25% align=right><B>ObsAdicional2:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="ObsAdicional2" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>ObsAdicional3:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="ObsAdicional3" value=""></TD> </TR>
</TABLE>
</CENTER>
<BR><BR>
<INPUT TYPE="submit" value="Pagar" name="Pagar"> </FORM>
</BODY> </HTML>