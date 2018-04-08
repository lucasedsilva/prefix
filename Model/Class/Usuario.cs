using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Class
{
    public class Usuario
    {
        public virtual int Id { get; set; }
        public virtual string Nome { get; set; }
        public virtual string Email { get; set; }
        public virtual string Login { get; set; }
        public virtual string Senha { get; set; }
        public virtual int TipoPlano { get; set; }
    }

    public enum EnumTipoPlano
    {
        Simples = 1,
        Plus = 2,
        Premium = 3
    }
}
