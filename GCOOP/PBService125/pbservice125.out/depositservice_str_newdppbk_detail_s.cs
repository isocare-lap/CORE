//**************************************************************************
//
//                        Sybase Inc. 
//
//    THIS IS A TEMPORARY FILE GENERATED BY POWERBUILDER. IF YOU MODIFY 
//    THIS FILE, YOU DO SO AT YOUR OWN RISK. SYBASE DOES NOT PROVIDE 
//    SUPPORT FOR .NET ASSEMBLIES BUILT WITH USER-MODIFIED CS FILES. 
//
//**************************************************************************

#line 1 "c:\\gcoop_all\\core\\gcoop\\pbservice125\\pbsrvbiz\\depositservice.pbl\\depositservice.pblx\\str_newdppbk_detail.srs"
#line hidden
[Sybase.PowerBuilder.PBGroupAttribute("str_newdppbk_detail",Sybase.PowerBuilder.PBGroupType.Structure,"","c:\\gcoop_all\\core\\gcoop\\pbservice125\\pbsrvbiz\\depositservice.pbl\\depositservice.pblx",null,"pbservice125")]
internal class c__str_newdppbk_detail : Sybase.PowerBuilder.PBStructure
{
	public Sybase.PowerBuilder.PBString ls_bookno = Sybase.PowerBuilder.PBString.DefaultValue;
	public Sybase.PowerBuilder.PBString ls_reson = Sybase.PowerBuilder.PBString.DefaultValue;
	public Sybase.PowerBuilder.PBString ls_entryid = Sybase.PowerBuilder.PBString.DefaultValue;
	public Sybase.PowerBuilder.PBString ls_apvid = Sybase.PowerBuilder.PBString.DefaultValue;
	public Sybase.PowerBuilder.PBDateTime ldtm_newdate = Sybase.PowerBuilder.PBDateTime.DefaultValue;
	public Sybase.PowerBuilder.PBString ls_depttype = Sybase.PowerBuilder.PBString.DefaultValue;
	public Sybase.PowerBuilder.PBString ls_accno = Sybase.PowerBuilder.PBString.DefaultValue;
	public Sybase.PowerBuilder.PBInt li_return = Sybase.PowerBuilder.PBInt.DefaultValue;
	public Sybase.PowerBuilder.PBString ls_booktype = Sybase.PowerBuilder.PBString.DefaultValue;
	public Sybase.PowerBuilder.PBInt li_normflag = Sybase.PowerBuilder.PBInt.DefaultValue;

	public override object Clone()
	{
		c__str_newdppbk_detail vv = (c__str_newdppbk_detail)base.Clone();
 		vv.ls_bookno = ls_bookno;
		vv.ls_reson = ls_reson;
		vv.ls_entryid = ls_entryid;
		vv.ls_apvid = ls_apvid;
		vv.ldtm_newdate = ldtm_newdate;
		vv.ls_depttype = ls_depttype;
		vv.ls_accno = ls_accno;
		vv.li_return = li_return;
		vv.ls_booktype = ls_booktype;
		vv.li_normflag = li_normflag;
		return vv;
	}

	public static explicit operator c__str_newdppbk_detail(Sybase.PowerBuilder.PBAny v)
	{
		if (v.Value is Sybase.PowerBuilder.PBUnboundedArray)
		{
			Sybase.PowerBuilder.PBUnboundedArray a = (Sybase.PowerBuilder.PBUnboundedArray)v;
			c__str_newdppbk_detail vv = new c__str_newdppbk_detail();
			vv.ls_bookno = (Sybase.PowerBuilder.PBString)((Sybase.PowerBuilder.PBAny)a[1]);
			vv.ls_reson = (Sybase.PowerBuilder.PBString)((Sybase.PowerBuilder.PBAny)a[2]);
			vv.ls_entryid = (Sybase.PowerBuilder.PBString)((Sybase.PowerBuilder.PBAny)a[3]);
			vv.ls_apvid = (Sybase.PowerBuilder.PBString)((Sybase.PowerBuilder.PBAny)a[4]);
			vv.ldtm_newdate = (Sybase.PowerBuilder.PBDateTime)((Sybase.PowerBuilder.PBAny)a[5]);
			vv.ls_depttype = (Sybase.PowerBuilder.PBString)((Sybase.PowerBuilder.PBAny)a[6]);
			vv.ls_accno = (Sybase.PowerBuilder.PBString)((Sybase.PowerBuilder.PBAny)a[7]);
			vv.li_return = (Sybase.PowerBuilder.PBInt)((Sybase.PowerBuilder.PBAny)a[8]);
			vv.ls_booktype = (Sybase.PowerBuilder.PBString)((Sybase.PowerBuilder.PBAny)a[9]);
			vv.li_normflag = (Sybase.PowerBuilder.PBInt)((Sybase.PowerBuilder.PBAny)a[10]);

			return vv;
		}
		else
		{
			return (c__str_newdppbk_detail) v.Value;
		}
	}

