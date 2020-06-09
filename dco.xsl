<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:us="us"
		xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
		xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
		xmlns:rs='urn:schemas-microsoft-com:rowset'
		xmlns:z='#RowsetSchema'>
  <!-- Version 7.1.04 Updated 03/23/2007 -PHofle 
            Alt-Text data in fields displayed. 
            More TYPE colors added. 
            Fixed issue with empty character values defaulting to '0'
            
       Version 8.1.0 Updated 08/18/2011 -PHofle/SKozlov
            Enhanced utility getChar() for use with wide characters 
              
  -->
<msxsl:script language="VBScript" implements-prefix="us">
  <![CDATA[

Function getChar(sVal)
	nVal=0
  If Instr(sVal,",")>0 then
    sVal = trim(left(sVal,Instr(sVal,",")))
  End if
  If IsNumeric(sVal) Then	
    nVal=CLng(sVal)
    getChar=ChrW(nVal)
  Else
    getChar=""   
  End if
End Function

Function getConf(sVal)
	nVal=0
  If Instr(sVal,",")>0 then
    sVal = left(sVal,Instr(sVal,","))
  end if
	If IsNumeric(sVal) Then	nVal=CLng(sVal)-1
	getConf=CStr(nVal)
End Function

Function getAllText(sText,sConf)
  Dim aText
  Dim aConf
  
  getAllText=""
  
  aText = array(sText&",",",")
  aConf = array(sConf&",",",")
  
  getAllText=cstr(Ubound(aText))
  
End Function

]]></msxsl:script>

<xsl:template match="/">
	<HTML>
		<HEAD>
			<TITLE>DCO View - <xsl:value-of select="//@id"/></TITLE>
<STYLE>
  BULLNOSE
  {
  }
  TD
  {
  BACKGROUND-COLOR: white;
  BORDER-BOTTOM: thin;
  BORDER-LEFT: thin;
  BORDER-RIGHT: thin;
  BORDER-TOP: thin
  }
  TH
  {
  BACKGROUND-COLOR: lightblue;
  COLOR: darkblue
  }
  BODY
  {
  BACKGROUND-COLOR: white;
  FONT-FAMILY: Courier New;
  }
  .MainTable
  {
  BACKGROUND-COLOR: white;
  BORDER-BOTTOM: thin;
  BORDER-LEFT: thin;
  BORDER-RIGHT: thin;
  BORDER-TOP: thin;
  WIDTH: 100%
  }
  .NarrowTable
  {
  BACKGROUND-COLOR: lightsteelblue;
  BORDER-BOTTOM: thin;
  BORDER-LEFT: thin;
  BORDER-RIGHT: thin;
  BORDER-TOP: thin;
  WIDTH: 70%
  }
  .SubTable
  {
  WIDTH: 100%
  }
  .TDFiller
  {
  COLOR: lightcyan;
  BACKGROUND-COLOR: lightcyan
  }
  .Remark
  {
  BACKGROUND-COLOR: white;
  COLOR: black
  }
  .Batch
  {
  BACKGROUND-COLOR: blue;
  COLOR: white
  }
  .Page
  {
  BACKGROUND-COLOR: orange;
  COLOR: black
  }
  .Doc
  {
  BACKGROUND-COLOR: lightgreen;
  COLOR: black
  }
  .Value
  {
  BACKGROUND-COLOR: lightyellow;
  COLOR: black
  }
  .Plain
  {
  COLOR: maroon
  }
  .General
  {
  BACKGROUND-COLOR: white;
  FONT-WEIGHT: bolder;
  COLOR: steelblue
  }
  .Ess
  {
  BACKGROUND-COLOR: black;
  COLOR: white
  }
  .Number
  {
  TEXT-ALIGN: right
  }
</STYLE>
		</HEAD>
        <BODY>
			<TABLE>
				<xsl:apply-templates select="*"/>
			</TABLE>
        </BODY>
    </HTML>
</xsl:template>

<xsl:template match="V">
	<TR>
		<TD class="TDFiller"></TD>
		<TD><FONT class="Remark"><xsl:value-of select="@n"/><xsl:text> : </xsl:text></FONT>
		<A>
			<xsl:if test="@n='DATAFILE'">
				<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
			</xsl:if>
			<FONT class="General"><xsl:value-of select="."/></FONT>
		</A>
		</TD>
	</TR>
</xsl:template>

<xsl:template match="*">
	<xsl:if test="name(.)='B' or name(.)='D' or name(.)='P' or name(.)='F' or name(.)='S'">
		<xsl:if test="name(/*)!=name(.)"><xsl:text disable-output-escaping="yes"><![CDATA[
			<TR>
				<TD></TD>
				<TD>
		]]></xsl:text></xsl:if>
				<TABLE class="MainTable">
					<TR>
						<xsl:choose>
							<xsl:when test="name(.)='S'">
                <TH width="5%" class="Ess">S</TH>
                <TH width="95%" align="left" class="Ess"><xsl:value-of select="@type"/><xsl:value-of select="@id"/></TH>
              </xsl:when>
							<xsl:when test="name(.)='B'">
                <TH width="5%" class="Batch">B</TH>
                <TH width="95%" align="left" class="Batch"><xsl:value-of select="@type"/><xsl:value-of select="@id"/></TH>
              </xsl:when>
							<xsl:when test="name(.)='D'"><TH width="5%" class="Doc">D</TH>
                <TH width="95%" class="Doc" align="left">
                  <xsl:value-of select="@type"/>
                  <xsl:value-of select="@id"/>
                </TH>
              </xsl:when>
							<xsl:when test="name(.)='P'"><TH width="5%" class="Page">P</TH>
                <TH width="95%" class="Page" align="left">
                  <xsl:value-of select="@type"/>
                  <xsl:value-of select="@id"/>
                </TH>
              </xsl:when>
							<xsl:otherwise>
                <TH width="5%">F</TH>
                <TH width="95%" align="left">
                  <xsl:value-of select="@type"/>
                  <xsl:value-of select="@id"/>
                </TH>
              </xsl:otherwise>
            </xsl:choose>

					</TR>
					<xsl:choose>
						<xsl:when test="name(.)='F'">
							<TR><TD class="TDFiller"></TD><TD><FONT class="Remark">Text value<xsl:text> : </xsl:text></FONT><FONT class="Value"><xsl:apply-templates select="*[name()='C']" mode="text"/></FONT></TD></TR>
							<TR><TD class="TDFiller"></TD><TD><FONT class="Remark">Char confi<xsl:text> : </xsl:text></FONT><FONT class="Value"><xsl:apply-templates select="*[name()='C']" mode="conf"/></FONT></TD></TR>
    					<xsl:apply-templates select="*[name()!='C']"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="*"/>
						</xsl:otherwise>
					</xsl:choose>
				</TABLE>
		<xsl:if test="name(/)!=name(.)"><xsl:text disable-output-escaping="yes"><![CDATA[
			</TD>
		</TR>
		]]></xsl:text></xsl:if>
	</xsl:if>
</xsl:template>

<xsl:template match="C" mode="text">
	<xsl:value-of select="us:getChar(string(.))"/>
</xsl:template>

<xsl:template match="C" mode="conf">
	<xsl:value-of select="us:getConf(string(./@cn))"/>
</xsl:template>

</xsl:stylesheet>

