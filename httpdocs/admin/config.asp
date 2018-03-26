<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%

Response.Charset = "UTF-8"
Session.Codepage = 65001
Session.Timeout = 15 'valor em minutos
Session.LCID = 1046 

Dim ABS_PATH:ABS_PATH = Server.MapPath("/")

Const URL = "http://wwww.autoclean.com.br/"
Const URL_ADMIN = "http://www.autoclean.com.vc/admin"
Const URL_SSL = "https://www.autoclean.com.vc"

Const SITE_NAME = "AutoClean"

%>