	public override Sybase.PowerBuilder.PBUnboundedAnyArray ToUnboundedAnyArray()
	{
		Sybase.PowerBuilder.PBUnboundedAnyArray a = new Sybase.PowerBuilder.PBUnboundedAnyArray();
		a.Add(new Sybase.PowerBuilder.PBAny(this.ls_bookno));
		a.Add(new Sybase.PowerBuilder.PBAny(this.ls_reson));
		a.Add(new Sybase.PowerBuilder.PBAny(this.ls_entryid));
		a.Add(new Sybase.PowerBuilder.PBAny(this.ls_apvid));
		a.Add(new Sybase.PowerBuilder.PBAny(this.ldtm_newdate));
		a.Add(new Sybase.PowerBuilder.PBAny(this.ls_depttype));
		a.Add(new Sybase.PowerBuilder.PBAny(this.ls_accno));
		a.Add(new Sybase.PowerBuilder.PBAny(this.li_return));
		a.Add(new Sybase.PowerBuilder.PBAny(this.ls_booktype));
		a.Add(new Sybase.PowerBuilder.PBAny(this.li_normflag));

		return a;
	}
}


[Sybase.PowerBuilder.PBStructureLayoutAttribute("str_newdppbk_detail")]
[ System.Runtime.InteropServices.StructLayout( System.Runtime.InteropServices.LayoutKind.Sequential, Pack = 1, CharSet = System.Runtime.InteropServices.CharSet.Ansi )]
internal struct c__str_newdppbk_detail_ansi
{
	public string ls_bookno;
	public string ls_reson;
	public string ls_entryid;
	public string ls_apvid;
	public System.DateTime ldtm_newdate;
	public string ls_depttype;
	public string ls_accno;
	public short li_return;
	public string ls_booktype;
	public short li_normflag;

	public static implicit operator c__str_newdppbk_detail_ansi(c__str_newdppbk_detail other)
	{

		c__str_newdppbk_detail_ansi ret = new c__str_newdppbk_detail_ansi();

		ret.ls_bookno = other.ls_bookno;

		ret.ls_reson = other.ls_reson;

		ret.ls_entryid = other.ls_entryid;

		ret.ls_apvid = other.ls_apvid;

		ret.ldtm_newdate = other.ldtm_newdate;

		ret.ls_depttype = other.ls_depttype;

		ret.ls_accno = other.ls_accno;

		ret.li_return = other.li_return;

		ret.ls_booktype = other.ls_booktype;

		ret.li_normflag = other.li_normflag;

		return ret;
	}

	public static implicit operator c__str_newdppbk_detail(c__str_newdppbk_detail_ansi other)
	{

		c__str_newdppbk_detail ret = new c__str_newdppbk_detail();

		ret.ls_bookno = other.ls_bookno;

		ret.ls_reson = other.ls_reson;

		ret.ls_entryid = other.ls_entryid;

		ret.ls_apvid = other.ls_apvid;

		ret.ldtm_newdate = other.ldtm_newdate;

		ret.ls_depttype = other.ls_depttype;

		ret.ls_accno = other.ls_accno;

		ret.li_return = other.li_return;

		ret.ls_booktype = other.ls_booktype;

		ret.li_normflag = other.li_normflag;

		return ret;
	}
}


[Sybase.PowerBuilder.PBStructureLayoutAttribute("str_newdppbk_detail")]
[ System.Runtime.InteropServices.StructLayout( System.Runtime.InteropServices.LayoutKind.Sequential, Pack = 1, CharSet = System.Runtime.InteropServices.CharSet.Unicode )]
internal struct c__str_newdppbk_detail_unicode
{
	public string ls_bookno;
	public string ls_reson;
	public string ls_entryid;
	public string ls_apvid;
	public System.DateTime ldtm_newdate;
	public string ls_depttype;
	public string ls_accno;
	public short li_return;
	public string ls_booktype;
	public short li_normflag;

	public static implicit operator c__str_newdppbk_detail_unicode(c__str_newdppbk_detail other)
	{

		c__str_newdppbk_detail_unicode ret = new c__str_newdppbk_detail_unicode();

		ret.ls_bookno = other.ls_bookno;

		ret.ls_reson = other.ls_reson;

		ret.ls_entryid = other.ls_entryid;

		ret.ls_apvid = other.ls_apvid;

		ret.ldtm_newdate = other.ldtm_newdate;

		ret.ls_depttype = other.ls_depttype;

		ret.ls_accno = other.ls_accno;

		ret.li_return = other.li_return;

		ret.ls_booktype = other.ls_booktype;

		ret.li_normflag = other.li_normflag;

		return ret;
	}

	public static implicit operator c__str_newdppbk_detail(c__str_newdppbk_detail_unicode other)
	{

		c__str_newdppbk_detail ret = new c__str_newdppbk_detail();

		ret.ls_bookno = other.ls_bookno;

		ret.ls_reson = other.ls_reson;

		ret.ls_entryid = other.ls_entryid;

		ret.ls_apvid = other.ls_apvid;

		ret.ldtm_newdate = other.ldtm_newdate;

		ret.ls_depttype = other.ls_depttype;

		ret.ls_accno = other.ls_accno;

		ret.li_return = other.li_return;

		ret.ls_booktype = other.ls_booktype;

		ret.li_normflag = other.li_normflag;

		return ret;
	}
}
 