using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI
{
    public class UserNotFoundException : ApplicationException
    {
        public UserNotFoundException()
        : base() { }

        public UserNotFoundException(string message)
            : base(message) { }

        public UserNotFoundException(string format, params object[] args)
            : base(string.Format(format, args)) { }

        public UserNotFoundException(string message, Exception innerException)
            : base(message, innerException) { }
    }
}