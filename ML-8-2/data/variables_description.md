Data field | Description |
--- | ---|
`ODATEDW `  | Origin Date. Date of donor's first gift to the PVA `YYMM` format (Year/Month). 
`OSOURCE` | Origin Source <br /> - Only 1rst 3 bytes are used <br /> - Defaulted to 00000 for conversion <br /> - Code indicating which mailing list the donor was originally acquired from <br />- A nominal or symbolic field. 
`TCODE ` | Donor title code <br /> 000=_ <br /> 001=MR. <br /> 001001 = MESSRS. <br /> 001002=MR. & MRS. <br /> 002=MRS. <br /> 002002=MESDAMES <br /> 003=MISS <br /> 003003=MISSES <br /> 004=DR.<br /> 004002=DR. & MRS. <br /> 004004=DOCTORS <br /> 005=MADAME <br /> 006=SERGEANT <br /> 009=RABBI <br /> 010=PROFESSOR <br /> 010002=PROFESSOR & MRS. <br /> 010010=PROFESSORS <br />  011=ADMIRAL <br />  011002=ADMIRAL & MRS. <br />  012=GENERAL <br />  012002=GENERAL & MRS. <br />  013=COLONEL <br />  013002=COLONEL & MRS. <br />  014=CAPTAIN <br />  014002=CAPTAIN & MRS. <br />  015=COMMANDER <br />  015002=COMMANDER & MRS. <br />  016=DEAN <br /> 017=JUDGE <br />  017002=JUDGE & MRS. <br /> 018=MAJOR <br />  018002=MAJOR & MRS. <br /> 019=SENATOR <br /> 020=GOVERNOR <br /> 021002=SERGEANT & MRS. <br />  022002=COLNEL & MRS. <br />  024=LIEUTENANT <br />  026=MONSIGNOR <br /> 027=REVEREND <br /> 028=MS. <br /> 028028=MSS. <br /> 029=BISHOP <br /> 031=AMBASSADOR <br /> 031002=AMBASSADOR & MRS.  <br /> 033=CANTOR <br /> 036=BROTHER <br /> 037=SIR <br /> 038=COMMODORE <br /> 040=FATHER <br /> 042=SISTER <br /> 043=PRESIDENT <br /> 044=MASTER <br /> 046=MOTHER <br /> 047=CHAPLAIN <br /> 048=CORPORAL <br /> 050=ELDER <br /> 056=MAYOR <br /> 059002=LIEUTENANT & MRS. <br /> 062=LORD <br /> 063=CARDINAL <br /> 064=FRIEND <br /> 065=FRIENDS <br /> 068=ARCHDEACON <br /> 069=CANON <br /> 070=BISHOP <br /> 072002=REVEREND & MRS. <br /> 073=PASTOR <br /> 075=ARCHBISHOP <br /> 085=SPECIALIST <br /> 087=PRIVATE <br /> 089=SEAMAN <br /> 090=AIRMAN <br /> 091=JUSTICE <br /> 092=MR. JUSTICE <br /> 100=M. <br /> 103=MLLE. <br /> 104=CHANCELLOR<br /> 106=REPRESENTATIVE<br /> 107=SECRETARY<br /> 108=LT. GOVERNOR<br /> 109=LIC.<br /> 111=SA.<br /> 114=DA.<br /> 116=SR.<br /> 117=SRA.<br /> 118=SRTA.<br /> 120=YOUR MAJESTY<br /> 122=HIS HIGHNESS<br /> 123=HER HIGHNESS<br /> 124=COUNT<br /> 125=LADY<br /> 126=PRINCE<br /> 127=PRINCESS<br /> 128=CHIEF<br /> 129=BARON<br /> 130=SHEIK<br /> 131=PRINCE AND PRINCESS<br /> 132=YOUR IMPERIAL MAJEST<br /> 135=M. ET MME.<br /> 210=PROF.
`STATE` | State abbreviation (a nominal/symbolic field)
`ZIP` | Zipcode (a nominal/symbolic field)
`MAILCODE` | Mail Code <br /> " "=Address is OK <br /> B=Bad Address
`PVASTATE` | EPVA State or PVA State <br /> Indicates whether the donor lives in a state <br /> served by the organization's EPVA chapter <br /> P=PVA State <br /> E=EPVA State (Northeastern US)
`DOB` | Date of birth (`YYMM`, Year/Month format)
`NOEXCH` | Do Not Exchange Flag (For list rental) <br /> _=can be exchanged <br /> X = do not exchange
`RECINHSE` | In House File Flag <br /> _=Not an In House Record <br /> X=Donor has given to PVA's In House program
`RECP3` | P3 File Flag <br /> _=Not a P3 Record <br /> X=Donor has given to PVA's P3 program
`RECPGVG` | Planned Giving File Flag <br /> _=Not a Planned Giving Record <br /> X=Planned Giving Record
`RECSWEEP` | Sweepstakes file flag <br /> _=Not a Sweepstakes Record <br /> X=Sweepstakes Record
`MDMAUD` |  The Major Donor Matrix code <br /> The codes describe frequency and amount of giving for donors who have given a $100+ gift at any time in their giving history. <br /> An RFA (recency/frequency/monetary) field. <br /> The (current) concatenated version is a nominal or symbolic field. The individual bytes could separately be used as fields and refer to the following: <br /><br /> 1st byte: **Recency of Giving** <br /> &nbsp; C=Current Donor <br />  &nbsp; L=Lapsed Donor <br /> &nbsp; I=Inactive Donor <br /> &nbsp; D=Dormant Donor <br /><br /> 2nd byte: **Frequency of Giving** <br /> &nbsp; 1=One gift in the period of recency <br /> &nbsp; 2=Two-Four gifts in the period of recency <br /> &nbsp; 5=Five+ gifts in the period of recency <br /><br /> 3rd byte: **Amount of Giving** <br /> &nbsp; L=Less than $100(Low Dollar) <br /> &nbsp; C=$100-499(Core) <br /> &nbsp; M=$500-999(Major) <br /> &nbsp; T=$1,000+(Top) <br /> 4th byte: **Blank/meaningless/filler** <br /> 'X' indicates that the donor is not a major donor. <br /> For more information regarding the RFA codes, see the promotion history field definitions.
`DOMAIN` | DOMAIN/Cluster code. A nominal or symbolic field. <br /> could be broken down by bytes as explained below. <br /><br /> 1st byte = Urbanicity level of the donor's neighborhood <br /> &nbsp; U=Urban <br /> &nbsp; C=City <br /> &nbsp; S=Suburban <br /> &nbsp; T=Town <br /> &nbsp; R=Rural <br /><br /> 2nd byte = Socio-Economic status of the neighborhood <br />  &nbsp; 1=Highest SES <br />  &nbsp; 2=Average SES <br />  &nbsp; 3=Lowest SES (except for Urban communities, where: <br />  &nbsp;  &nbsp; 1=Highest SES, <br /> &nbsp;  &nbsp; 2=Above average SES, <br />  &nbsp;  &nbsp; 3=Below average SES, <br />  &nbsp;  &nbsp;  4=Lowest SES.) 
`CLUSTER` | Code indicating which cluster group the donor falls into. <br /> Each cluster is unique in terms of socio-economic status, urbanicty, ethnicity and a variety of other demographic characteristics. <br /> A nominal or symbolic field.
`AGE` |  Overlay Age <br /> 0=missing 
`AGEFLAG` | Age Flag <br /> E=Exact <br /> I=Inferred from Date of Birth Field
`HOMEOWNR` | Home Owner Flag <br /> H=Home owner <br /> U=Unknown
`CHILD03` | Presence of Children age 0-3 <br /> B=Both, F=Female, M=Male
`CHILD07` | Presence of Childern age 4-7
`CHILD12` | Presence of Childern age 8-12
`CHILD18` | Presence of Childern age 13-18
`NUMCHLD` | NUMBER OF CHILDREN
`INCOME` | HOUSEHOLD INCOME
`GENDER` | Gender <br /> M=Male <br /> F=Female <br /> U=Unknown <br /> J=Joint Account, unknown gender
`WEALTH1` | Wealth Rating
`HIT` | MOR Flag # HIT (Mail Order Response) <br /> Indicates total number of known times the donor has responded to a mail order offer other than PVA's.

