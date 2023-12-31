using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_divsrv_req
	{
		internal str_divsrv_req(c__str_divsrv_req __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_divsrv_req __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string xml_main;
		[DataMember] 
		public string xml_detail;
		[DataMember] 
		public string xml_option;
		[DataMember] 
		public string xml_list;
		[DataMember] 
		public string entry_id;
		[DataMember] 
		public string xml_detail_refrain;
		[DataMember] 
		public string xml_rpt;
		[DataMember] 
		public string xml_rpt_sql;
		[DataMember] 
		public string reqdoc_no;
		internal void CopyTo(c__str_divsrv_req __x__)
		{
			__x__.xml_main = xml_main;
			__x__.xml_detail = xml_detail;
			__x__.xml_option = xml_option;
			__x__.xml_list = xml_list;
			__x__.entry_id = entry_id;
			__x__.xml_detail_refrain = xml_detail_refrain;
			__x__.xml_rpt = xml_rpt;
			__x__.xml_rpt_sql = xml_rpt_sql;
			__x__.reqdoc_no = reqdoc_no;
		}
		internal static void CopyFrom(out str_divsrv_req __this__, c__str_divsrv_req __x__)
		{
			__this__.xml_main = __x__.xml_main;
			__this__.xml_detail = __x__.xml_detail;
			__this__.xml_option = __x__.xml_option;
			__this__.xml_list = __x__.xml_list;
			__this__.entry_id = __x__.entry_id;
			__this__.xml_detail_refrain = __x__.xml_detail_refrain;
			__this__.xml_rpt = __x__.xml_rpt;
			__this__.xml_rpt_sql = __x__.xml_rpt_sql;
			__this__.reqdoc_no = __x__.reqdoc_no;
		}
		public static explicit operator object[](str_divsrv_req __this__)
		{
			return new object[] {
				__this__.xml_main
				,__this__.xml_detail
				,__this__.xml_option
				,__this__.xml_list
				,__this__.entry_id
				,__this__.xml_detail_refrain
				,__this__.xml_rpt
				,__this__.xml_rpt_sql
				,__this__.reqdoc_no
			};
		}
	}
} 