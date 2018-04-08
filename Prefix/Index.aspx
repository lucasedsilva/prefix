<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Prefix.Index" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        var _usuario;

        function CarregarUsuario() {
            $.ajax({
                type: "GET",
                contentType: "application/json; charset=utf-8",
                url: "Index.aspx/RetornaUsuarioLogado",
                dataType: "json",
                success: function (result) { _usuario = JSON.parse(result.d); CarregarPagina(_usuario); },
                error: function (msg) {
                    alert(msg.d);
                }
            })
        }

        $(document).ready(CarregarUsuario());
        $(document).ready(ConsultaLocalExecucao());

        function RetornaDataFormatada(value) {
            var dataFormatada;
            var data = new Date(Number(value.replace("Date(", '').replace(')', "")))
            dataFormatada = data.getDate() + '/' + (data.getMonth() + 1) + '/' + data.getFullYear();
            return dataFormatada;
        }

        function validaData(value) {
            if (value.length < 10) {
                alert(value + " não é uma data válida.")
                return false
            }
            var data = value.split('/');
            if (data[0] > 31 || data[0] < 1) {
                alert(data[0] + " não é um dia válido.")
                return false
            }
            else if (data[1] > 12 || data[1] < 1) {
                alert(data[1] + " não é um mês válido.")
                return false
            }
            else
                return true
        }

        function CamposPorEstado() {
            if (localExecucao == "SC")
                $(".rg").removeClass("rg");
        }

        function TestaCPF(strCPF) {
            var Soma;
            var Resto;
            Soma = 0;
            if (strCPF == "00000000000") return false;

            for (i = 1; i <= 9; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
            Resto = (Soma * 10) % 11;

            if ((Resto == 10) || (Resto == 11)) Resto = 0;
            if (Resto != parseInt(strCPF.substring(9, 10))) return false;

            Soma = 0;
            for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
            Resto = (Soma * 10) % 11;

            if ((Resto == 10) || (Resto == 11)) Resto = 0;
            if (Resto != parseInt(strCPF.substring(10, 11))) return false;
            return true;
        }

        function CarregarPagina(usuario) {
            $("#msgBoasVindas").text("Seja bem vindo ao Prefix " + _usuario.Nome + ", para conseguir o Score de seu empreendimento, é necessário nos informar alguns dados:");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="input-field col s12">
                <h5 class="center-align" id="msgBoasVindas"></h5>
            </div>
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <select>
                            <option value="" disabled selected>Segmento</option>
                            <option value="accounting">Contabilidade</option>
                            <option value="airport">Aeroporto</option>
                            <option value="amusement_park">Parque de diversões</option>
                            <option value="aquarium">Aquário</option>
                            <option value="art_gallery">Galeria de arte</option>
                            <option value="bakery">Padaria</option>
                            <option value="bank">Banco</option>
                            <option value="bar">Bar</option>
                            <option value="beauty_salon">Salão de beleza</option>
                            <option value="bicycle_store">Loja de bicicletas</option>
                            <option value="book_store">Livraria</option>
                            <option value="bowling_alley">Boliche</option>
                            <option value="cafe">Cafeteria</option>
                            <option value="campground">Área de camping</option>
                            <option value="car_dealer">Venda de carros</option>
                            <option value="car_rental">Alugel de carros</option>
                            <option value="car_repair">Mecânica</option>
                            <option value="car_wash">Lava-jato</option>
                            <option value="casino">Option 1</option>
                            <option value="cemetery">Option 1</option>
                            <option value="church">Option 1</option>
                            <option value="city_hall">Option 1</option>
                            <option value="clothing_store">Option 1</option>
                            <option value="convenience_store">Option 1</option>
                            <option value="courthouse">Option 1</option>
                            <option value="dentist">Option 1</option>
                            <option value="department_store">Option 1</option>
                            <option value="doctor">Option 1</option>
                            <option value="electrician">Option 1</option>
                            <option value="electronics_store">Option 1</option>
                            <option value="embassy">Option 1</option>
                            <option value="fire_station">Option 1</option>
                            <option value="florist">Option 1</option>
                            <option value="funeral_home">Option 1</option>
                            <option value="furniture_store">Option 1</option>
                            <option value="gas_station">Option 1</option>
                            <option value="gym">Option 1</option>
                            <option value="hair_care">Option 1</option>
                            <option value="hardware_store">Option 1</option>
                            <option value="health (suspenso)">Option 1</option>
                            <option value="hindu_temple">Option 1</option>
                            <option value="home_goods_store">Option 1</option>
                            <option value="hospital">Option 1</option>
                            <option value="insurance_agency">Option 1</option>
                            <option value="jewelry_store">Option 1</option>
                            <option value="laundry">Option 1</option>
                            <option value="lawyer">Option 1</option>
                            <option value="library">Option 1</option>
                            <option value="liquor_store">Option 1</option>
                            <option value="local_government_office">Option 1</option>
                            <option value="locksmith">Option 1</option>
                            <option value="lodging">Option 1</option>
                            <option value="meal_delivery">Option 1</option>
                            <option value="meal_takeaway">Option 1</option>
                            <option value="mosque">Option 1</option>
                            <option value="movie_rental">Option 1</option>
                            <option value="movie_theater">Option 1</option>
                            <option value="moving_company">Option 1</option>
                            <option value="museum">Option 1</option>
                            <option value="night_club">Option 1</option>
                            <option value="painter">Option 1</option>
                            <option value="park">Option 1</option>
                            <option value="parking">Option 1</option>
                            <option value="pet_store">Option 1</option>
                            <option value="pharmacy">Option 1</option>
                            <option value="physiotherapist">Option 1</option>
                            <option value="plumber">Option 1</option>
                            <option value="police">Option 1</option>
                            <option value="post_office">Option 1</option>
                            <option value="real_estate_agency">Option 1</option>
                            <option value="restaurant">Option 1</option>
                            <option value="roofing_contractor">Option 1</option>
                            <option value="rv_park">Option 1</option>
                            <option value="school">Option 1</option>
                            <option value="shoe_store">Option 1</option>
                            <option value="shopping_mall">Option 1</option>
                            <option value="spa">Option 1</option>
                            <option value="stadium">Option 1</option>
                            <option value="storage">Option 1</option>
                            <option value="store">Option 1</option>
                            <option value="subway_station">Option 1</option>
                            <option value="synagogue">Option 1</option>
                            <option value="taxi_stand">Option 1</option>
                            <option value="train_station">Option 1</option>
                            <option value="transit_station">Option 1</option>
                            <option value="travel_agency">Option 1</option>
                            <option value="university">Option 1</option>
                            <option value="veterinary_care">Option 1</option>
                            <option value="zoo">Option 1</option>
                        </select>
                        <label>Seleciona o segmento no empreendimento:</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="cpf" type="text" data-mask="000.000.000-00" class="validate">
                        <label for="cpf">CPF</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="data_nascimento" type="text" data-mask="00/00/0000" class="validate">
                        <label for="data_nascimento">Data de nascimento</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="telefone" data-mask="(00)000000000" type="text" class="validate">
                        <label for="telefone">Telefone</label>
                    </div>
                    <div class="input-field col s1">
                        <a onclick="addTelefone()" class="btn-floating blue"><i class="material-icons">add</i></a>
                    </div>
                    <div class="input-field col s12">
                        <table class="responsive-table striped">
                            <thead>
                                <tr>
                                    <th data-field="nome">Telefone
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="dadosTelefones">
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="divRg" runat="server" class="row rg">
                    <div class='input-field col s6'>
                        <input id='rg' type='text' class='validate' />
                        <label for='rg'>Rg (Somente os números)</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <a onclick="CadastraPessoa()" class="waves-effect waves-light btn"><i class="material-icons left">person_add</i>Cadastrar pessoa</a>
                    </div>
                </div>
            </form>
            <div class="col s12">
                <table class="responsive-table striped">
                    <thead>
                        <tr>
                            <th data-field="nome">
                                <input placeholder="Nome" onkeyup="ConsultaTodasPessoasPorFiltro()" id="nomeFiltro" type="text" class="validate" />
                            </th>
                            <th data-field="cpf">
                                <input placeholder="CPF" id="cpfFiltro" onkeyup="ConsultaTodasPessoasPorFiltro()" data-mask="000.000.000-00" type="text" class="validate" /></th>
                            <th class="rg" data-field="rg">
                                <input placeholder="RG" id="rgFiltro" onkeyup="ConsultaTodasPessoasPorFiltro()" type="text" class="validate" /></th>
                            <th data-field="nascimento">
                                <input placeholder="Data de nascimento" onkeyup="ConsultaTodasPessoasPorFiltro()" id="data_nascimentoFiltro" type="text" data-mask="00/00/0000" class="validate" /></th>
                            <th data-field="cadastro">
                                <input placeholder="Data de cadastro" onkeyup="ConsultaTodasPessoasPorFiltro()" id="data_cadastroFiltro" type="text" data-mask="00/00/0000" class="validate" />
                            </th>
                            <th data-field="telefones">
                                <input placeholder="Telefone" onkeyup="ConsultaTodasPessoasPorFiltro()" data-mask="(00)000000000" id="telefoneFiltro" type="text" class="validate" />
                            </th>
                        </tr>
                    </thead>

                    <tbody id="dadosTabelaPessoas">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
