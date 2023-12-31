using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct n_cst_dbconnectservice
	{
		internal n_cst_dbconnectservice(c__n_cst_dbconnectservice __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__n_cst_dbconnectservice __x__)
		{
			CopyFrom(out this, __x__);
		}
		public Sybase.PowerBuilder.PBTransaction itr_dbconnection;
		[DataMember] 
		public string is_coopid;
		[DataMember] 
		public string is_coopcontrol;
		[DataMember] 
		public string is_gcoop_path;
		internal void CopyTo(c__n_cst_dbconnectservice __x__)
		{
			__x__.itr_dbconnection = null;
			__x__.is_coopid = is_coopid;
			__x__.is_coopcontrol = is_coopcontrol;
			__x__.is_gcoop_path = is_gcoop_path;
		}
		internal static void CopyFrom(out n_cst_dbconnectservice __this__, c__n_cst_dbconnectservice __x__)
		{
			__this__.itr_dbconnection = null;
			__this__.is_coopid = __x__.is_coopid;
			__this__.is_coopcontrol = __x__.is_coopcontrol;
			__this__.is_gcoop_path = __x__.is_gcoop_path;
		}
		public static explicit operator object[](n_cst_dbconnectservice __this__)
		{
			return new object[] {
				__this__.itr_dbconnection
				,__this__.is_coopid
				,__this__.is_coopcontrol
				,__this__.is_gcoop_path
			};
		}
	}
} 