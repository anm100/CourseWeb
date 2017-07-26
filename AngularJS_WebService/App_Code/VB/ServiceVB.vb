Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class ServiceVB
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetCurrentTime(name As String) As String
        Dim message As String = "Hello "
        message &= name
        message &= vbCrLf & "Current Time: "
        message &= DateTime.Now.ToString()
        Return message
    End Function
End Class