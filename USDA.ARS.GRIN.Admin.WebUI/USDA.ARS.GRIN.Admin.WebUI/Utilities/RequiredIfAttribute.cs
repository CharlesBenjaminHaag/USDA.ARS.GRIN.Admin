using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace USDA.ARS.GRIN.Admin.WebUI.Utilities
{
    public class RequiredIfAttribute : ValidationAttribute
    {
        private String PropertyName { get; set; }
        private String ErrorMessage { get; set; }
        private Object DesiredValue { get; set; }

        public RequiredIfAttribute(String propertyName, Object desiredvalue, String errormessage)
        {
            this.PropertyName = propertyName;
            this.DesiredValue = desiredvalue;
            this.ErrorMessage = errormessage;
        }

        protected override ValidationResult IsValid(object value, ValidationContext context)
        {
            Object instance = context.ObjectInstance;
            Type type = instance.GetType();
            Object proprtyvalue = type.GetProperty(PropertyName).GetValue(instance, null);
            if (proprtyvalue.ToString() == DesiredValue.ToString() && value == null)
            {
                return new ValidationResult(ErrorMessage);
            }
            return ValidationResult.Success;
        }
    }
}