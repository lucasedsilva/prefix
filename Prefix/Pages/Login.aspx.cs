using Model;
using Model.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prefix.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /// <summary>
        /// Realiza tentativa de login
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="senha"></param>
        /// <returns>Retorna verdadeiro se usuário informador estiver correto e o grava na session</returns>
        [WebMethod(EnableSession = true)]
        public static string RetornaUsuarioPorLogin(string usuario = "", string senha = "")
        {
            try
            {
                var jsonSerialiser = new JavaScriptSerializer();
                var usuarioLogin = Singleton<UsuarioDAO>.Instance.RetornaUsuario(usuario, Utils.MD5Hash(senha));
                if(usuarioLogin != null)
                {
                    var usuarioSessao = Utils.MontarHashSessaoUsuario(usuarioLogin.Id.ToString());
                    HttpContext.Current.Session["UsuarioLogadoToken"] = usuarioSessao;
                    HttpContext.Current.Session["UsuarioLogado"] = usuarioLogin.Id;

                    return "sucesso";
                }

                return "falha";
            }
            catch (Exception ex)
            {
                return "falha";
            }
        }
    }
}