The following variables indicate the number of known times the donor has responded to other types of mail order offers:


Data field | Description |
--- | ---|
`MBCRAFT` | Buy Craft Hobby
`MBGARDEN` | Buy Gardening
`MBBOOKS` | Buy Books
`MBCOLECT` | Buy Collectables
`MAGFAML` | Buy General Family Mags
`MAGFEM` | Buy Female Mags
`MAGMALE` | Buy Sports Mags
`PUBGARDN` | Gardening Pubs
`PUBCULIN` | Culinary Pubs
`PUBHLTH` | Health Pubs
`PUBDOITY` | Do It Yourself Pubs
`PUBNEWFN` | News / Finance Pubs
`PUBPHOTO` | Photography Pubs
`PUBOPP` | Opportunity Seekers Pubs
`DATASRCE` | Source of Overlay Data <br /> Indicates which third-party data source the donor matched against <br /> 1=MetroMail <br /> 2=Polk <br /> 3=Both
`MALEMILI` | % Males active in the `Military`
`MALEVET` | % Males Veterans
`VIETVETS` | % Vietnam Vets
`WWIIVETS` | % WWII Vets
`LOCALGOV` | % Employed by Local Gov
`STATEGOV` | % Employed by State Gov
`FEDGOV` | % Employed by Fed Gov
`SOLP3` | SOLICIT LIMITATION CODE P3 <br />  &nbsp; =can be mailed (Default) <br /> 00=Do Not Solicit or Mail <br /> 01=one solicitation per year <br /> 02=two solicitations per year <br /> 03=three solicitations per year <br /> 04=four solicitations per year <br /> 05=five solicitations per year <br /> 06=six solicitations per year <br /> 12=twelve solicitations per year
`SOLIH` | SOLICITATION LIMIT CODE IN HOUSE <br /> &nbsp; =can be mailed (Default) <br /> 00=Do Not Solicit <br /> 01=one solicitation per year <br /> 02=two solicitations per year <br /> 03=three solicitations per year <br /> 04=four solicitations per year <br /> 05=five solicitations per year <br /> 06=six solicitations per year <br /> 12=twelve solicitations per year
`MAJOR` | Major ($$) Donor Flag <br /> _=Not a Major Donor <br /> X=Major Donor
`WEALTH2` | Wealth Rating <br /> Wealth rating uses median family income and population statistics from each area to index relative wealth within each state. <br /> The segments are denoted 0-9, with 9 being the highest income group and zero being the lowest. Each rating has a different meaning within each state.
`GEOCODE` | Geo Cluster Code indicating the level geography at which a record matches the census data. A nominal or symbolic field. <br /> Blank=No code has been assigned or did not match at any level.

