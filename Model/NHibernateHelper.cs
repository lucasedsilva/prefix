using NHibernate;
using NHibernate.Cfg;
using NHibernate.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model
{
    public class NHibernateHelper
    {
        private static ISessionFactory _sessionFactory;

        public static ISession GetSession()
        {
            if (_sessionFactory == null)
            {
                lock (typeof(NHibernateHelper))
                {
                    if (_sessionFactory == null)
                    {
                        Configuration cfg = new Configuration();
                        cfg.AddAssembly("Model");
                        _sessionFactory = cfg.BuildSessionFactory();
                    }
                }
            }

            return _sessionFactory.OpenSession();
        }

        private NHibernateHelper()
        {
        }
    }
}