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
  Load casdata="Gradient_boosting_Best_Algo.sashdat" incaslib="Models" casout="Gradient_boosting_Best_Algo" outcaslib="casuser" replace;
Quit;

/* Apply the model */
proc cas;
  fcmpact.runProgram /
  inputData={caslib="&SOURCE_LIB" name="&SOURCE_DATA"}
  outputData={caslib="&DEST_LIB" name="&DEST_DATA" replace=1}
  routineCode = "

   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 13Oct2022:17:35:32
     Locale           : en_US
     Model Type       : Gradient Boosting
     Interval variable: AnnualIncome
     Interval variable: Age
     Class variable   : Destination
     Class variable   : EverTravelledAbroad
     Class variable   : FrequentFlyer
     Class variable   : TravelInsurance
     Response variable: TravelInsurance
     ------------------------------------------*/
declare object Gradient_boosting_Best_Algo(astore);
call Gradient_boosting_Best_Algo.score('CASUSER','Gradient_boosting_Best_Algo');
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'I_TravelInsurance'n 'P_TravelInsuranceNo'n 'P_TravelInsuranceYes'n;
length 'I_TravelInsurance_35294'n $3;
      'I_TravelInsurance_35294'n='I_TravelInsurance'n;
'P_TravelInsuranceNo_35294'n='P_TravelInsuranceNo'n;
'P_TravelInsuranceYes_35294'n='P_TravelInsuranceYes'n;
   /*------------------------------------------*/
";

run;
Quit;

/* Persist the output table */
proc casutil;
  Save casdata="&DEST_DATA" incaslib="&DEST_LIB" casout="&DEST_DATA%str(.)sashdat" outcaslib="&DEST_LIB" replace;
Quit;
