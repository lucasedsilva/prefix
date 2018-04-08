using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Model
{
    public static class Singleton<T> where T : new()
    {
        static Mutex mutex = new Mutex();
        static T instance;

        public static T Instance
        {
            get
            {
                mutex.WaitOne();
                if (instance == null)
                {
                    instance = new T();
                }
                mutex.ReleaseMutex();
                return instance;
            }
        }
    }
}
