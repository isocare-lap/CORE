using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_lntrncoll
	{
		internal str_lntrncoll(c__str_lntrncoll __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_lntrncoll __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string loancontract_no;
		[DataMember] 
		public string contcoop_id;
		[DataMember] 
		public string trncollreq_code;
		[DataMember] 
		public System.DateTime trncollreq_date;
		[DataMember] 
		public string xml_trnmast;
		[DataMember] 
		public string xml_trndetail;
		[DataMember] 
		public string entry_id;
		[DataMember] 
		public string coop_id;
		[DataMember] 
		public string memcoop_id;
		internal void CopyTo(c__str_lntrncoll __x__)
		{
			__x__.loancontract_no = loancontract_no;
			__x__.contcoop_id = contcoop_id;
			__x__.trncollreq_code = trncollreq_code;
			__x__.trncollreq_date = trncollreq_date;
			__x__.xml_trnmast = xml_trnmast;
			__x__.xml_trndetail = xml_trndetail;
			__x__.entry_id = entry_id;
			__x__.coop_id = coop_id;
			__x__.memcoop_id = memcoop_id;
		}
		internal static void CopyFrom(out str_lntrncoll __this__, c__str_lntrncoll __x__)
		{
			__this__.loancontract_no = __x__.loancontract_no;
			__this__.contcoop_id = __x__.contcoop_id;
			__this__.trncollreq_code = __x__.trncollreq_code;
			__this__.trncollreq_date = __x__.trncollreq_date;
			__this__.xml_trnmast = __x__.xml_trnmast;
			__this__.xml_trndetail = __x__.xml_trndetail;
			__this__.entry_id = __x__.entry_id;
			__this__.coop_id = __x__.coop_id;
			__this__.memcoop_id = __x__.memcoop_id;
		}
		public static explicit operator object[](str_lntrncoll __this__)
		{
			return new object[] {
				__this__.loancontract_no
				,__this__.contcoop_id
				,__this__.trncollreq_code
				,__this__.trncollreq_date
				,__this__.xml_trnmast
				,__this__.xml_trndetail
				,__this__.entry_id
				,__this__.coop_id
				,__this__.memcoop_id
			};
		}
	}
} 