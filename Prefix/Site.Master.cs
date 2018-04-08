using Model;
using Model.Class;
using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;

namespace Prefix
{
    public partial class SiteMaster : MasterPage
    {
        public Usuario _usuario => Singleton<UsuarioDAO>.Instance.SelectById(Convert.ToInt32(Session["UsuarioLogado"].ToString()));

        protected void Page_Load(object sender, EventArgs e)
        {
            var usuarioLogado = Session["UsuarioLogado"].ToString();
            var usuarioLogadoToken = Session["UsuarioLogadoToken"].ToString();

            if(Utils.MontarHashSessaoUsuario(usuarioLogado) != usuarioLogadoToken)
            {
                Response.Redirect($"http://{HttpContext.Current.Request.Url.Authority}/Home.aspx");
            }
        }
    }
}