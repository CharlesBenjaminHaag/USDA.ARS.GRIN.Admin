using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin
{
    public enum LoginResultEnum
    {
        SUCCESS,
        USER_NOT_FOUND,
        INVALID_PASSWORD,
        SYSTEM_ERROR
    }
}