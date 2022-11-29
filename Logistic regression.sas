/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 13Oct2022:13:51:34
     Locale           : en_US
     Model Type       : Logistic Regression
     Interval variable: Age
     Interval variable: AnnualIncome
     Interval variable: Duration
     Interval variable: FamilyMembers
     Class variable   : ChronicDiseases
     Class variable   : Destination
     Class variable   : Employment Type
     Class variable   : EverTravelledAbroad
     Class variable   : FrequentFlyer
     Class variable   : GraduateOrNot
     Class variable   : Product Name
     Class variable   : Gender
     Class variable   : Distribution
     Class variable   : TravelInsurance
     Response variable: TravelInsurance
     Distribution     : Binary
     Link Function    : Logit
     ------------------------------------------*/
   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 13Oct2022:13:51:34
     -------------------------------------------------------*/

   /*---------------------------------------------------------
   Defining temporary arrays and variables   
     -------------------------------------------------------*/
   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_17540_0_{92} _temporary_;
   array _beta_17540_0_{92} _temporary_ (   -0.64187957630067
          -0.03991109973539
                          0
           -0.0994036301174
          -0.05549912833498
          -11.1838004448092
           1.40695978923041
           9.04562289174048
           11.1995652783258
          -10.0376621441185
           0.54029326122144
          -10.8249010799803
          -0.75691438688342
          -0.49946448093374
           0.20079782662145
          -0.47564875587451
          -10.4273621709833
          -10.7409548052951
          -11.1596363830968
           0.86606068938804
           1.71148699254033
           0.67420929039103
           0.73944855022631
           0.75903538340385
           1.78814466129744
           0.23852920947054
           0.21826100667075
          -0.11574763745834
           10.8621171503944
           2.06996908676385
          -0.31232511690318
           9.98018559747904
           0.10581850579059
           1.27635598145426
          -10.2149456754706
          -0.00827993063232
          -10.5027056084067
          -0.09161693139049
           -10.868584226048
           10.2762743989238
          -1.18024995472151
           0.24343477925158
           11.1935470458205
           -0.7297524526793
           1.67601982566308
           0.05432468781483
          -10.3629125878475
            0.1606920213761
           9.42283576525349
           0.19057303275257
          -0.54731366864451
          -11.2653695735773
          -10.7813509725046
          -11.0539542336128
          -10.1223689397238
           0.03774403816684
          -0.34890498325692
           1.18296702641816
          -1.13608138485767
           1.29686457489921
           0.05354584824607
           0.08353701172163
          -0.33037152926624
          -0.52325831968296
           0.02159519463606
          -0.20109596934752
           0.24095143197011
           10.1618979678063
           0.95050210068163
                          0
          -0.17572138090011
                          0
          -1.51937717966549
                          0
          -0.34132674282325
                          0
          -0.01995520633469
                          0
           0.05184450736944
           0.34959283236672
            0.0507118492856
           0.18182845209532
           0.16925317377658
                          0
           0.47338388214082
                          0
            0.7236723724784
                          0
            0.0364342616118
         8.3575699731651E-7
           0.00072329598055
           0.08798776835989);

   length _EverTravelledAbroad_ $3; drop _EverTravelledAbroad_;
   _EverTravelledAbroad_ = left(trim(put(EverTravelledAbroad,$3.)));
   length _FrequentFlyer_ $3; drop _FrequentFlyer_;
   _FrequentFlyer_ = left(trim(put(FrequentFlyer,$3.)));
   length '_Employment Type_'n $28; drop '_Employment Type_'n;
   '_Employment Type_'n = left(trim(put('Employment Type'n,$28.)));
   length _Distribution_ $7; drop _Distribution_;
   _Distribution_ = left(trim(put(Distribution,$7.)));
   length _GraduateOrNot_ $3; drop _GraduateOrNot_;
   _GraduateOrNot_ = left(trim(put(GraduateOrNot,$3.)));
   length '_Product Name_'n $31; drop '_Product Name_'n;
   '_Product Name_'n = left(trim(put('Product Name'n,$31.)));
   length _Gender_ $6; drop _Gender_;
   _Gender_ = left(trim(put(Gender,$6.)));
   length _Destination_ $42; drop _Destination_;
   _Destination_ = left(trim(put(Destination,$42.)));
   length _ChronicDiseases_ $3; drop _ChronicDiseases_;
   _ChronicDiseases_ = left(trim(put(ChronicDiseases,$3.)));
   /*------------------------------------------*/
   /*Missing values in model variables result  */
   /*in missing values for the prediction.     */
   if missing(AnnualIncome) 
      or missing(FamilyMembers) 
      or missing(Duration) 
      or missing(Age) 
      then do;
         _badval_ = 1;
         goto skip_17540_0;
   end;
   /*------------------------------------------*/

   do _i_=1 to 92; _xrow_17540_0_{_i_} = 0; end;

   _xrow_17540_0_[1] = 1;

   _temp_ = 1;
   select (_ChronicDiseases_);
      when ('No') _xrow_17540_0_[2] = _temp_;
      when ('Yes') _xrow_17540_0_[3] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select (_Destination_);
      when ('AUSTRALIA') _xrow_17540_0_[4] = _temp_;
      when ('AUSTRIA') _xrow_17540_0_[5] = _temp_;
      when ('AZERBAIJAN') _xrow_17540_0_[6] = _temp_;
      when ('BANGLADESH') _xrow_17540_0_[7] = _temp_;
      when ('BELARUS') _xrow_17540_0_[8] = _temp_;
      when ('BOSNIA AND HERZEGOVINA') _xrow_17540_0_[9] = _temp_;
      when ('BRAZIL') _xrow_17540_0_[10] = _temp_;
      when ('BRUNEI DARUSSALAM') _xrow_17540_0_[11] = _temp_;
      when ('BULGARIA') _xrow_17540_0_[12] = _temp_;
      when ('CAMBODIA') _xrow_17540_0_[13] = _temp_;
      when ('CANADA') _xrow_17540_0_[14] = _temp_;
      when ('CHINA') _xrow_17540_0_[15] = _temp_;
      when ('COSTA RICA') _xrow_17540_0_[16] = _temp_;
      when ('CROATIA') _xrow_17540_0_[17] = _temp_;
      when ('CZECH REPUBLIC') _xrow_17540_0_[18] = _temp_;
      when ('DENMARK') _xrow_17540_0_[19] = _temp_;
      when ('FINLAND') _xrow_17540_0_[20] = _temp_;
      when ('FRANCE') _xrow_17540_0_[21] = _temp_;
      when ('GERMANY') _xrow_17540_0_[22] = _temp_;
      when ('GREECE') _xrow_17540_0_[23] = _temp_;
      when ('HONG KONG') _xrow_17540_0_[24] = _temp_;
      when ('ICELAND') _xrow_17540_0_[25] = _temp_;
      when ('INDIA') _xrow_17540_0_[26] = _temp_;
      when ('INDONESIA') _xrow_17540_0_[27] = _temp_;
      when ('IRELAND') _xrow_17540_0_[28] = _temp_;
      when ('ISRAEL') _xrow_17540_0_[29] = _temp_;
      when ('ITALY') _xrow_17540_0_[30] = _temp_;
      when ('JAPAN') _xrow_17540_0_[31] = _temp_;
      when ('JORDAN') _xrow_17540_0_[32] = _temp_;
      when ('KOREA, REPUBLIC OF') _xrow_17540_0_[33] = _temp_;
      when ('LAO PEOPLE''S DEMOCRATIC REPUBLIC') _xrow_17540_0_[34] = _temp_;
      when ('LEBANON') _xrow_17540_0_[35] = _temp_;
      when ('MACAO') _xrow_17540_0_[36] = _temp_;
      when ('MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF') _xrow_17540_0_[37] = _temp_;
      when ('MALAYSIA') _xrow_17540_0_[38] = _temp_;
      when ('MALDIVES') _xrow_17540_0_[39] = _temp_;
      when ('MEXICO') _xrow_17540_0_[40] = _temp_;
      when ('MONGOLIA') _xrow_17540_0_[41] = _temp_;
      when ('MYANMAR') _xrow_17540_0_[42] = _temp_;
      when ('NAMIBIA') _xrow_17540_0_[43] = _temp_;
      when ('NEPAL') _xrow_17540_0_[44] = _temp_;
      when ('NETHERLANDS') _xrow_17540_0_[45] = _temp_;
      when ('NEW ZEALAND') _xrow_17540_0_[46] = _temp_;
      when ('NIGERIA') _xrow_17540_0_[47] = _temp_;
      when ('NORWAY') _xrow_17540_0_[48] = _temp_;
      when ('PERU') _xrow_17540_0_[49] = _temp_;
      when ('PHILIPPINES') _xrow_17540_0_[50] = _temp_;
      when ('PORTUGAL') _xrow_17540_0_[51] = _temp_;
      when ('QATAR') _xrow_17540_0_[52] = _temp_;
      when ('ROMANIA') _xrow_17540_0_[53] = _temp_;
      when ('RUSSIAN FEDERATION') _xrow_17540_0_[54] = _temp_;
      when ('SAUDI ARABIA') _xrow_17540_0_[55] = _temp_;
      when ('SINGAPORE') _xrow_17540_0_[56] = _temp_;
      when ('SOUTH AFRICA') _xrow_17540_0_[57] = _temp_;
      when ('SPAIN') _xrow_17540_0_[58] = _temp_;
      when ('SRI LANKA') _xrow_17540_0_[59] = _temp_;
      when ('SWITZERLAND') _xrow_17540_0_[60] = _temp_;
      when ('TAIWAN, PROVINCE OF CHINA') _xrow_17540_0_[61] = _temp_;
      when ('THAILAND') _xrow_17540_0_[62] = _temp_;
      when ('TURKEY') _xrow_17540_0_[63] = _temp_;
      when ('UKRAINE') _xrow_17540_0_[64] = _temp_;
      when ('UNITED ARAB EMIRATES') _xrow_17540_0_[65] = _temp_;
      when ('UNITED KINGDOM') _xrow_17540_0_[66] = _temp_;
      when ('UNITED STATES') _xrow_17540_0_[67] = _temp_;
      when ('VANUATU') _xrow_17540_0_[68] = _temp_;
      when ('VENEZUELA') _xrow_17540_0_[69] = _temp_;
      when ('VIET NAM') _xrow_17540_0_[70] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select ('_Employment Type_'n);
      when ('Government Sector') _xrow_17540_0_[71] = _temp_;
      when ('Private Sector/Self Employed') _xrow_17540_0_[72] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select (_EverTravelledAbroad_);
      when ('No') _xrow_17540_0_[73] = _temp_;
      when ('Yes') _xrow_17540_0_[74] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select (_FrequentFlyer_);
      when ('No') _xrow_17540_0_[75] = _temp_;
      when ('Yes') _xrow_17540_0_[76] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select (_GraduateOrNot_);
      when ('No') _xrow_17540_0_[77] = _temp_;
      when ('Yes') _xrow_17540_0_[78] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select ('_Product Name_'n);
      when ('Basic Plan') _xrow_17540_0_[79] = _temp_;
      when ('Bronze Plan') _xrow_17540_0_[80] = _temp_;
      when ('Cancellation Plan') _xrow_17540_0_[81] = _temp_;
      when ('Gold Plan') _xrow_17540_0_[82] = _temp_;
      when ('Rental Vehicle Excess Insurance') _xrow_17540_0_[83] = _temp_;
      when ('Silver Plan') _xrow_17540_0_[84] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select (_Gender_);
      when ('Female') _xrow_17540_0_[85] = _temp_;
      when ('Male') _xrow_17540_0_[86] = _temp_;

      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _temp_ = 1;
   select (_Distribution_);
      when ('Offline') _xrow_17540_0_[87] = _temp_;
      when ('Online') _xrow_17540_0_[88] = _temp_;
      otherwise do; _badval_ = 1; goto skip_17540_0; end;
   end;

   _xrow_17540_0_[89] = Age;

   _xrow_17540_0_[90] = AnnualIncome;

   _xrow_17540_0_[91] = Duration;

   _xrow_17540_0_[92] = FamilyMembers;

   do _i_=1 to 92;
      _linp_ + _xrow_17540_0_{_i_} * _beta_17540_0_{_i_};
   end;

   skip_17540_0:
   length I_TravelInsurance $3;
   label I_TravelInsurance = 'Into: TravelInsurance';
   array _levels_17540_{2} $ 3 _TEMPORARY_ ('Yes'
   ,'No'
   );
   label P_TravelInsuranceYes = 'Predicted: TravelInsurance=Yes';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_TravelInsuranceYes = 1 / (1+exp(-_linp_));
      end; else do;
         P_TravelInsuranceYes = exp(_linp_) / (1+exp(_linp_));
      end;
      P_TravelInsuranceNo = 1 - P_TravelInsuranceYes;
      if P_TravelInsuranceYes >= 0.5                  then do;
         I_TravelInsurance = _levels_17540_{1};
      end; else do;
         I_TravelInsurance = _levels_17540_{2};
      end;
   end; else do;
      _linp_ = .;
      P_TravelInsuranceYes = .;
      P_TravelInsuranceNo = .;
      I_TravelInsurance = ' ';
   end;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'I_TravelInsurance'n 'P_TravelInsuranceYes'n 'P_TravelInsuranceNo'n;
length 'I_TravelInsurance_17540'n $3;
      'I_TravelInsurance_17540'n='I_TravelInsurance'n;
'P_TravelInsuranceYes_17540'n='P_TravelInsuranceYes'n;
'P_TravelInsuranceNo_17540'n='P_TravelInsuranceNo'n;
   /*------------------------------------------*/