The following variables reflect donor interests, as collected from third-party data sources:


Data field | Description |
--- | ---|
`COLLECT1` | COLLECTABLE (Y/N)
`VETERANS` | VETERANS (Y/N)
`BIBLE` | BIBLE READING (Y/N)
`CATLG` | SHOP BY CATALOG (Y/N)
`HOMEE` | WORK FROM HOME (Y/N)
`PETS` | HOUSEHOLD PETS (Y/N)
`CDPLAY` | CD PLAYER OWNERS (Y/N)
`STEREO` | STEREO/RECORDS/TAPES/CD (Y/N)
`PCOWNERS` | HOME PC OWNERS/USERS
`PHOTO` | PHOTOGRAPHY (Y/N)
`CRAFTS` | CRAFTS (Y/N)
`FISHER` | FISHING (Y/N)
`GARDENIN` | GARDENING (Y/N)
`BOATS` | POWER BOATING (Y/N)
`WALKER` | WALK FOR HEALTH (Y/N)
`KIDSTUFF` | BUYS CHILDREN'S PRODUCTS (Y/N)
`CARDS` | STATIONARY/CARDS BUYER (Y/N)
`PLATES` | PLATE COLLECTOR (Y/N)
`LIFESRC` | LIFE STYLE DATA SOURCE <br /> Indicates source of the lifestyle variables listed above <br /> 1=MATCHED ON METRO MAIL ONLY <br /> 2=MATCHED ON POLK ONLY <br /> 3=MATCHED BOTH MM AND POLK
`PEPSTRFL` | Indicates PEP Star RFA Status <br /> blank=Not considered to be a PEP Star <br /> 'X'=Has PEP Star RFA Status


The following variables reflect characteristics of the donors neighborhood, as collected from the 1990 US Census:

