<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Prefix.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function Logar() {
            var dataValue = "{'usuario':'" + $("#usuario").val() + "', 'senha':'" + $("#senha").val().trim() + "'}";

            $.ajax(
                {
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Login.aspx/RetornaUsuarioPorLogin",
                    data: dataValue,
                    dataType: "json",
                    success: function (result) {
                        if (result.d == "sucesso")
                            window.location.replace(window.location.origin + "/Index.aspx");
                        else
                            alert("Login inválido");
                    },
                    error: function (msg) {
                        alert("Login inválido");
                    }
                })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col s12">
                <div class="card">
                    <div class="card-content">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s12 center-align">
                                    <h5>Login</h5>
                                </div>
                                <div class="input-field col s12">
                                    <input type="text" id="usuario" class="validate">
                                    <label for="first_name">Usuário</label>
                                </div>
                                <div class="input-field col s12">
                                    <input type="password" id="senha" class="validate">
                                    <label for="last_name">Senha</label>
                                </div>
                                <div class="input-field col s12">
                                    <button onclick="Logar()" class="btn waves-effect waves-light blue" style="margin: auto; display: block;" type="submit" name="action">
                                        Entrar
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
