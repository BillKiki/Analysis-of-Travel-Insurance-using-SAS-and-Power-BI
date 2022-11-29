/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;


/*---------------------------------------------------------
  Before this code can run you need to fill in all the
  macro variables below.
---------------------------------------------------------*/
/*---------------------------------------------------------
  Start Macro Variables
---------------------------------------------------------*/
%let SOURCE_HOST=<Hostname>; /* The host name of the CAS server */
%let SOURCE_PORT=<Port>; /* The port of the CAS server */
%let SOURCE_LIB=<Library>; /* The CAS library where the source data resides */
%let SOURCE_DATA=<Tablename>; /* The CAS table name of the source data */
%let DEST_LIB=<Library>; /* The CAS library where the destination data should go */
%let DEST_DATA=<Tablename>; /* The CAS table name where the destination data should go */

/* Open a CAS session and make the CAS libraries available */
options cashost="&SOURCE_HOST" casport=&SOURCE_PORT;
cas mysess;
caslib _all_ assign;

/* Load ASTOREs into CAS memory */
proc casutil;
  Load casdata="Forest___TravelInsurance_9.sashdat" incaslib="Models" casout="Forest___TravelInsurance_9" outcaslib="casuser" replace;
Quit;

/* Apply the model */
proc cas;
  fcmpact.runProgram /
  inputData={caslib="&SOURCE_LIB" name="&SOURCE_DATA"}
  outputData={caslib="&DEST_LIB" name="&DEST_DATA" replace=1}
  routineCode = "

   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 13Oct2022:20:16:07
     Locale           : en_US
     Model Type       : Forest
     Interval variable: Age
     Interval variable: AnnualIncome
     Interval variable: Duration
     Interval variable: FamilyMembers
     Class variable   : ChronicDiseases
     Class variable   : Destination
     Class variable   : Distribution
     Class variable   : Employment Type
     Class variable   : EverTravelledAbroad
     Class variable   : FrequentFlyer
     Class variable   : Gender
     Class variable   : GraduateOrNot
     Class variable   : Product Name
     Class variable   : TravelInsurance
     Response variable: TravelInsurance
     ------------------------------------------*/
declare object Forest___TravelInsurance_9(astore);
call Forest___TravelInsurance_9.score('CASUSER','Forest___TravelInsurance_9');
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'I_TravelInsurance'n 'P_TravelInsuranceNo'n 'P_TravelInsuranceYes'n;
length 'I_TravelInsurance_15537'n $3;
      'I_TravelInsurance_15537'n='I_TravelInsurance'n;
'P_TravelInsuranceNo_15537'n='P_TravelInsuranceNo'n;
'P_TravelInsuranceYes_15537'n='P_TravelInsuranceYes'n;
   /*------------------------------------------*/
";

run;
Quit;

/* Persist the output table */
proc casutil;
  Save casdata="&DEST_DATA" incaslib="&DEST_LIB" casout="&DEST_DATA%str(.)sashdat" outcaslib="&DEST_LIB" replace;
Quit;
