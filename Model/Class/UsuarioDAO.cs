using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Class
{
    public class UsuarioDAO : Banco<Usuario>
    {
        /// <summary>
        /// Retorna usuário se dados coincidirem
        /// </summary>
        /// <param name="login">Login usuário</param>
        /// <param name="senha">Senha em MD5 do usuário</param>
        /// <returns></returns>
        public Usuario RetornaUsuario(string login, string senha)
        {
            return RetornaObjetoUnico($"select * from usuario where login = \"{login}\" and senha = \"{senha}\"");
        }
    }
}
