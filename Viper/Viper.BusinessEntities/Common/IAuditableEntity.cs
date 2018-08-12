using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities.Common
{
    public interface IAuditableEntity
    {
        int Id { get; set; }

        DateTime CreatedDate { get; set; }

        string CreatedBy { get; set; }

        DateTime LastUpdatedDate { get; set; }

        string LastUpdatedBy { get; set; }
    }
}
