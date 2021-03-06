{*****************************************************************************

  Delphi Encryption Compendium (DEC Part I)
  Version 5.2, Part I, for Delphi 7 - 2009

  Remarks:          Freeware, Copyright must be included

  Original Author:  (c) 2006 Hagen Reddmann, HaReddmann [at] T-Online [dot] de
  Modifications:    (c) 2008 Arvid Winkelsdorf, info [at] digivendo [dot] de

  Last change:      02. November 2008

  Description:      Data Arrays

 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ''AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*****************************************************************************}

unit DEC_Data;

{$RANGECHECKS OFF}
{$WARNINGS OFF}

interface

const
  Tiger_Data: array[0..3, 0..511] of LongWord = (
   ($F7E90C5E,$02AAB17C,$E243A8EC,$AC424B03,$0DD5FCD3,$72CD5BE3,$F6F97F3A,$6D019B93,
    $D21F9193,$CD9978FF,$708029E2,$7573A1C9,$922A83C3,$B164326B,$04915870,$46883EEE,
    $7103ECE6,$EAACE305,$08A3535C,$C54169B8,$8DDEC47C,$4CE75491,$DC0DF40C,$0AA2F4DF,
    $A74DBEFA,$10B76F18,$5AD1AB6A,$C6CCB623,$572FE2FF,$13726121,$199D921E,$1A488C6F,
    $DA0007CA,$4BC9F9F4,$E85241C7,$26F5E6F6,$EA5947B6,$859079DB,$C99E8C92,$4F1885C5,
    $A96F864B,$D78E761E,$52B5C17D,$8E36428C,$373063C1,$69CF6827,$9BB4C56E,$B607C93D,
    $0E76B5EA,$7D820E76,$F07FDC42,$645C9CC6,$243342E0,$BF38A078,$9D2E7D04,$5F6B343C,
    $600B0EC6,$F2C28AEB,$7254BCAC,$6C0ED85F,$A4DB4FE5,$71592281,$CE0FED9F,$1967FA69,
    $B96545DB,$FD5293F8,$F2A7600B,$C879E9D7,$0193194E,$86024892,$2D9CC0B3,$A4F9533B,
    $15957613,$9053836C,$FC357BF1,$DB6DCF8A,$7A370F57,$18BEEA7A,$50B99066,$037117CA,
    $74424A35,$6AB30A97,$E325249B,$F4E92F02,$061CCAE1,$7739DB07,$ECA42A05,$D8F3B49C,
    $51382F73,$BD56BE3F,$43B0BB28,$45FAED58,$11BF1F83,$1C813D5C,$D75FA169,$8AF0E4B6,
    $87AD9999,$33EE18A4,$B1C94410,$3C26E8EA,$C0A822F9,$B510102B,$0CE6123B,$141EEF31,
    $59DDB154,$FC65B900,$C5E0E607,$E0158640,$26C3A3CF,$884E0798,$23C535FD,$930D0D95,
    $4E9A2B00,$35638D75,$40469DD5,$4085FCCF,$8BE23A4C,$C4B17AD2,$6A3E6A2E,$CAB2F0FC,
    $6B943FCD,$2860971A,$12E30446,$3DDE6EE2,$E01765AE,$6222F32A,$478308FE,$5D550BB5,
    $A0EDA22A,$A9EFA98D,$86C40DA7,$C351A716,$9C867C84,$1105586D,$FDA22853,$DCFFEE85,
    $2C5EEF76,$CCFBD026,$8990D201,$BAF294CB,$2AFAD975,$E69464F5,$DF133E14,$94B013AF,
    $2823C958,$06A7D1A3,$30F61119,$6F95FE51,$462C06C0,$D92AB34E,$887C71D2,$ED7BDE33,
    $6518393E,$79746D6E,$5D713329,$5BA41938,$48A97564,$7C1BA6B9,$7BFDAC67,$31987C19,
    $4B053D02,$DE6C23C4,$D002D64D,$581C49FE,$38261571,$DD474D63,$E473D062,$AA4546C3,
    $9455F860,$928FCE34,$CAAB94D9,$48161BBA,$770E6F68,$63912430,$02C6641C,$6EC8A5E6,
    $337DDD2B,$87282515,$034B701B,$2CDA6B42,$81CB096D,$B03D37C1,$66C71C6F,$E1084382,
    $EB51B255,$2B3180C7,$96C08BBC,$DF92B82F,$A632F3BA,$5C68C8C0,$1C3D0556,$5504CC86,
    $5FB26B8F,$ABBFA4E5,$B3BACEB4,$41848B0A,$AA445D32,$B334A273,$A85AD881,$BCA696F0,
    $B528D56C,$24F6EC65,$90F4524A,$0CE1512E,$5506D35A,$4E9DD79D,$C6CE9779,$258905FA,
    $3E109B33,$2019295B,$73A054CC,$F8A9478B,$34417EB0,$2924F2F9,$536D1BC4,$3993357D,
    $1DB6FF8B,$38A81AC2,$7D6016BF,$47C4FBF1,$7667E3F5,$1E0FAADD,$938BEB96,$7ABCFF62,
    $8FC179C9,$A78DAD94,$2911E50D,$8F1F98B7,$27121A91,$61E48EAE,$31859808,$4D62F7AD,
    $EF5CEAEB,$ECEBA345,$BC9684CE,$F5CEB25E,$B7F76221,$F633E20C,$AB8293E4,$A32CDF06,
    $A5EE2CA4,$985A202C,$CC8A8FB1,$CF0B8447,$979859A3,$9F765244,$A1240017,$A8D516B1,
    $BB5DC726,$0BD7BA3E,$B86ADB39,$E54BCA55,$6C478063,$1D7A3AFD,$E7669EDD,$519EC608,
    $D149AA23,$0E5715A2,$848FF194,$177D4571,$41014C22,$EEB55F32,$3A6E2EC2,$0F5E5CA1,
    $75F5C361,$8029927B,$C3D6E436,$AD139FAB,$4CCF402F,$0D5DF1A9,$BEA5DFC8,$3E8BD948,
    $BD3FF77E,$A5A0D357,$1F74F645,$A2D12E25,$5E81A082,$66FD9E52,$7F687A49,$2E0C90CE,
    $BA973BC5,$C2E8BCBE,$E509745F,$000001BC,$E6DAB3D6,$423777BB,$AEF06EB5,$D1661C7E,
    $4DAACFD8,$A1781F35,$2B16AFFC,$2D11284A,$FA891D1F,$F1FC4F67,$CB920ADA,$73ECC25D,
    $C2A12651,$AE610C22,$D356B78A,$96E0A810,$2FE7870F,$5A9A381F,$E94E5530,$D5AD62ED,
    $368D1427,$D225E5E8,$C7AF4631,$65977B70,$DE39D74F,$99F889B2,$54E1D143,$233F30BF,
    $D9A63C97,$9A9675D3,$F334F9A8,$5470554F,$4A4F5688,$166ACB74,$B2E4AEAD,$70C74CAA,
    $6F294D12,$F0D09164,$684031D1,$57B82A89,$61BE0B6B,$EFD95A5A,$69F2F29A,$2FBD12E9,
    $FEFF9FE8,$9BD37013,$D6085A06,$3F9B0404,$166CFE15,$4940C1F3,$CDF3DEFB,$09542C4D,
    $85CD5CE3,$B4C52183,$4462A641,$C935B7DC,$8ED3B63F,$3417F8A6,$5B215B40,$B8095929,
    $3B8C8572,$F99CDAEF,$F8FCB95D,$018C0614,$1A3ACDF3,$1B14ACCD,$00BB732D,$84D471F2,
    $95E8DA16,$C1A3110E,$BF1A82B8,$430A7220,$39DF210E,$B77E090D,$3CD05E9D,$5EF4BD9F,
    $7E57A444,$9D4FF6DA,$83D4A5F8,$DA1D60E1,$17998E47,$B287C384,$1BB31886,$FE3EDC12,
    $980CCBEF,$C7FE3CCC,$189BFD03,$E46FB590,$9A4C57DC,$3732FD46,$7CF1AD65,$7EF700A0,
    $A31D8859,$59C64468,$D45B61F6,$762FB0B4,$99047718,$155BAED0,$3D50BAA6,$68755E4C,
    $22D8B4DF,$E9214E7F,$2EAC95F4,$2ADDBF53,$B4BD0109,$32AE3909,$B08E3450,$834DF537,
    $4220728D,$FA209DA8,$9EFE23F7,$9E691D9B,$C4AE8D7F,$0446D288,$E169785B,$7B4CC524,
    $35CA1385,$21D87F01,$137B8AA5,$CEBB400F,$580796BE,$272E2B66,$25C2B0DE,$36122641,
    $AD1EFBB2,$057702BD,$ACF84BE9,$D4BABB8E,$641BC67B,$91583139,$8036E024,$8BDC2DE0,
    $F49F68ED,$603C8156,$DBEF5111,$F7D236F7,$8AD21E80,$9727C459,$670A5FD7,$A08A0896,
    $09EBA9CB,$CB4A8F43,$0F7036A1,$81AF564B,$78199ABD,$C0B99AA7,$3FC8E952,$959F1EC8,
    $794A81B9,$8C505077,$056338F0,$3ACAAF8F,$627A6778,$07B43F50,$F5ECCC77,$4A44AB49,
    $B679EE98,$3BC3D6E4,$CF14108C,$9CC0D4D1,$206BC8A0,$4406C00B,$C8D72D89,$82A18854,
    $5C3C432C,$67E366B3,$102B37F2,$B923DD61,$D884271D,$56AB2779,$FF1525AF,$BE83E1B0,
    $217E49A9,$FB7C65D4,$6D48E7D4,$6BDBE0E7,$45D9179E,$08DF8287,$DD53BD34,$22EA6A9A,
    $5622200A,$E36E141C,$8CB750EE,$7F805D1B,$9F58E837,$AFE5C7A5,$4FB1C23C,$E27F996A,
    $0775F0D0,$D3867DFB,$6E88891A,$D0E673DE,$AFB86C25,$123AEB9E,$C145B895,$30F1D5D5,
    $EE7269E7,$BB434A2D,$F931FA38,$78CB67EC,$323BBF9C,$F33B0372,$FB279C74,$52D66336,
    $0AFB4EAA,$505F33AC,$A2CCE187,$E8A5CD99,$1E2D30BB,$53497480,$D5876D90,$8D2D5711,
    $91BC038E,$1F1A4128,$82E56648,$D6E2E71D,$497732B7,$74036C3A,$6361F5AB,$89B67ED9,
    $F1EA02A2,$FFED95D8,$1464D43D,$E72B3BD6,$0BDC4820,$A6300F17,$ED78A77A,$EBC18760),
   ($05A12138,$E6A6BE5A,$B4F87C98,$B5A122A5,$140B6990,$563C6089,$391F5DD5,$4C46CB2E,
    $C9B79434,$D932ADDB,$2015AFF5,$08EA70E4,$3E478CF1,$D765A667,$AB278D99,$C4FB757E,
    $2D6E0692,$DF11C686,$0D7F3B16,$DDEB84F1,$A665EA04,$6F2EF604,$F0E0DFB3,$4A8E0F0F,
    $3DBCBA51,$A5EDEEF8,$0EA4371E,$FC4F0A2A,$5CB38429,$E83E1DA8,$BA1B1CE2,$DC8FF882,
    $8353E80D,$CD45505E,$D4DB0717,$18D19A00,$A5F38101,$34A0CFED,$8887CAF2,$0BE77E51,
    $B3C45136,$1E341438,$9089CCF9,$E05797F4,$F2591D14,$FFD23F9D,$8595C5CD,$543DDA22,
    $99052A33,$661F81FD,$DB0F7B76,$8736E641,$418E5307,$15227725,$162EB2FA,$E25F7F46,
    $6C13D9FE,$48A8B212,$92E76EEA,$AFDC5417,$C6D1898F,$03D912BF,$1B83F51B,$31B1AAFA,
    $E42AB7D9,$F1AC2796,$FCD2EBAC,$40A3A7D7,$0AFBBCC5,$1056136D,$9A6D0C85,$7889E1DD,
    $2A7974AA,$D3352578,$078AC09B,$A7E25D09,$EAC6EDD0,$BD4138B3,$71EB9E70,$920ABFBE,
    $4FC2625C,$A2A5D0F5,$0B1290A3,$C054E36B,$62FE932B,$F6DD59FF,$11A8AC7D,$35373545,
    $72FADCD4,$CA845E91,$329D20DC,$84F82B60,$CD672F18,$79C62CE1,$D124642C,$8B09A2AD,
    $19D9E726,$D0C1E96A,$4BA9500C,$5A786A9B,$634C43F3,$0E020336,$EB66D822,$C17B474A,
    $EC9BAAC2,$6A731AE3,$E0840258,$8226667A,$91CAECA5,$67D45676,$4875ADB5,$1D94155C,
    $5B813FDF,$6D00FD98,$B774CD06,$51286EFC,$1FA744AF,$5E883447,$E761AE2E,$F72CA0AE,
    $AEE8E09A,$BE40E4CD,$5118F665,$E9970BBB,$33DF1964,$726E4BEB,$29199762,$703B0007,
    $F5EF30A7,$4631D816,$1504A6BE,$B880B5B5,$7ED84B6C,$641793C3,$F6E97D96,$7B21ED77,
    $2EF96B73,$77630631,$E86FF3F4,$AE528948,$86A3F8F8,$53DBD7F2,$4CFC1063,$16CADCE7,
    $FA52C6DD,$005C19BD,$64D46AD3,$68868F5D,$CF1E186A,$3A9D512C,$385660AE,$367E62C2,
    $77DCB1D7,$E359E7EA,$749ABE6E,$526C0773,$D09F734B,$735AE5F9,$8A558BA8,$493FC7CC,
    $3041AB45,$B0B9C153,$470A59BD,$321958BA,$5F46C393,$852DB00B,$D336B0E5,$91209B2B,
    $659EF19F,$6E604F7D,$782CCB24,$B99A8AE2,$C814C4C7,$CCF52AB6,$BE11727B,$4727D9AF,
    $0121B34D,$7E950D0C,$70AD471F,$756F4356,$615A6849,$F5ADD442,$80B9957A,$4E87E099,
    $50AEE355,$2ACFA1DF,$FD2FD556,$D898263A,$D80C8FD6,$C8F4924D,$754A173A,$CF99CA3D,
    $AF91BF3C,$FE477BAC,$D690C12D,$ED5371F6,$5E687094,$831A5C28,$3708A0A4,$C5D3C90A,
    $17D06580,$0F7F9037,$B8FDF27F,$19F9BB13,$4D502843,$B1BD6F1B,$8FFF4012,$1C761BA3,
    $E2E21F3B,$0D1530C4,$A7372C8A,$8943CE69,$FEB5CE66,$E5184E11,$BD736621,$618BDB80,
    $8B574D0B,$7D29BAD6,$25E6FE5B,$81BB613E,$BC07913F,$071C9C10,$09AC2D97,$C7BEEB79,
    $3BC5D757,$C3E58D35,$F38F61E8,$EB017892,$9B1CC21A,$D4EFFB9C,$F494F7AB,$99727D26,
    $956B3E03,$A3E063A2,$4AA09C30,$9D4A8B9A,$00090FB4,$3F6AB7D5,$57268AC0,$9CC0F2A0,
    $EDBF42D1,$3DEE9D2D,$7960A972,$330F49C8,$87421B41,$C6B27202,$7C00369C,$0AC59EC0,
    $CB353425,$EF4EAC49,$EF0129D8,$F450244E,$CAF4DEB6,$8ACC46E5,$989263F7,$2FFEAB63,
    $5D7A4578,$8F7CB9FE,$4E634635,$5BD8F764,$BF2DC900,$427A7315,$2125261C,$17D0C4AA,
    $93518E50,$3992486C,$A2D7D4C3,$B4CBFEE0,$2C5DDD8D,$7C75D620,$E35B6C61,$DBC295D8,
    $02032B19,$60B369D3,$DCE44132,$CE42685F,$DDF65610,$06F3DDB9,$B5E148F0,$8EA4D21D,
    $2FCD496F,$20B0FCE6,$58B0EE31,$2C1B9123,$18F5A308,$B28317B8,$9CA6D2CF,$A89C1E18,
    $6AAADBC8,$0C6B1857,$1299FAE3,$B65DEAA9,$7F1027E7,$FB2B794B,$443B5BEB,$04E4317F,
    $5939D0A6,$4B852D32,$FB207FFC,$D5AE6BEE,$81C7D374,$309682B2,$94C3B475,$BAE309A1,
    $13B49F05,$8CC3F97B,$F8293967,$98A9422F,$1076FF7C,$244B16B0,$663D67EE,$F8BF571C,
    $EEE30DA1,$1F0D6758,$7ADEB9B7,$C9B611D9,$7B6C57A2,$B7AFD588,$6B984FE1,$6290AE84,
    $ACC1A5FD,$94DF4CDE,$C5483AFF,$058A5BD1,$42BA3C37,$63166CC1,$B2F76F40,$8DB8526E,
    $6F0D6D4E,$E1088003,$971D311D,$9E0523C9,$CC7CD691,$45EC2824,$E62382C9,$575B8359,
    $C4889995,$FA9E400D,$45721568,$D1823ECB,$8206082F,$DAFD983B,$2386A8CB,$AA7D2908,
    $03B87588,$269FCD44,$28BDD1E0,$1B91F5F7,$040201F6,$E4669F39,$8CF04ADE,$7A1D7C21,
    $D79CE5CE,$65623C29,$96C00BB1,$23684490,$9DA503BA,$AB9BF187,$A458058E,$BC23ECB1,
    $BB401ECC,$9A58DF01,$A85F143D,$A070E868,$7DF2239E,$4FF18830,$1A641183,$14D565B4,
    $52701602,$EE133374,$3F285E09,$950E3DCF,$B9C80953,$59930254,$8930DA6D,$3BF29940,
    $53691387,$A955943F,$A9CB8784,$A15EDECA,$352BE9A0,$29142127,$FF4E7AFB,$76F0371F,
    $274F2228,$0239F450,$1D5E868B,$BB073AF0,$C10E96C1,$BFC80571,$68222E23,$D2670885,
    $8E80B5B0,$9671A3D4,$E193BB81,$55B5D38A,$A18B04B8,$693AE2D0,$ADD5335F,$5C48B4EC,
    $4916A1CA,$FD743B19,$34BE98C4,$25770181,$3C54A4AD,$E77987E8,$DA33E1B9,$28E11014,
    $226AA213,$270CC59E,$6D1A5F60,$71495F75,$60AFEF77,$9BE853FB,$F7443DBF,$ADC786A7,
    $73B29A82,$09044561,$C232BD5E,$58BC7A66,$673AC8B2,$F306558C,$B6C9772A,$41F639C6,
    $9FDA35DA,$216DEFE9,$1C7BE615,$11640CC7,$565C5527,$93C43694,$46777839,$EA038E62,
    $5A3E2469,$F9ABF3CE,$0FD312D2,$741E768D,$CED652C6,$0144B883,$A33F8552,$C20B5A5B,
    $C3435A9D,$1AE69633,$088CFDEC,$97A28CA4,$1E96F420,$8824A43C,$6EEEA746,$37612FA6,
    $F9CF0E5A,$6B4CB165,$A0ABFB4A,$43AA1C06,$F162796B,$7F4DC26F,$54ED9B0F,$6CBACC8E,
    $D2BB253E,$A6B7FFEF,$B0A29D4F,$2E25BC95,$DEF1388C,$86D6A58B,$76B6F054,$DED74AC5,
    $2B45805D,$8030BDBC,$E94D9289,$3C81AF70,$9E3100DB,$3EFF6DDA,$DFCC8847,$B38DC39F,
    $8D17B87E,$12388552,$40B1B642,$F2DA0ED2,$D54BF9A9,$44CEFADC,$433C7EE6,$1312200E,
    $3A78C748,$9FFCC84F,$248576BB,$F0CD1F72,$3638CFE4,$EC697405,$0CEC4E4C,$2BA7B67C,
    $E5CE32ED,$AC2F4DF3,$26EA4C11,$CB33D143,$C77E58BC,$A4E9044C,$D934FCEF,$5F513293,
    $06E55444,$5DC96455,$317DE40A,$50DE418F,$69DDE259,$388CB31A,$55820A86,$2DB4A834,
    $84711AE9,$9010A91E,$B1498371,$4DF7F0B7,$C0977179,$D62A2EAB,$AA8D5C0E,$22FAC097),
   ($F1DAF39B,$F49FCC2F,$6FF29281,$487FD5C6,$FCDCA83F,$E8A30667,$D2FCCE63,$2C9B4BE3,
    $93FBBBC2,$DA3FF74B,$FE70BA66,$2FA165D2,$970E93D4,$A103E279,$B0E45E71,$BECDEC77,
    $3985E497,$CFB41E72,$5EF75017,$B70AAA02,$3840B8E0,$D42309F0,$35898579,$8EFC1AD0,
    $E2B2ABC5,$96C6920B,$375A9172,$66AF4163,$CA7127FB,$2174ABDC,$4A72FF41,$B33CCEA6,
    $083066A5,$F04A4933,$D7289AF5,$8D970ACD,$31C8C25E,$8F96E8E0,$76875D47,$F3FEC022,
    $056190DD,$EC7BF310,$BB0F1491,$F5ADB0AE,$0FD58892,$9B50F885,$58B74DE8,$49754883,
    $91531C61,$A3354FF6,$81D2C6EE,$0702BBE4,$7DEDED98,$89FB2405,$8596E902,$AC307513,
    $172772ED,$1D2D3580,$8E6BC30D,$EB738FC2,$63044326,$5854EF8F,$5ADD3BBE,$9E5C5232,
    $325C4623,$90AA53CF,$349DD067,$C1D24D51,$A69EA624,$2051CFEE,$862E7E4F,$13220F0A,
    $04E04864,$CE393994,$7086FCB7,$D9C42CA4,$8A03E7CC,$685AD223,$AB2FF1DB,$066484B2,
    $EFBF79EC,$FE9D5D70,$9C481854,$5B13B9DD,$ED1509AD,$15F0D475,$0EC79851,$0BEBCD06,
    $183AB7F8,$D58C6791,$52F3EEE4,$D1187C50,$E54E82FF,$C95D1192,$B9AC6CA2,$86EEA14C,
    $53677D5D,$3485BEB1,$1F8C492A,$DD191D78,$A784EBF9,$F60866BA,$A2D08C74,$518F643B,
    $E1087C22,$8852E956,$C410AE8D,$A768CB8D,$BFEC8E1A,$38047726,$CD3B45AA,$A67738B4,
    $EC0DDE19,$AD16691C,$80462E07,$C6D43193,$0BA61938,$C5A5876D,$A58FD840,$16B9FA1F,
    $3CA74F18,$188AB117,$C99C021F,$ABDA2F98,$134AE816,$3E0580AB,$73645ABB,$5F3B05B7,
    $5575F2F6,$2501A2BE,$4E7E8BA9,$1B2F7400,$71E8D953,$1CD75803,$62764E30,$7F6ED895,
    $596F003D,$B15926FF,$A8C5D6B9,$9F65293D,$D690F84C,$6ECEF04D,$FF33AF88,$4782275F,
    $3F820801,$E4143308,$9A1AF9B5,$FD0DFE40,$2CDB396B,$4325A334,$B301B252,$8AE77E62,
    $6655615A,$C36F9E9F,$92D32C09,$85455A2D,$49477485,$F2C7DEA9,$33A39EBA,$63CFB4C1,
    $6EBC5462,$83B040CC,$FDB326B0,$3B9454C8,$87FFD78C,$56F56A9E,$99F42BC6,$2DC2940D,
    $6B096E2D,$98F7DF09,$3AD852BF,$19A6E01E,$DBD4B40B,$42A99CCB,$45E9C559,$A59998AF,
    $07D93186,$366295E8,$FAA1F773,$6B48181B,$157A0A1D,$1FEC57E2,$F6201AD5,$4667446A,
    $CFB0F075,$E615EBCA,$68290778,$B8F31F4F,$CE22D11E,$22713ED6,$2EC3C93B,$3057C1A7,
    $7C3F1F2F,$CB46ACC3,$02AAF50E,$DBB893FD,$600B9FCF,$331FD92E,$48EA3AD6,$A498F961,
    $8B6A83EA,$A8D8426E,$B7735CDC,$A089B274,$1E524A11,$87F6B373,$CBC96749,$118808E5,
    $B19BD394,$9906E4C7,$9B24A20C,$AFED7F7E,$EB3644A7,$6509EADE,$E8EF0EDE,$6C1EF1D3,
    $E9798FB4,$B9C97D43,$740C28A3,$A2F2D784,$6197566F,$7B849647,$B65F069D,$7A5BE3E6,
    $78BE6F10,$F96330ED,$7A076A15,$EEE60DE7,$A08B9BD0,$2B4BEE4A,$C7B8894E,$6A56A63E,
    $BA34FEF4,$02121359,$283703FC,$4CBF99F8,$0CAF30C8,$39807135,$F017687A,$D0A77A89,
    $9E423569,$F1C1A9EB,$2DEE8199,$8C797628,$DD1F7ABD,$5D1737A5,$09A9FA80,$4F53433C,
    $DF7CA1D9,$FA8B0C53,$886CCB77,$3FD9DCBC,$A91B4720,$C040917C,$F9D1DCDF,$7DD00142,
    $4F387B58,$8476FC1D,$F3316503,$23F8E7C5,$E7E37339,$032A2244,$50F5A74B,$5C87A5D7,
    $3698992E,$082B4CC4,$B858F63C,$DF917BEC,$5BF86DDA,$3270B8FC,$29B5DD76,$10AE72BB,
    $7700362B,$576AC94E,$C61EFB8F,$1AD112DA,$C5FAA427,$691BC30E,$CC327143,$FF246311,
    $30E53206,$3142368E,$E02CA396,$71380E31,$0AAD76F1,$958D5C96,$C16DA536,$F8D6F430,
    $1BE7E1D2,$C8FFD13F,$004DDBE1,$7578AE66,$067BE646,$05833F01,$3BFE586D,$BB34B5AD,
    $A12B97F0,$095F34C9,$25D60CA8,$247AB645,$017477D1,$DCDBC6F3,$DECAD24D,$4A2E14D4,
    $BE0A1EEB,$BDB5E6D9,$794301AB,$2A7E70F7,$270540FD,$DEF42D8A,$A34C22C1,$01078EC0,
    $F4C16387,$E5DE511A,$BD9A330A,$7EBB3A52,$AA7D6435,$77697857,$03AE4C32,$004E8316,
    $AD78E312,$E7A21020,$6AB420F2,$9D41A70C,$EA1141E6,$28E06C18,$984F6B28,$D2B28CBD,
    $446E9D83,$26B75F6C,$4D418D7F,$BA47568C,$E6183D8E,$D80BADBF,$5F166044,$0E206D7F,
    $11CBCA3E,$E258A439,$B21DC0BC,$723A1746,$F5D7CDD3,$C7CAA854,$3D261D9C,$7CAC3288,
    $23BA942C,$7690C264,$478042B8,$17E55524,$56A2389F,$E0BE4776,$67AB2DA0,$4D289B5E,
    $8FBBFD31,$44862B9C,$9D141365,$B47CC804,$2B91C793,$822C1B36,$FB13DFD8,$4EB14655,
    $14E2A97B,$1ECBBA07,$5CDE5F14,$6143459D,$D5F0AC89,$53A8FBF1,$1C5E5B00,$97EA04D8,
    $D4FDB3F3,$622181A8,$572A1208,$E9BCD341,$43CCE58A,$14112586,$A4C6E0A4,$9144C5FE,
    $65CF620F,$0D33D065,$9F219CA1,$54A48D48,$6D63C821,$C43E5EAC,$72770DAF,$A9728B3A,
    $20DF87EF,$D7934E7B,$1A3E86E5,$E35503B6,$C819D504,$CAE321FB,$AC60BFA6,$129A50B3,
    $7E9FB6C3,$CD5E68EA,$9483B1C7,$B01C9019,$C295376C,$3DE93CD5,$2AB9AD13,$AED52EDF,
    $C0A07884,$2E60F512,$E36210C9,$BC3D86A3,$163951CE,$35269D9B,$D0CDB5FA,$0C7D6E2A,
    $D87F5733,$59E86297,$898DB0E7,$298EF221,$D1A5AA7E,$55000029,$B5061B45,$8BC08AE1,
    $6C92703A,$C2C31C2B,$AF25EF42,$94CC596B,$22540456,$0A1D73DB,$D9C4179A,$04B6A0F9,
    $AE3D3C60,$EFFDAFA2,$B49496C4,$F7C8075B,$1D1CD4E3,$9CC5C714,$218E5534,$78BD1638,
    $F850246A,$B2F11568,$9502BC29,$EDFABCFA,$DA23051B,$796CE5F2,$DC93537C,$AAE128B0,
    $EE4B29AE,$3A493DA0,$416895D7,$B5DF6B2C,$122D7F37,$FCABBD25,$105DC4B1,$70810B58,
    $F7882A90,$E10FDD37,$518A3F5C,$524DCAB5,$8451255B,$3C9E8587,$19BD34E2,$40298281,
    $5D3CECCB,$74A05B6F,$42E13ECA,$B6100215,$2F59E2AC,$0FF979D1,$E4F9CC50,$6037DA27,
    $0DF1847D,$5E92975A,$D3E623FE,$D66DE190,$7B568048,$5032D6B8,$8235216E,$9A36B7CE,
    $24F64B4A,$80272A7A,$8C6916F7,$93EFED8B,$4CCE1555,$37DDBFF4,$4B99BD25,$4B95DB5D,
    $69812FC0,$92D3FDA1,$90660BB6,$FB1A4A9A,$46A4B9B2,$730C1969,$7F49DA68,$81E289AA,
    $83B1A05F,$64669A0F,$9644F48B,$27B3FF7D,$8DB675B3,$CC6B615C,$BCEBBE95,$674F20B9,
    $75655982,$6F312382,$3E45CF05,$5AE48871,$54C21157,$BF619F99,$40A8EAE9,$EABAC460,
    $F2C0C1CD,$454C6FE9,$6412691C,$419CF649,$265B0F70,$D3DC3BEF,$C3578A9E,$6D0E60F5),
   ($26323C55,$5B0E6085,$FA1B59F5,$1A46C1A9,$7C4C8FFA,$A9E245A1,$DB2955D7,$65CA5159,
    $CE35AFC2,$05DB0A76,$A9113D45,$81EAC77E,$B6AC0A0D,$528EF88A,$597BE3FF,$A09EA253,
    $AC48CD56,$430DDFB3,$F45CE46F,$C4B3A67A,$FBE2D05E,$4ECECFD8,$B39935F0,$3EF56F10,
    $9CD619C6,$0B22D682,$74DF2069,$17FD460A,$8510ED40,$6CF8CC8E,$3A6ECAA7,$D6C824BF,
    $1A817049,$61243D58,$BBC163A2,$048BACB6,$7D44CC32,$D9A38AC2,$AAF410AB,$7FDDFF5B,
    $A804824B,$AD6D495A,$2D8C9F94,$E1A6A74F,$35DEE8E3,$D4F78512,$6540D893,$FD4B7F88,
    $2AA4BFDA,$247C2004,$17D1327C,$096EA1C5,$361A6685,$D56966B4,$1221057D,$277DA5C3,
    $A43ACFF7,$94D59893,$CDC02281,$64F0C51C,$FF6189DB,$3D33BCC4,$4CE66AF1,$E005CB18,
    $1DB99BEA,$FF5CCD1D,$FE42980F,$B0B854A7,$718D4B9F,$7BD46A6A,$22A5FD8C,$D10FA8CC,
    $2BE4BD31,$D3148495,$CB243847,$C7FA975F,$5846C407,$4886ED1E,$1EB70B04,$28CDDB79,
    $F573417F,$C2B00BE2,$2180F877,$5C959045,$F370EB00,$7A6BDDFF,$D6D9D6A4,$CE509E38,
    $647FA702,$EBEB0F00,$76606F06,$1DCC06CF,$A286FF0A,$E4D9F28B,$C918C262,$D85A305D,
    $32225F54,$475B1D87,$68CCB5FE,$2D4FB516,$D72BBA20,$A679B9D9,$912D43A5,$53841C0D,
    $BF12A4E8,$3B7EAA48,$F22F1DDF,$781E0E47,$0AB50973,$EFF20CE6,$9DFFB742,$20D261D1,
    $062A2E39,$16A12B03,$39650495,$1960EB22,$D50EB8B8,$251C16FE,$F826016E,$9AC0C330,
    $953E7671,$ED152665,$A6369570,$02D63194,$94B1C987,$5074F083,$90B25CE1,$70BA598C,
    $0B9742F6,$794A1581,$FCAF8C6C,$0D5925E9,$D868744E,$3067716C,$E8D7731B,$910AB077,
    $5AC42F61,$6A61BBDB,$F0851567,$93513EFB,$9E83E9D5,$F494724B,$5C09648D,$E887E198,
    $75370CFD,$34B1D3C6,$BC0D255D,$DC35E433,$34131BE0,$D0AAB842,$B48B7EAF,$08042A50,
    $44A3AB35,$9997C4EE,$201799D0,$829A7B49,$B7C54441,$263B8307,$FD6A6CA6,$752F95F4,
    $2C08C6E5,$92721740,$A795D9EE,$2A8AB754,$2F72943D,$A442F755,$19781208,$2C31334E,
    $EAEE6291,$4FA98D7C,$665DB309,$55C3862F,$5D53B1F3,$BD061017,$40413F27,$46FE6CB8,
    $DF0CFA59,$3FE03792,$2EB85E8F,$CFE70037,$ADBCE118,$A7BE29E7,$DE8431DD,$E544EE5C,
    $41F1873E,$8A781B1B,$A0D2F0E7,$A5C94C78,$77B60728,$39412E28,$AFC9A62C,$A1265EF3,
    $6A2506C5,$BCC2770C,$DCE1CE12,$3AB66DD5,$4A675B37,$E65499D0,$81BFD216,$7D8F5234,
    $EC15F389,$0F6F64FC,$8B5B13C8,$74EFBE61,$14273E1D,$ACDC82B7,$03199D17,$DD40BFE0,
    $E7E061F8,$37E99257,$04775AAA,$FA526269,$463D56F9,$8BBBF63A,$43A26E64,$F0013F15,
    $879EC898,$A8307E9F,$150177CC,$CC4C27A4,$CA1D3348,$1B432F2C,$9F6FA013,$DE1D1F8F,
    $47A7DDD6,$606602A0,$CC1CB2C7,$D237AB64,$25FCD1D3,$9B938E72,$8E0FF476,$EC4E0370,
    $3D03C12D,$FEB2FBDA,$EE43889A,$AE0BCED2,$EBFB4F43,$22CB8923,$3CF7396D,$69360D01,
    $D2D4E022,$855E3602,$D01F784C,$073805BA,$3852F546,$33E17A13,$8AC7B638,$DF487405,
    $678AA14A,$BA92B29C,$6CFAADCD,$0CE89FC7,$08339E34,$5F9D4E09,$1F5923B9,$F1AFE929,
    $0F4A265F,$6E3480F6,$B29B841C,$EEBF3A2A,$8F91B4AD,$E21938A8,$45C6D3C3,$57DFEFF8,
    $F62CAAF2,$2F006B0B,$6F75EE78,$62F479EF,$1C8916A9,$11A55AD4,$84FED453,$F229D290,
    $16B000E6,$42F1C27B,$9823C074,$2B1F7674,$C2745360,$4B76ECA3,$B91691BD,$8C98F463,
    $F1ADE66A,$14BCC93C,$6D458397,$8885213E,$274D4711,$8E177DF0,$503F2951,$B49B73B5,
    $C3F96B6B,$10168168,$63CAB0AE,$0E3D963B,$55A1DB14,$8DFC4B56,$6E14DE5C,$F789F135,
    $4E51DAC1,$683E68AF,$8D4B0FD9,$C9A84F9D,$52A0F9D1,$3691E03F,$E1878E80,$5ED86E46,
    $99D07150,$3C711A0E,$0C4E9310,$5A0865B2,$E4F0682E,$56FBFC1F,$105EDF9B,$EA8D5DE3,
    $2379187A,$71ABFDB1,$BEE77B9C,$2EB99DE1,$33CF4523,$21ECC0EA,$1805C7A1,$59A4D752,
    $56AE7C72,$3896F5EB,$B18F75DC,$AA638F3D,$ABE9808E,$9F39358D,$C00B72AC,$B7DEFA91,
    $62492D92,$6B5541FD,$F92E4D5B,$6DC6DEE8,$C4BEEA7E,$353F57AB,$DA5690CE,$735769D6,
    $42391484,$0A234AA6,$28F80D9D,$F6F95080,$7AB3F215,$B8E319A2,$51341A4D,$31AD9C11,
    $7BEF5805,$773C22A5,$07968633,$45C7561A,$249DBE36,$F913DA9E,$78A64C68,$DA652D9B,
    $3BC334EF,$4C27A97F,$E66B17F4,$76621220,$9ACD7D0B,$96774389,$E0ED6782,$F3EE5BCA,
    $00C879FC,$409F7536,$B5926DB6,$06D09A39,$317AC588,$6F83AEB0,$86381F21,$01E6CA4A,
    $D19F3025,$66FF3462,$DDFD3BFB,$72207C24,$E2ECE2EB,$4AF6B6D3,$C7EA08DE,$9C994DBE,
    $B09A8BC4,$49ACE597,$CF0797BA,$B38C4766,$C57C2A75,$131B9373,$61931E58,$B1822CCE,
    $09BA1C0C,$9D7555B9,$937D11D2,$127FAFDD,$C66D92E4,$29DA3BAD,$54C2ECBC,$A2C1D571,
    $82F6FE24,$58C5134D,$5B62274F,$1C3AE351,$01CB8126,$E907C82E,$13E37FCB,$F8ED0919,
    $C80046C9,$3249D8F9,$E388FB63,$80CF9BED,$116CF19E,$1881539A,$6BD52457,$5103F3F7,
    $AE47F7A8,$15B7E6F5,$D47E9CCF,$DBD7C6DE,$0228BB1A,$44E55C41,$5EDB4E99,$B647D425,
    $B8AAFC30,$5D11882B,$29D3212A,$F5098BBB,$E90296B3,$8FB5EA14,$57DD025A,$677B9421,
    $A390ACB5,$FB58E7C0,$83BD4A01,$89D3674C,$4BF3B93B,$9E2DA4DF,$8CAB4829,$FCC41E32,
    $BA582C52,$03F38C96,$7FD85DB2,$CAD1BDBD,$6082AE83,$BBB442C1,$A5DA9AB0,$B95FE86B,
    $3771A93F,$B22E0467,$493152D8,$845358C9,$97B4541E,$BE2A4886,$D38E6966,$95A2DC2D,
    $923C852B,$C02C11AC,$0DF2A87B,$2388B199,$1B4F37BE,$7C8008FA,$4D54E503,$1F70D0C8,
    $7ECE57D4,$5490ADEC,$D9063A3A,$002B3C27,$8030A2BF,$7EAEA384,$ED2003C0,$C602326D,
    $69A94086,$83A7287D,$30F57A8A,$C57A5FCB,$79EBE779,$B56844E4,$05DCBCE9,$A373B40F,
    $88570EE2,$D71A786E,$BDE8F6A0,$879CBACD,$C164A32F,$976AD1BC,$9666D78B,$AB21E25E,
    $E5E5C33C,$901063AA,$48698D90,$9818B344,$3E1E8ABB,$E36487AE,$893BDCB4,$AFBDF931,
    $5FBBD519,$6345A0DC,$9B9465CA,$8628FE26,$3F9C51EC,$1E5D0160,$A15049B7,$4DE44006,
    $F776CBB1,$BF6C70E5,$EF552BED,$411218F2,$705A36A3,$CB0C0708,$4F986044,$E74D1475,
    $0EA8280E,$CD56D943,$535F5065,$C12591D7,$720AEF96,$C83223F1,$7363A51F,$C3A0396F));
implementation

end.