Data field | Description |
--- | ---|
`POP901` | Number of Persons
`POP902` | Number of Families
`POP903`  | Number of Households
`POP90C1`  | Percent Population in Urbanized Area
`POP90C2` | Percent Population Outside Urbanized Area
`POP90C3` | Percent Population Inside Rural Area
`POP90C4` | Percent Male
`POP90C5` | Percent Female
`ETH1` | Percent White
`ETH2` | Percent Black
`ETH3` | Percent Native American
`ETH4` |Percent Pacific Islander/Asian
`ETH5` | Percent Hispanic
`ETH6` | Percent Asian Indian
`ETH7` | Percent Japanese
`ETH8` | Percent Chinese
`ETH9` | Percent Philipino
`ETH10` | Percent Korean
`ETH11` | Percent Vietnamese
`ETH12` | Percent Hawaiian
`ETH13` | Percent Mexican
`ETH14` | Percent Puerto Rican
`ETH15` | Percent Cuban
`ETH16` | Percent Other Hispanic
`AGE901` | Median Age of Population
`AGE902` | Median Age of Adults 18 or Older
`AGE903` | Median Age of Adults 25 or Older
`AGE904` | Average Age of Population
`AGE905` | Average Age of Adults >= 18
`AGE906` | Average Age of Adults >= 25
`AGE907` | Percent Population Under Age 18
`CHIL1` | Percent Children Under Age 7
`CHIL2` | Percent Children Age 7 - 13
`CHIL3` | Percent Children Age 14-17
`AGEC1` | Percent Adults Age18-24
`AGEC2` | Percent Adults Age 25-34
`AGEC3` | Percent Adults Age 35-44
`AGEC4` | Percent Adults Age 45-54
`AGEC5` | Percent Adults Age 55-64
`AGEC6` | Percent Adults Age 65-74
`AGEC7` | Percent Adults Age >= 75
`CHILC1` | Percent Children Age <=2
`CHILC2` | Percent Children Age 3-5
`CHILC3` | Percent Children Age 6-11
`CHILC4` | Percent Children Age 12-15
`CHILC5` | Percent Children Age 16-18
`HHAGE1` | Percent Households w/ Person 65+
`HHAGE2` | Percent Households w/ Person 65+ Living Alone
`HHAGE3` | Percent Households Headed by an Elderly Person Age 65+
`HHN1` | Percent 1 Person Households
`HHN2` | Percent 2 Person Households
`HHN3` | Percent 3 or More Person Households
`HHN4` | Percent 4 or More Person Households
`HHN5` | Percent 5 or More Person Households
`HHN6` | Percent 6 Person Households
`MARR1` | Percent Married
`MARR2` | Percent Separated or Divorced
`MARR3` | Percent Widowed
`MARR4` | Percent Never Married
`HHP1` | Median Person Per Household
`HHP2` | Average Person Per Household
`DW1` | Percent Single Unit Structure
`DW2` | Percent Detached Single Unit Structure
`DW3` | Percent Duplex Structure
`DW4` | Percent Multi (2+) Unit Structures
`DW5` | Percent 3+ Unit Structures
`DW6` | Percent Housing Units in 5+ Unit Structure
`DW7` | Percent Group Quarters
`DW8` | Percent Institutional Group Quarters
`DW9` | Non-Institutional Group Quarters
`HV1` | Median Home Value in hundreds
`HV2` | Average Home Value in hundreds
`HV3` | Median Contract Rent in hundreds
`HV4` | Average Contract Rent in hundreds
`HU1` | Percent Owner Occupied Housing Units
`HU2` | Percent Renter Occupied Housing Units
`HU3` | Percent Occupied Housing Units
`HU4` | Percent Vacant Housing Units
`HU5` | Percent Seasonal/Recreational Vacant Units
`HHD1` | Percent Households w/ Related Children
`HHD2` | Percent Households w/ Families
`HHD3` | Percent Married Couple Families
`HHD4` | Percent Married Couples w/ Related Children
`HHD5` | Percent Persons in Family Household
`HHD6` | Percent Persons in Non-Family Household
`HHD7` | Percent Single Parent Households
`HHD8` | Percent Male Householder w/ Child
`HHD9` | Percent Female Householder w/ Child
`HHD10` | Percent Single Male Householder
`HHD11` | Percent Single Female Householder
`HHD12` | Percent Households w/ Non-Family Living Arrangements
`ETHC1` | Percent White < Age 15
`ETHC2` | Percent White Age 15 - 59
`ETHC3` | Percent White Age 60+
`ETHC4` | Percent Black < Age 15
`ETHC5` | Percent Black Age 15 - 59
`ETHC6` | Percent Black Age 60+
`HVP1` | Percent Home Value >= $200,000
`HVP2` | Percent Home Value >= $150,000
`HVP3` | Percent Home Value >= $100,000
`HVP4` | Percent Home Value >= $75,000
`HVP5` | Percent Home Value >= $50,000
`HVP6` | Percent Home Value >= $300,000
`HUR1` | $ 1 or 2 Room Housing Units
`HUR2` | Percent >= 6 Room Housing Units
`RHP1` | Median Number of Rooms per Housing Unit
`RHP2` | Average Number of Rooms per Housing Unit
`RHP3` | Median Number of Persons per Housing Unit
`RHP4` | Average Number of Persons per Room
`HUPA1` | Percent Housing Units w/ 2 thru 9 Units at the Address
`HUPA2` | Percent Housing Units w/ >= 10 Units at the Address
`HUPA3` | Percent Mobile Homes or Trailers
`HUPA4` | Percent Renter Occupied Single Unit Structure
`HUPA5` | Percent Renter Occupied, 2 - 4 Units
`HUPA6` | Percent Renter Occupied, 5+ Units
`HUPA7` | Percent Renter Occupied Mobile Homes or Trailers
`RP1` | Percent Renters Paying >= $500 per Month
`RP2` | Percent Renters Paying >= $400 per Month
`RP3` | Percent Renters Paying >= $300 per Month
`RP4` | Percent Renters Paying >= $200 per Month
`MSA` | MSA Code
`ADI` | ADI Code
`DMA` | DMA Code
`IC1` | Median Household Income in hundreds
`IC2` | Median Family Income in hundreds
`IC3` | Average Household Income in hundreds
`IC4` | Average Family Income in hundreds
`IC5` | Per Capita Income
`IC6` | Percent Households w/ Income < $15,000
`IC7` | Percent Households w/ Income $15,000 - $24,999
`IC8` | Percent Households w/ Income $25,000 - $34,999
`IC9` | Percent Households w/ Income $35,000 - $49,999
`IC10` | Percent Households w/ Income $50,000 - $74,999
`IC11` | Percent Households w/ Income $75,000 - $99,999
`IC12` | Percent Households w/ Income $100,000 - $124,999
`IC13` | Percent Households w/ Income $125,000 - $149,999
`IC14` | Percent Households w/ Income >= $150,000
`IC15` | Percent Families w/ Income < $15,000
`IC16` | Percent Families w/ Income $15,000 - $24,999
`IC17` | Percent Families w/ Income $25,000 - 34,999
`IC18` | Percent Families w/ Income $35,000 - $49,999
`IC19` | Percent Families w/ Income $50,000 - $74,999
`IC20` | Percent Families w/ Income $75,000 - $99,999
`IC21` | Percent Families w/ Income $100,000 - $124,999
`IC22` | Percent Families w/ Income $125,000 - $149,999
`IC23` | Percent Families w/ Income >= $150,000
`HHAS1` | Percent Households on Social Security
`HHAS2` | Percent Households on Public Assistance
`HHAS3` | Percent Households w/ Interest, Rental or Dividend Income
`HHAS4` | Percent Persons Below Poverty Level
`MC1` | Percent Persons Move in Since 1985
`MC2` | Percent Persons in Same House in 1985
`MC3` | Percent Persons in Different State/Country in 1985
`TPE1` | Percent Driving to Work Alone Car/Truck/Van
`TPE2` | Percent Carpooling Car/Truck/Van)
`TPE3` | Percent Using Public Transportation
`TPE4` | Percent Using Bus/Trolley
`TPE5` | Percent Using Railways
`TPE6` | Percent Using Taxi/Ferry
`TPE7` | Percent Using Motorcycles
`TPE8` | Percent Using Other Transportation
`TPE9` | Percent Working at Home/No Transportation
`PEC1`| Percent Working Outside State of Residence
