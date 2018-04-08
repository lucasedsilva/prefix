using Model;
using Model.Class;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prefix
{
    public partial class Index : Page
    {
        public static Usuario _usuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (_usuario == null)
            {
                _usuario = this.Master._usuario;
            }
        }

        /// <summary>
        /// Método para pesquisa de todas as pessoas
        /// </summary>
        /// <returns>Retorna uma lista de todas as pessoas cadastradas no formato JSON.</returns>
        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public static string RetornaUsuarioLogado()
        {
            try
            {
                var jsonSerialiser = new JavaScriptSerializer();
                return jsonSerialiser.Serialize(_usuario);
            }
            catch (Exception ex)
            {
                return String.Format("Aconteceu um problema ao consultar as pessoas.");
            }

        }
    }
}
