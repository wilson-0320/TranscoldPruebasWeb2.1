Imports Microsoft.VisualBasic
Imports System.Data

Namespace BLL

    Public Class Met_Catalogo_BLL
        Inherits Base_BLL

        Public Shared Sub crud(ByVal query As String, ByVal id As Int32, ByVal valor As String, ByVal tipo As String)
            MsjError = Nothing
            Try
                Dim trsql As New TransacSQL
                trsql.EjecutarActualizacion("TranscoldPruebas", "Met_Catalogo_ABCD", New Object() {
                                            New Object() {"@query", query},
                                            New Object() {"@id", id},
                                            New Object() {"@tipo", tipo},
                                            New Object() {"@valor", valor}
                                            }, Data.CommandType.StoredProcedure)
            Catch ex As Exception
                colocaError(ex)
            End Try
        End Sub


        Public Shared Sub eliminar(ByVal id As Integer)
            MsjError = Nothing
            Try
                Dim trsql As New TransacSQL
                trsql.EjecutarActualizacion("TranscoldPruebas", "Met_Catalogo_ABCD", New Object() {
                                            New Object() {"@query", "ELIMINAR"},
                                            New Object() {"@id", id}
                                            }, Data.CommandType.StoredProcedure)
            Catch ex As Exception
                colocaError(ex)
            End Try
        End Sub

        Public Shared Function consultar() As DataTable
            MsjError = Nothing
            Try
                Dim trsql As New TransacSQL
                Return trsql.EjecutarConsulta("TranscoldPruebas", "Met_Catalogo_ABCD", New Object() {
                                                New Object() {"@query", "TODOS"}
                                                }, Data.CommandType.StoredProcedure).Tables(0)
            Catch ex As Exception
                colocaError(ex)
            End Try
        End Function



        Public Shared Function consultar_por_id(ByVal id As String) As DataRow
            MsjError = Nothing
            Try
                Dim trsql As New TransacSQL
                Return trsql.EjecutarConsulta("TranscoldPruebas", "Met_Catalogo_ABCD", New Object() {
                                                New Object() {"@query", "POR LLAVE"},
                                                New Object() {"@id", id}
                                                }, Data.CommandType.StoredProcedure).Tables(0).Rows(0)
            Catch ex As Exception
                colocaError(ex)
            End Try
        End Function

        Public Shared Function consultar_por_tipo(ByVal tipo As String) As DataTable
            MsjError = Nothing
            Try
                Dim trsql As New TransacSQL
                Return trsql.EjecutarConsulta("TranscoldPruebas", "Met_Catalogo_ABCD", New Object() {
                                                New Object() {"@query", "por tipo"},
                                                New Object() {"@tipo", tipo}
                                                }, Data.CommandType.StoredProcedure).Tables(0)
            Catch ex As Exception
                colocaError(ex)
            End Try
        End Function



    End Class

End Namespace

