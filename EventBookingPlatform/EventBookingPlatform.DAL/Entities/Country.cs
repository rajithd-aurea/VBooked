//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EventBookingPlatform.DAL.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Country
    {
        public int Pk_CountryId { get; set; }
        public string cc_fips { get; set; }
        public string cc_iso { get; set; }
        public string tld { get; set; }
        public string country_name { get; set; }
    }
}