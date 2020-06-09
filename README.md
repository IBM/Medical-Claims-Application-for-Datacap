
# Medical Claims


Medical Claims is a software solution that automates data entry from professional claim forms (CMS 1500). Data entry is automated from forms that are used by individual medical providers or suppliers, and from institutional claim forms (UB04), that are used by institutional providers such as hospitals.

Medical Claims manages the entire capture process, from scanning of claims forms, enhancement of the images to increase recognition accuracy, recognition of data fields, and the validation and verification of data. Medical Claims then coordinates the upload of HIPAA-compliant claim data to adjudication systems for payment, and exports images and index data to content management systems through integration interfaces. It eliminates costly, error-prone manual data entry and accelerates claim processing.

Datacap Studio provides an enhanced environment for creating and maintaining rules. Claim forms can be captured by using a scanner or other capture device, or can be previously scanned for the digital images to be saved to a folder. Professional (CMS 1500) forms and institutional (UB04) forms are now processed in separate workflow. In these workflows, red dropout (data alone) claims, and black (with lines and boxes) claims must be batched and scanned separately.

Medical Claims recognizes machine print data (OCR), handprint data (ICR), and bar codes on the forms. Extensive validations are then applied to the claim data to ensure that accuracy. Validations include lookups for fields such as state codes, member IDs, diagnostic codes, and place of service. Other validations check for required fields and appropriate data formats. The form data and snippets of the claim image are then presented in a verification pane for an operator to review and, if necessary, make corrections. Fields that need attention are automatically highlighted for the operator. Verification panes can be in Windows-based or browser-based. After the operator reviews the form, the data verification is again applied to ensure that accuracy. Medical Claims then creates EDI 837 formatted data files from the claims data. The formats of these files are typically customized for the target business and adjudication systems.

# Using Medical Claims Application from GitHub repository

## Prerequisites
1. Ensure the version of .Net is compatible with the correct version of Datacap. For example, Datacap 9.1.7 supports .Net version 4.7.2.
2. To ensure a successful build, provide the references of iRRX.dll file to the MC_Identify and MC_Validation Project. If the installation is default i.e. in C:\ , then reference path is C:\Datacap\dcshared\NET\iRRX.dll. 

After you have successfully executed the build, complete the following steps:

1. Copy "Medical Claims\ImageFix.ini"  to "Medical Claims\dco_Institutional\"
2. Copy "Medical Claims\ImageFix.ini"  to "Medical Claims\dco_Professional\"
3. Copy "Medical Claims\RRX\5010Common.rrx"  to "Medical Claims\dco_Institutional\rules\"
4. Copy "Medical Claims\RRX\5010Common.rrx"  to "Medical Claims\dco_Professional\rules\"
5. Copy "Medical Claims\RRX\5010Institutional.rrx"  to "Medical Claims\dco_Institutional\rules\"
6. Copy "Medical Claims\RRX\5010Professional.rrx"  to "Medical Claims\dco_Professional\rules\" 

dco_Institutional and dco_Professional are now ready to use.
