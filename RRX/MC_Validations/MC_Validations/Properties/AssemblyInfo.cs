using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

// General Information about an assembly is controlled through the following 
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle("MC_Validation")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("")]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]

// Setting ComVisible to false makes the types in this assembly not visible 
// to COM components.  If you need to access a type in this assembly from 
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible(false)]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid("e3407e90-2a33-41d3-8f7a-b5b48c49f8dc")]

// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Build and Revision Numbers 
// by using the '*' as shown below:
// [assembly: AssemblyVersion("1.0.*")]
[assembly: AssemblyVersion("9.1.7.0")]  // DO NOT CHANGE
[assembly: AssemblyFileVersion("9.1.7.75")]

/// Version 9.0.4.74 Updated 10/29/2015 PHofle RTC 134476
/// * AddToErrorMsg fixed to allow for comma characters in the message body.
/// 
/// Version 9.0.3.73 Updated 03/05/2015 PHofle 
/// * DCO character objects created for OMR are initialized to blank.
/// * Added logic to check character positions relative to CCO lineation for address parsing. 
///   Will add missing VbCr (ASCII 10) character between lines missing a separator.
///   

///   
/// Version 9.0.0.72 Updated 09/23/2014 PHofle
/// * Updated help for action CommonParseAddress
/// 
/// Version 9.0.0.71 Updated 04/02/2014 PHofle
/// * Fixed logic of CalculateHCFALineCharges to sum using total line charges and not to include units count
///   for the line item.
/// 
/// Version 8.1.0.70 Updated 12/12/2013 PHofle
/// * New action ParseEPSDT that detects and parses Reason Code data elements from the calling field value.
///   Valid codes are AV, S2, ST or NU. Value is parsed to a SmartParameter enabled argument which designates
///   the target field.
/// 
/// Version 8.1.0.69 Updated 11/13/2013 PHofle
///  * Fixed syntax bug introduced in prior version.  
///  * CalculateHCFALineCharges fixed to compensate for non numeric capture.
///  
/// Version 8.1.0.68 Updated 10/30/2013 PHofle
/// * Transform_LI updated to include fields 24hCode1 to 24hCode6 mapped to lineitem field EPSDTcode
/// * New action ParseConditionCodes that detects and parses Condition Code data elements from the calling field value.
///   Valid codes are AA, AB, AC, AD, AE, AF, AG, AH, AI, W2, W3, W4 or W5.
///   Condition Code data is parsed to fields CCode1 through CCode4.
///   
/// Version 8.1.0.67 Updated 05/24/2013 PHofle
/// * Fixed return value help for AddToDetailErrorMsg and AddToErrorMsg actions.
/// 
/// Version 8.1.0.66 Updated 03/11/2013 PHofle
/// * Deprecated CalcuateUB, CalculateResult, ValidateStateMil
/// * Removed Parse82name, Parse83aname, Parse83bname, ParseUBEighties
/// 
/// Version 8.1.0.65 Updated 03/11/2013 PHofle
/// * Conversion to RRX dll format.
/// 