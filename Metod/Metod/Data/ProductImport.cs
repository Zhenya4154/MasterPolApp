//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Metod.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductImport
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductImport()
        {
            this.PartnerProductImport = new HashSet<PartnerProductImport>();
        }
    
        public int Id { get; set; }
        public int IdTypeProduct { get; set; }
        public string NameProduct { get; set; }
        public int Article { get; set; }
        public decimal MinCostForPartner { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PartnerProductImport> PartnerProductImport { get; set; }
        public virtual ProductTypeImport ProductTypeImport { get; set; }
    }
}
