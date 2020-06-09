<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<app name="Medical Claims">
	<k name="tmservers">
		<k name="tms" ip="127.0.0.1" port="2402" retry="3"/>
	</k>
	<k name="runtime" v="batches"/>
	<k name="fingerprint" v="fingerprint"/>
	<k name="export" v="export"/>
	<k name="tmengine" cs="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=[path/]MClaimsEng.mdb;"/>
	<k name="tmadmin" cs="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=[path/]MClaimsAdm.mdb;"/>
	<k name="dco_Professional">
		<k name="fingerprintconn" cs="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Datacap\Medical Claims\MClaimsFingerprint.mdb"/>
		<k name="lookupdb" cs="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Datacap\Medical Claims\MClaimsLook.mdb"/>
		<k name="vscanimagedir" v="images"/>
		<k name="setupdco" v="Professional.xml"/>
		<k name="imagefix" v="imagefix.ini"/>
		<k name="imagefixblack" v="imagefixbl_p.ini"/>
		<k name="rules" v="rules"/>
		<k name="UseFPXML" v="False"/>
	</k>
	<k name="dco_Institutional">
		<k name="fingerprintconn" cs="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Datacap\Medical Claims\MClaimsFingerprint.mdb"/>
		<k name="lookupdb" cs="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Datacap\Medical Claims\MClaimsLook.mdb"/>
		<k name="vscanimagedir" v="images"/>
		<k name="setupdco" v="Institutional.xml"/>
		<k name="imagefix" v="imagefix.ini"/>
		<k name="imagefixblack" v="imagefixbl_i.ini"/>
		<k name="rules" v="rules"/>
		<k name="UseFPXML" v="False"/>
	</k>
	<k name="tasks">
		<k name="P_Vscan" profile="VScan"/>
		<k name="P_DocIntegrity" profile="DocIntegrity"/>
		<k name="P_DocIntegrityBL" profile="DocIntegrityBL"/>
		<k name="P_IdentifyFixUp" profile="IdentifyFixUp"/>
		<k name="P_IdentifyFixUpBL" profile="IdentifyFixUp"/>
		<k name="P_Recog" profile="Recog ICR_C"/>
		<k name="P_RecogBL" profile="Recog ICR_C"/>
		<k name="P_PreValidate" profile="Pre_Validate"/>
		<k name="P_Split" profile="Split"/>
		<k name="P_PreExport" profile="PreExport"/>
		<k name="P_837 Export" profile="Export 837"/>
		<k name="I_Vscan" profile="VScan"/>
		<k name="I_DocIntegrity" profile="DocIntegrity"/>
		<k name="I_DocIntegrityBL" profile="DocIntegrityBL"/>
		<k name="I_IdentifyFixUp" profile="IdentifyFixUp"/>
		<k name="I_IdentifyFixUpBL" profile="IdentifyFixUp"/>
		<k name="I_Recog" profile="Recog ICR_C"/>
		<k name="I_RecogBL" profile="Recog ICR_C"/>
		<k name="I_PreValidate" profile="PreValidate"/>
		<k name="I_Split" profile="Split"/>
		<k name="I_PreExport" profile="PreExport"/>
		<k name="I_837Export" profile="Export 837"/>
	</k>
</app>