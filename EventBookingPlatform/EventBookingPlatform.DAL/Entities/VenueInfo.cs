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
    
    public partial class VenueInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public VenueInfo()
        {
            this.ChildrenOptionComments = new HashSet<ChildrenOptionComment>();
            this.DisabledOptionComments = new HashSet<DisabledOptionComment>();
            this.Halls = new HashSet<Hall>();
            this.ParkingOptionComments = new HashSet<ParkingOptionComment>();
            this.VenueCertificates = new HashSet<VenueCertificate>();
            this.VenueCharacterizations = new HashSet<VenueCharacterization>();
            this.VenueChildrenOptions = new HashSet<VenueChildrenOption>();
            this.VenueContacts = new HashSet<VenueContact>();
            this.VenueDescriptions = new HashSet<VenueDescription>();
            this.VenueDisabledOptions = new HashSet<VenueDisabledOption>();
            this.VenueEvents = new HashSet<VenueEvent>();
            this.VenueFacilities = new HashSet<VenueFacility>();
            this.VenueParkingOptions = new HashSet<VenueParkingOption>();
            this.VenueWaitingRoomOptions = new HashSet<VenueWaitingRoomOption>();
            this.WaitingRoomOptionComments = new HashSet<WaitingRoomOptionComment>();
        }
    
        public int Pk_VenueId { get; set; }
        public bool Approved { get; set; }
        public string Id { get; set; }
        public int Status { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string FoundationYr { get; set; }
        public string RegNo { get; set; }
        public string RenovationYr { get; set; }
        public string Area { get; set; }
        public string OpenSpace { get; set; }
        public string Service { get; set; }
        public string SeasonActs { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string ZipCode { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChildrenOptionComment> ChildrenOptionComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DisabledOptionComment> DisabledOptionComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hall> Halls { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ParkingOptionComment> ParkingOptionComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueCertificate> VenueCertificates { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueCharacterization> VenueCharacterizations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueChildrenOption> VenueChildrenOptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueContact> VenueContacts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueDescription> VenueDescriptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueDisabledOption> VenueDisabledOptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueEvent> VenueEvents { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueFacility> VenueFacilities { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueParkingOption> VenueParkingOptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VenueWaitingRoomOption> VenueWaitingRoomOptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WaitingRoomOptionComment> WaitingRoomOptionComments { get; set; }
    }
}
