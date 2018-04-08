using NHibernate.Transform;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Banco<T>
    {
        public IList<T> ExecutaSqlQuery(string sql)
        {
            var session = NHibernateHelper.GetSession();

            var query = session.CreateSQLQuery(sql);

            return query.AddEntity(typeof(T)).List<T>();
        }

        public IList<Hashtable> ExecutaSqlQueryAsHashtable(string sql)
        {
            var session = NHibernateHelper.GetSession();

            var query = session.CreateSQLQuery(sql).SetResultTransformer(new AliasToEntityMapResultTransformer());

            var list = query.List<Hashtable>();

            if (list == null || list.Count == 0)
                return null;

            return list;
        }

        public List<T> ExecutarComoHashtable(string sql)
        {
            var session = NHibernateHelper.GetSession();

            var query = session.CreateSQLQuery(sql).SetResultTransformer(new AliasToEntityMapResultTransformer());

            var list = query.List<Hashtable>();

            var resultado = new List<T>();

            if (list != null && list.Count > 0)
            {
                var textInfo = new CultureInfo("en-US", false).TextInfo;

                for (int i = 0; i < list.Count; i++)
                {
                    var t = (T)Activator.CreateInstance(typeof(T));
                    var type = t.GetType();
                    foreach (var key in list[i].Keys)
                    {
                        var keyEmCamelCase = textInfo.ToTitleCase(key.ToString());
                        var valor = list[i][key];
                        type.GetProperty(keyEmCamelCase.Replace("_", "")).SetValue(t, valor);
                    }

                    resultado.Add(t);
                }
            }

            return resultado;
        }

        public T SelectById(int id)
        {
            var session = NHibernateHelper.GetSession();

            var query = session.CreateSQLQuery("select * from " + typeof(T).Name + " where id = " + id);

            var result = query.AddEntity(typeof(T)).List<T>();

            if (result.Count > 0)
                return result[0];

            return default(T);
        }

        public T RetornaObjetoUnico(string sql)
        {
            var session = NHibernateHelper.GetSession();

            var query = session.CreateSQLQuery(sql);

            var result = query.AddEntity(typeof(T)).List<T>();

            if (result.Count > 0)
                return result[0];

            return default(T);
        }

        public object RetornaObjetoUnicoComoObject(string sql)
        {
            var session = NHibernateHelper.GetSession();

            var query = session.CreateSQLQuery(sql);

            var result = query.List();

            if (result.Count > 0)
                return result[0];

            return null;
        }

        public void ExecuteUpdate(string sql)
        {
            using (var session = NHibernateHelper.GetSession())
            {
                var query = session.CreateSQLQuery(sql);
                query.ExecuteUpdate();
            }
        }

        public void Inserir(T objeto)
        {
            if (objeto == null)
                throw new Exception("Objeto não pode ser nulo");

            var session = NHibernateHelper.GetSession();

            session.Save(objeto);

            try
            {
                session.Flush();
            }
            catch (NHibernate.HibernateException ex)
            {
                session.Clear();
                throw ex;
            }
        }

        public void Atualizar(T objeto)
        {
            if (objeto == null)
                throw new Exception("Objeto não pode ser nulo");

            var session = NHibernateHelper.GetSession();
            session.Update(objeto);

            try
            {
                session.Flush();
            }
            catch (NHibernate.HibernateException ex)
            {
                session.Clear();
                throw ex;
            }
        }

        public void Deletar(T objeto)
        {
            if (objeto == null)
                throw new Exception("Objeto não pode ser nulo");

            var session = NHibernateHelper.GetSession();
            session.Delete(objeto);

            try
            {
                session.Flush();
            }
            catch (NHibernate.HibernateException ex)
            {
                session.Clear();
                throw ex;
            }
        }
    }
}
