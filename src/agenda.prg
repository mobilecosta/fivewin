#include "FiveWin.ch"
#Include "dll.ch"
#Include "Struct.ch"

#define btn_width  12
#define btn_height 10

#define _clr_fundo_branco      nRGB( 255, 255, 255 )
#define _clr_fundo_cinza       nRGB( 202, 202, 202 )
#define _clr_vermelho_escuro   nRGB( 153, 000, 000 )
#define _clr_fundo_letra       nRGB(165,191,225)
#define _clr_mes_anterior_posterior nRGB(100,100,115)
#define _clr_fundo_azul        nRGB( 204, 232, 255 )
#define _clr_vermelho_hoje     nRGB( 255, 191, 191 )
#define _clr_cinza_escuro      nRGB( 083, 083, 098 )

function Main()
         set delete on
         set exact  on
         set date   german
         set epoch to (Year(date())-80)
         //SET _3DLOOK ON
         set multiple ON

         request dbfcdx
         dbsetdriver("dbfcdx")
         rddsetdefault("dbfcdx")
         REQUEST HB_LANG_PT
         HB_LANGSELECT("PT")
		 
         define brush obrushwindow COLOR rgb(255,255,255)
		 define brush obrushtelaatendimento  file "tela_agenda.bmp"
		 define brush obrushtelaatendimentos file "tela_agenda_semana.bmp"
		 define brush obrushtelaatendimentoc file "tela_agenda_dia.bmp"
		 define brush obrushtelaatendimentod file "tela_lanca_agenda.bmp"
		 
 		 define font mtahomapequenaMin    name "Tahoma"      size 4.0,12  // font padrao para Say/Get/Botoes
 		 define font mtahomapequenaMinb   name "Tahoma"      size 4.0,12 bold  // font padrao para Say/Get/Botoes
         define font mtahoma              name "Tahoma"      size 6.0,15  // font padrao para Say/Get/Botoes
         define font mtahomabold          name "Tahoma" bold size 6.0,15  // font padrao para Say/Get/Botoes
         define font mtahomapequena       name 'Tahoma'      size 07,22   //
         define font mtahomapequenogrande name 'Tahoma'      size 08,22   //
         define font mtahomamenosgrande   name 'Tahoma' bold size 08,22   //
         define font mtahomameiogrande    name 'Tahoma' bold size 09,25   //
         define font mtahomagrande        name 'Tahoma' bold size 12,25   //
         define font mtahomagrandeletra   name 'Tahoma' bold size 14,28   //
		 define font mtahomafacpeq        name "Tahoma"      size 5,14  // font padrao para Say/Get/Botoes
		 define font mtahomagg            name 'Tahoma' bold size 16,32   //
         define font mcouriermenosgrande name 'Tahoma'  bold size 08,22   //
         define font mtahomapesquisaproduto name 'Tahoma'    size 07,19   //
         define font mcourier      name 'courier'            size 0,-10
         define font mcourierMed   name 'courier'            size 0,-9
		 define font mcourierPeq   name 'courier'            size 0,-6
		 define font mcourierxxx   name 'courier'            size 0,-5
         define font mcourierGra   name 'courier'            size 0,-18 
         define font mcourierExt   name 'courier'            size 0,-72
         define font mcourierSup   name 'courier new'        size 0,-12       
         define font mcourierSup0  name 'courier new'        size 0,-11       
         define font mcourierSup1  name 'courier new'   bold size 0,-12       
         define font mcourierSup2  name 'courier new'        size 0,-15       
         define font mtahomamenor  name 'MS Sans Serif'      size 4.5,15         
         define font msanser       name 'MS Sans Serif'      size 6.0,15         
         define font obotaof       name 'MS Sans Serif'      size 6,15           
		 define font olistagem_00A  name "Courier New"       size 0,-5
		 define font olistagem_00B  name "Courier New"       size 0,-6
		 define font olistagem_00C  name "Courier New"       size 0,-7
		 define font olistagem_00D  name "Courier New"       size 0,-8
		 define font olistagem_00E  name "Courier New"       size 0,-9
         define font olistagem_01  name "Courier New"        size 0,-10
         define font olistagem_1A  name "Courier New"        size 0,-11
         define font olistagem_1B  name "Courier New"        size 0,-12
		 define font olistagem_02  name "Courier New"        size 0,-10 bold
         define font olistagem_03  name "Courier New"        size 0,-10 italic
         define font olistagem_04  name "Courier New"        size 0,-8
         define font olistagem_05  name "Courier New"        size 0,-13
         define font olistagem_05A name "Courier New"        size 0,-13 bold
         define font olistagem_06  name "Courier New"        size 0,-9
         define font olistagem_07  name "Courier New"        size 0,-15
		 
         corfrtsay = rgb(000,000,000)   // cor de frente para o say
		 corfdosay = rgb(245,235,223)   // cor de fundo para o say
         corfrtget = rgb(064,078,089)   // cor de frente para a edi‡Æo dos campos
		 corfdoget = rgb(255,255,255)   // cor de fundo para a edi‡Æo dos campos
         corfrtsay = rgb(000,000,000)   // cor de frente para o say
		 corfdosay = rgb(245,235,223)   // cor de fundo para o say
         corfrtsayds = rgb(153,012,005)   // cor de frente para o say destaque
         corfdosayds = rgb(255,255,255)   // cor de fundo  para o say destaque
         corfdogetnotafiscal = rgb(255,255,255)   // cor de fundo para edicao dos campos
		 
		 ztiporetornoAppThemed = .t.
		 
		 
		 ldate = date()
		 
		 define window janela_principal from 0, 0 to 800, 600 title "Calendáro / Agenda de atendimento" brush obrushwindow
				DEFINE BUTTONBAR oBar SIZE 60,60 _3DLOOK OF janela_principal transparent //color corfrtsay,corfdosay
				DEFINE BUTTON  OF oBar PROMPT "" RESOURCE "barra_atendimento" NOBORDER GROUP;
                       TOOLTIP "Manutenção da Agenda" action ( atendimento() )
			    DEFINE BUTTON  OF oBar PROMPT "" RESOURCE "barra_sair" NOBORDER GROUP;
                       TOOLTIP "Sair do sistema" action ( janela_principal:end() )
				
				SET MESSAGE OF janela_principal TO "" NOINSET CLOCK DATE KEYBOARD font mtahoma color corfrtsay,corfdosay
		 activate window janela_principal maximized
return nil

// Daqui para baixo faz o atendimento na tela geral...........................................................................................................
function atendimento(_objetdt_inicio)
         
         define window ojanela_atendimento from 0, 0 to 800, 600 color rgb(255,255,255),rgb(255,255,255) STYLE WS_POPUP
		 activate window ojanela_atendimento maximized

		 define dialog atendimento title "" from 000,000 to 720,1020 Pixel brush obrushtelaatendimento STYLE WS_POPUP transparent
		        define cursor ohand hand
         
				mdiadasemana01 = space(14)
				mdiadasemana02 = space(14)
				mdiadasemana03 = space(14)
				mdiadasemana04 = space(14)
				mdiadasemana05 = space(14)
				mdiadasemana06 = space(14)
				mdiadasemana07 = space(14)
				mdiadasemana08 = space(14)
				mdiadasemana09 = space(14)
				mdiadasemana10 = space(14)
				mdiadasemana11 = space(14)
				mdiadasemana12 = space(14)
				mdiadasemana13 = space(14)
				mdiadasemana14 = space(14)
				mdiadasemana15 = space(14)
				mdiadasemana16 = space(14)
				mdiadasemana17 = space(14)
				mdiadasemana18 = space(14)
				mdiadasemana19 = space(14)
				mdiadasemana20 = space(14)
				mdiadasemana21 = space(14)
				mdiadasemana22 = space(14)
				mdiadasemana23 = space(14)
				mdiadasemana24 = space(14)
				mdiadasemana25 = space(14)
				mdiadasemana26 = space(14)
				mdiadasemana27 = space(14)
				mdiadasemana28 = space(14)
				mdiadasemana29 = space(14)
				mdiadasemana30 = space(14)
				mdiadasemana31 = space(14)
				mdiadasemana32 = space(14)
				mdiadasemana33 = space(14)
				mdiadasemana34 = space(14)
				mdiadasemana35 = space(14)
				mdiadasemana36 = space(14)
				mdiadasemana37 = space(14)
				mdiadasemana38 = space(14)
				mdiadasemana39 = space(14)
				mdiadasemana40 = space(14)
				mdiadasemana41 = space(14)
				mdiadasemana42 = space(14)
				
				mdatainterna01 = ""
				mdatainterna02 = ""
				mdatainterna03 = ""
				mdatainterna04 = ""
				mdatainterna05 = ""
				mdatainterna06 = ""
				mdatainterna07 = ""
				mdatainterna08 = ""
				mdatainterna09 = ""
				mdatainterna10 = ""
				mdatainterna11 = ""
				mdatainterna12 = ""
				mdatainterna13 = ""
				mdatainterna14 = ""
				mdatainterna15 = ""
				mdatainterna16 = ""
				mdatainterna17 = ""
				mdatainterna18 = ""
				mdatainterna19 = ""
				mdatainterna20 = ""
				mdatainterna21 = ""
				mdatainterna22 = ""
				mdatainterna23 = ""
				mdatainterna24 = ""
				mdatainterna25 = ""
				mdatainterna26 = ""
				mdatainterna27 = ""
				mdatainterna28 = ""
				mdatainterna29 = ""
				mdatainterna30 = ""
				mdatainterna31 = ""
				mdatainterna32 = ""
				mdatainterna33 = ""
				mdatainterna34 = ""
				mdatainterna35 = ""
				mdatainterna36 = ""
				mdatainterna37 = ""
				mdatainterna38 = ""
				mdatainterna39 = ""
				mdatainterna40 = ""
				mdatainterna41 = ""
				mdatainterna42 = ""
				_datainterna_marcado = ""
				
			    _mes = ""
		        _ano = ""
				
				_ncdiainicio = {"Domingo","Segunda-feira","Terça-feira","Quarta-feira",;
                                "Quinta-feira","Sexta-feira","Sábado"}
				
				_mMesAno      = ""
				_nDataInicio = _objetdt_inicio
				if empty(_nDataInicio)
				   _nDataInicio  = ldate
				endif
				_nMesAmostra  = month(_nDataInicio)
				_nAnoAmostra  = year(_nDataInicio)
				
		        _totalcontasareceber = 0
		        _totalcontasapagar = 0
				_totalvendas = 0
				
				_mseqfuncionario = 0
		        _mnomefuncionario = space(60)
				mRafuncionario := {}
                mRrecfuncionario := {}
                mRfuncionario = space(50)
                aadd( mRafuncionario,space(60) )
                aadd( mRrecfuncionario,0)
				
				_porsemanadia = 1
				
                // 1º linha ..................................................................................................................................
				@ 016,111 say odiadasemana01 var mdiadasemana01 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 016,168 say odiadasemana02 var mdiadasemana02 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 016,224 say odiadasemana03 var mdiadasemana03 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 016,281 say odiadasemana04 var mdiadasemana04 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 016,337 say odiadasemana05 var mdiadasemana05 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 016,394 say odiadasemana06 var mdiadasemana06 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 016,450 say odiadasemana07 var mdiadasemana07 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
				
				@ 015,153 BTNBMP obotaolho01 left size 013,09 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(1) ) pixel
				@ 015,210 BTNBMP obotaolho02 left size 013,09 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(2) ) pixel
				@ 015,266 BTNBMP obotaolho03 left size 013,09 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(3) ) pixel
				@ 015,323 BTNBMP obotaolho04 left size 013,09 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(4) ) pixel
				@ 015,379 BTNBMP obotaolho05 left size 013,09 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(5) ) pixel
				@ 015,436 BTNBMP obotaolho06 left size 013,09 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(6) ) pixel
				@ 015,492 BTNBMP obotaolho07 left size 013,09 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(7) ) pixel
				
				@ 025,111 BTNBMP obotaocalendario01 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(1) ) pixel
				@ 025,168 BTNBMP obotaocalendario02 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(2) ) pixel
				@ 025,224 BTNBMP obotaocalendario03 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(3) ) pixel
				@ 025,281 BTNBMP obotaocalendario04 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(4) ) pixel
				@ 025,337 BTNBMP obotaocalendario05 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(5) ) pixel
				@ 025,394 BTNBMP obotaocalendario06 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(6) ) pixel
				@ 025,450 BTNBMP obotaocalendario07 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(7) ) pixel

                // 2º linha ..................................................................................................................................
				@ 073,111 say odiadasemana08 var mdiadasemana08 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 073,168 say odiadasemana09 var mdiadasemana09 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 073,224 say odiadasemana10 var mdiadasemana10 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 073,281 say odiadasemana11 var mdiadasemana11 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 073,337 say odiadasemana12 var mdiadasemana12 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 073,394 say odiadasemana13 var mdiadasemana13 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 073,450 say odiadasemana14 var mdiadasemana14 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
				
				@ 072,153 BTNBMP obotaolho08 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(8) ) pixel
				@ 072,210 BTNBMP obotaolho09 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(9) ) pixel
				@ 072,266 BTNBMP obotaolho10 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(10) ) pixel
				@ 072,323 BTNBMP obotaolho11 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(11) ) pixel
				@ 072,379 BTNBMP obotaolho12 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(12) ) pixel
				@ 072,436 BTNBMP obotaolho13 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(13) ) pixel
				@ 072,492 BTNBMP obotaolho14 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(14) ) pixel
				
				@ 082,111 BTNBMP obotaocalendario08 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(8)  ) pixel
				@ 082,168 BTNBMP obotaocalendario09 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(9)  ) pixel
				@ 082,224 BTNBMP obotaocalendario10 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(10) ) pixel
				@ 082,281 BTNBMP obotaocalendario11 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(11) ) pixel
				@ 082,337 BTNBMP obotaocalendario12 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(12) ) pixel
				@ 082,394 BTNBMP obotaocalendario13 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(13) ) pixel
				@ 082,450 BTNBMP obotaocalendario14 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(14) ) pixel
				
                // 3º linha ..................................................................................................................................
                @ 130,111 say odiadasemana15 var mdiadasemana15 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 130,168 say odiadasemana16 var mdiadasemana16 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 130,224 say odiadasemana17 var mdiadasemana17 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 130,281 say odiadasemana18 var mdiadasemana18 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 130,337 say odiadasemana19 var mdiadasemana19 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 130,394 say odiadasemana20 var mdiadasemana20 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 130,450 say odiadasemana21 var mdiadasemana21 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
				
				@ 129,153 BTNBMP obotaolho15 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(15) ) pixel
				@ 129,210 BTNBMP obotaolho16 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(16) ) pixel
				@ 129,266 BTNBMP obotaolho17 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(17) ) pixel
				@ 129,323 BTNBMP obotaolho18 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(18) ) pixel
				@ 129,379 BTNBMP obotaolho19 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(19) ) pixel
				@ 129,436 BTNBMP obotaolho20 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(20) ) pixel
				@ 129,492 BTNBMP obotaolho21 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(21) ) pixel

				@ 139,111 BTNBMP obotaocalendario15 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(15) ) pixel
				@ 139,168 BTNBMP obotaocalendario16 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(16) ) pixel
				@ 139,224 BTNBMP obotaocalendario17 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(17) ) pixel
				@ 139,281 BTNBMP obotaocalendario18 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(18) ) pixel
				@ 139,337 BTNBMP obotaocalendario19 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(19) ) pixel
				@ 139,394 BTNBMP obotaocalendario20 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(20) ) pixel
				@ 139,450 BTNBMP obotaocalendario21 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(21) ) pixel
				
                // 4º linha ..................................................................................................................................
                @ 187,111 say odiadasemana22 var mdiadasemana22 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 187,168 say odiadasemana23 var mdiadasemana23 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 187,224 say odiadasemana24 var mdiadasemana24 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 187,281 say odiadasemana25 var mdiadasemana25 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 187,337 say odiadasemana26 var mdiadasemana26 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 187,394 say odiadasemana27 var mdiadasemana27 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 187,450 say odiadasemana28 var mdiadasemana28 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
				
				@ 186,153 BTNBMP obotaolho22 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(22) ) pixel
				@ 186,210 BTNBMP obotaolho23 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(23) ) pixel
				@ 186,266 BTNBMP obotaolho24 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(24) ) pixel
				@ 186,323 BTNBMP obotaolho25 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(25) ) pixel
				@ 186,379 BTNBMP obotaolho26 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(26) ) pixel
				@ 186,436 BTNBMP obotaolho27 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(27) ) pixel
				@ 186,492 BTNBMP obotaolho28 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(28) ) pixel
				
				@ 196,111 BTNBMP obotaocalendario22 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(22) ) pixel
				@ 196,168 BTNBMP obotaocalendario23 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(23) ) pixel
				@ 196,224 BTNBMP obotaocalendario24 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(24) ) pixel
				@ 196,281 BTNBMP obotaocalendario25 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(25) ) pixel
				@ 196,337 BTNBMP obotaocalendario26 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(26) ) pixel
				@ 196,394 BTNBMP obotaocalendario27 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(27) ) pixel
				@ 196,450 BTNBMP obotaocalendario28 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(28) ) pixel
				
                // 5º linha ..................................................................................................................................
                @ 244,111 say odiadasemana29 var mdiadasemana29 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 244,168 say odiadasemana30 var mdiadasemana30 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 244,224 say odiadasemana31 var mdiadasemana31 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 244,281 say odiadasemana32 var mdiadasemana32 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 244,337 say odiadasemana33 var mdiadasemana33 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 244,394 say odiadasemana34 var mdiadasemana34 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 244,450 say odiadasemana35 var mdiadasemana35 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
				
				@ 243,153 BTNBMP obotaolho29 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(29) ) pixel
				@ 243,210 BTNBMP obotaolho30 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(30) ) pixel
				@ 243,266 BTNBMP obotaolho31 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(31) ) pixel
				@ 243,323 BTNBMP obotaolho32 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(32) ) pixel
				@ 243,379 BTNBMP obotaolho33 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(33) ) pixel
				@ 243,436 BTNBMP obotaolho34 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(34) ) pixel
				@ 243,492 BTNBMP obotaolho35 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(35) ) pixel
				
				@ 253,111 BTNBMP obotaocalendario29 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(29) ) pixel
				@ 253,168 BTNBMP obotaocalendario30 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(30) ) pixel
				@ 253,224 BTNBMP obotaocalendario31 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(31) ) pixel
				@ 253,281 BTNBMP obotaocalendario32 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(32) ) pixel
				@ 253,337 BTNBMP obotaocalendario33 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(33) ) pixel
				@ 253,394 BTNBMP obotaocalendario34 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(34) ) pixel
				@ 253,450 BTNBMP obotaocalendario35 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(35) ) pixel
				
                // 6º linha ..................................................................................................................................
                @ 301,111 say odiadasemana36 var mdiadasemana36 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 301,168 say odiadasemana37 var mdiadasemana37 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 301,224 say odiadasemana38 var mdiadasemana38 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 301,281 say odiadasemana39 var mdiadasemana39 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 301,337 say odiadasemana40 var mdiadasemana40 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 301,394 say odiadasemana41 var mdiadasemana41 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
                @ 301,450 say odiadasemana42 var mdiadasemana42 font mtahomafacpeq size 042,08 of atendimento color corfrtsay,corfdosay pixel
				
				@ 300,153 BTNBMP obotaolho36 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(36) ) pixel
				@ 300,210 BTNBMP obotaolho37 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(37) ) pixel
				@ 300,266 BTNBMP obotaolho38 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(38) ) pixel
				@ 300,323 BTNBMP obotaolho39 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(39) ) pixel
				@ 300,379 BTNBMP obotaolho40 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(40) ) pixel
				@ 300,436 BTNBMP obotaolho41 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(41) ) pixel
				@ 300,492 BTNBMP obotaolho42 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento action ( _agenda_atendimento(42) ) pixel
				
				@ 310,111 BTNBMP obotaocalendario36 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(36) ) pixel
				@ 310,168 BTNBMP obotaocalendario37 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(37) ) pixel
				@ 310,224 BTNBMP obotaocalendario38 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(38) ) pixel
				@ 310,281 BTNBMP obotaocalendario39 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(39) ) pixel
				@ 310,337 BTNBMP obotaocalendario40 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(40) ) pixel
				@ 310,394 BTNBMP obotaocalendario41 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(41) ) pixel
				@ 310,450 BTNBMP obotaocalendario42 center size 055,046 font obotaof noborder of atendimento action ( _marca_atendimento_agenda(42) ) pixel
				
				@ 009,003 BTNBMP oatendimentobut01 left size 009,10 font obotaof noborder resource "agenda_esquerda" of atendimento action ( atendimento_esquerda() ) pixel
				oatendimentobut01:lTransparent = .t.
				oatendimentobut01:refresh()
				@ 009,013 BTNBMP oatendimentobut02 left size 009,10 font obotaof noborder resource "agenda_direita"  of atendimento action ( atendimento_direita() ) pixel
				oatendimentobut02:lTransparent = .t.
				oatendimentobut02:refresh()
                @ 007,023 say _oMesAno  var _mMesAno  font mtahomameiogrande of atendimento size 080,15 color corfrtsay,corfdosay pixel center
				
                @ 028,002 btnbmp oatendimentobut03 size btn_width, btn_height name "search" noborder of atendimento 
				oatendimentobut03:lTransparent := .t.
				oatendimentobut03:refresh()
				@ 026,038 say _ototalcontasareceber var _totalcontasareceber picture "@e 999,999,999.99" font mtahomameiogrande of atendimento size 065,15 color _clr_cinza_escuro,corfdosay pixel right
				@ 045,038 say _ototalcontasapagar var _totalcontasapagar picture "@e 999,999,999.99" font mtahomameiogrande of atendimento size 065,15 color _clr_cinza_escuro,corfdosay pixel right
				@ 064,038 say _ototalvendas var _totalvendas picture "@e 999,999,999.99" font mtahomameiogrande of atendimento size 065,15 color _clr_cinza_escuro,corfdosay pixel right
				
                @ 080,003 BTNBMP oatendimentobut06 left size 032,30 font obotaof noborder resource "barra_cliente" of atendimento
				oatendimentobut06:lTransparent = .t.                                                                       
				oatendimentobut06:refresh()                                                                                
                @ 080,037 BTNBMP oatendimentobut07 left size 032,30 font obotaof noborder resource "barra_vendedor" of atendimento
				oatendimentobut07:lTransparent = .t.                                                                       
				oatendimentobut07:refresh()                                                                                
                @ 080,071 BTNBMP oatendimentobut08 left size 032,30 font obotaof noborder resource "barra_produto" of atendimento
				oatendimentobut08:lTransparent = .t.                                                                       
				oatendimentobut08:refresh()                                                                                
																													       
				// Menu
				@ 114,003 BTNBMP oatendimentobut09 left size 032,30 font obotaof noborder resource "barra_fornecedor" of atendimento
				oatendimentobut09:lTransparent = .t.                                                                       
				oatendimentobut09:refresh()                                                                                
                @ 114,037 BTNBMP oatendimentobut10 left size 032,30 font obotaof noborder resource "barra_pagar" of atendimento
				oatendimentobut10:lTransparent = .t.                                                                  
				oatendimentobut10:refresh()                                                                           
                @ 114,071 BTNBMP oatendimentobut11 left size 032,30 font obotaof noborder resource "barra_receber" of atendimento
				oatendimentobut11:lTransparent = .t.
				oatendimentobut11:refresh()

				// Menu
                @ 147,003 BTNBMP oatendimentobut12 left size 032,30 font obotaof noborder resource "barra_pedido" of atendimento
				oatendimentobut12:lTransparent = .t.
				oatendimentobut12:refresh()
                @ 147,037 BTNBMP oatendimentobut13 left size 032,30 font obotaof noborder resource "barra_vendas" of atendimento
				oatendimentobut13:lTransparent = .t.
				oatendimentobut13:refresh()
                @ 147,071 BTNBMP oatendimentobut14 left size 032,30 font obotaof noborder resource "barra_orçamento" of atendimento
				oatendimentobut14:lTransparent = .t.
				oatendimentobut14:refresh()
				
                // funcionários
				@ 191,003 combobox oRfuncionario var mRfuncionario items mRafuncionario font mtahoma size 101,100 of atendimento color corfrtget,corfdoget pixel on change( _ver_funcionario_cd() ) 
				
                // por semana ou por dia
				@ 209,015 RADIO _oporsemanadia VAR _porsemanadia OF atendimento color corfrtsay,corfdosay PIXEL SIZE 40,8
                oradio := TRadio():New( 209,015, "Semana",            ;
                                        .T.,                          ;
                                        .T.,                          ;
                                        1, atendimento, _oporsemanadia, , , , , .F., , ;
                                        35, 8, , .F., .T. )
                _oporsemanadia:AddRadio( oradio )
                oradio := TRadio():New( 209,059, "Dia",         ;
                                        .F.,                          ;
                                        .F.,                          ;
                                        2, atendimento, _oporsemanadia, , , , , .F., , ;
                                        35, 8, , .F., .T. )
                _oporsemanadia:AddRadio( oradio )

				@ 340,002 BTNBMP oatendimentobut30 size 103,20 font obotaof of atendimento noborder pixel action ( atendimento:end() ) 
				oatendimentobut30:SetFile("but_agenda_sair.bmp")
				oatendimentobut30:lTransparent = .t.
				oatendimentobut30:refresh()
				
				obotaocalendario01:oCursor := ohand
				obotaocalendario02:oCursor := ohand
				obotaocalendario03:oCursor := ohand
				obotaocalendario04:oCursor := ohand
				obotaocalendario05:oCursor := ohand
				obotaocalendario06:oCursor := ohand
				obotaocalendario07:oCursor := ohand
				obotaocalendario08:oCursor := ohand
				obotaocalendario09:oCursor := ohand
				obotaocalendario10:oCursor := ohand
				obotaocalendario11:oCursor := ohand
				obotaocalendario12:oCursor := ohand
				obotaocalendario13:oCursor := ohand
				obotaocalendario14:oCursor := ohand
				obotaocalendario15:oCursor := ohand
				obotaocalendario16:oCursor := ohand
				obotaocalendario17:oCursor := ohand
				obotaocalendario18:oCursor := ohand
				obotaocalendario19:oCursor := ohand
				obotaocalendario20:oCursor := ohand
				obotaocalendario21:oCursor := ohand
				obotaocalendario22:oCursor := ohand
				obotaocalendario23:oCursor := ohand
				obotaocalendario24:oCursor := ohand
				obotaocalendario25:oCursor := ohand
				obotaocalendario26:oCursor := ohand
				obotaocalendario27:oCursor := ohand
				obotaocalendario28:oCursor := ohand
				obotaocalendario29:oCursor := ohand
				obotaocalendario30:oCursor := ohand
				obotaocalendario31:oCursor := ohand
				obotaocalendario32:oCursor := ohand
				obotaocalendario33:oCursor := ohand
				obotaocalendario34:oCursor := ohand
				obotaocalendario35:oCursor := ohand
				obotaocalendario36:oCursor := ohand
				obotaocalendario37:oCursor := ohand
				obotaocalendario38:oCursor := ohand
				obotaocalendario39:oCursor := ohand
				obotaocalendario40:oCursor := ohand
				obotaocalendario41:oCursor := ohand
				obotaocalendario42:oCursor := ohand
				
		 activate dialog atendimento center on init ( gera_calendario(_nMesAmostra,_nAnoAmostra) )
		 ojanela_atendimento:end()
		 
return nil

function _ver_funcionario_cd()
         _mseqfuncionario = 0
		 _mnomefuncionario = space(60)
		 if !empty(mRfuncionario)
            for _ttqq = 1 to len(mRafuncionario)
                if alltrim(mRafuncionario[_ttqq]) = alltrim(mRfuncionario)
                   _mseqfuncionario = mRrecfuncionario[_ttqq]
				   _mnomefuncionario = alltrim(mRfuncionario)
				   exit
                endif
            next
         endif
		 _datainterna_marcado = ""
		 gera_calendario(_nMesAmostra,_nAnoAmostra)
return nil

function atendimento_esquerda()
         _nDataInicio = calcmes(_nDataInicio, -1)
		 _nMesAmostra  = month(_nDataInicio)
		 _nAnoAmostra  = year(_nDataInicio)
		 _datainterna_marcado = ""
		 gera_calendario(_nMesAmostra,_nAnoAmostra)
return nil

function atendimento_direita()
         _nDataInicio = calcmes(_nDataInicio, 1)
		 _nMesAmostra  = month(_nDataInicio)
		 _nAnoAmostra  = year(_nDataInicio)
		 _datainterna_marcado = ""
		 gera_calendario(_nMesAmostra,_nAnoAmostra)
return nil

function gera_calendario(_objetmes,_objetano,_onumeromarcar)
         
		 _dia = "01"
		 if empty(_objetmes)
		    _mes = alltrim(strzero(month(ldate),2))
		 else
			_mes = strzero(_objetmes,2)
		 endif
		 if empty(_objetano)
		    _ano = alltrim(str(year(ldate)))
		 else
			_ano = alltrim(str(_objetano))
		 endif
		 
		 _nomedomes = ""
		 if _mes = "01"
		    _nomedomes = "Janeiro"
		 elseif _mes = "02"
		    _nomedomes = "Fevereiro"
		 elseif _mes = "03"
		    _nomedomes = "Março"
		 elseif _mes = "04"
		    _nomedomes = "Abril"
		 elseif _mes = "05"
		    _nomedomes = "Maio"
		 elseif _mes = "06"
		    _nomedomes = "Junho"
		 elseif _mes = "07"
		    _nomedomes = "Julho"
		 elseif _mes = "08"
		    _nomedomes = "Agosto"
		 elseif _mes = "09"
		    _nomedomes = "Setembro"
		 elseif _mes = "10"
		    _nomedomes = "Outubro"
		 elseif _mes = "11"
		    _nomedomes = "Novembro"
		 elseif _mes = "12"
		    _nomedomes = "Dezembro"
		 endif
		 
		 if _nomedomes = "Março"
		    _oMesAno:settext("MARÇO" + "/" + _ano)
		 else
		    _oMesAno:settext(upper(_nomedomes) + "/" + _ano)
		 endif
		 
		 _dtinicio = ctod(_dia + "/" + _mes + "/" + _ano)
		 _dtfinal  = pega_ultimo_diasint(_dtinicio)
		 _ultimodia = val(pega_ultimo_dia_numero(_dtfinal))
		 
		 _diacomeca  = _ncdiainicio[dow(_dtinicio)]
		 
		 mdatainterna01 = ""
		 mdatainterna02 = ""
		 mdatainterna03 = ""
		 mdatainterna04 = ""
		 mdatainterna05 = ""
		 mdatainterna06 = ""
		 mdatainterna07 = ""
		 mdatainterna08 = ""
		 mdatainterna09 = ""
		 mdatainterna10 = ""
		 mdatainterna11 = ""
		 mdatainterna12 = ""
		 mdatainterna13 = ""
		 mdatainterna14 = ""
		 mdatainterna15 = ""
		 mdatainterna16 = ""
		 mdatainterna17 = ""
		 mdatainterna18 = ""
		 mdatainterna19 = ""
		 mdatainterna20 = ""
		 mdatainterna21 = ""
		 mdatainterna22 = ""
		 mdatainterna23 = ""
		 mdatainterna24 = ""
		 mdatainterna25 = ""
		 mdatainterna26 = ""
		 mdatainterna27 = ""
		 mdatainterna28 = ""
		 mdatainterna29 = ""
		 mdatainterna30 = ""
		 mdatainterna31 = ""
		 mdatainterna32 = ""
		 mdatainterna33 = ""
		 mdatainterna34 = ""
		 mdatainterna35 = ""
		 mdatainterna36 = ""
		 mdatainterna37 = ""
		 mdatainterna38 = ""
		 mdatainterna39 = ""
		 mdatainterna40 = ""
		 mdatainterna41 = ""
		 mdatainterna42 = ""
		 
		 _nndiasemanas   = 1
		 _nndiaanterior  = 1
		 _nndiaposterior = 1
		 _nnmarcadohoje  = 0
		 
		 _totalcontasareceber = 0
		 _ototalcontasareceber:settext(_totalcontasareceber)
		 _totalcontasapagar = 0
		 _ototalcontasapagar:settext(_totalcontasapagar)
		 _totalvendas = 0
		 _ototalvendas:settext(_totalvendas)
		 
		 for _nn = 1 to 42
			 
			 _mbutolho = "obotaolho" + strzero(_nn,2)
			 &_mbutolho:SetColor( corfrtsay,_clr_fundo_letra )
			 //&_mbutolho:lTransparent = .t.
			 &_mbutolho:refresh()
			 
			 _mbut = "obotaocalendario" + strzero(_nn,2)
			 &_mbut:disable()
			 _nom = "mdiadasemana" + strzero(_nn,2)
			 &_nom = space(14)
			 _mnom = "odiadasemana" + strzero(_nn,2)
			 &_mnom:settext(space(14))
			 &_mnom:setfont(mtahomafacpeq)
			 &_mnom:SetColor( corfrtsay,_clr_fundo_letra )
			 &_mnom:refresh()
			 &_mbut:SetColor( corfrtsay,_clr_fundo_cinza )
			 &_mbut:refresh()
			 
			 if _nndiasemanas = 1
			    if _nn = 1
				   if _diacomeca = "Domingo"
					  &_mbut:enable()
					  &_mbut:SetColor( corfrtsay,_clr_fundo_branco )
					  &_mbut:refresh()
					  &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
			          &_nom = alltrim(str(_nndiasemanas))
					  
					  _datainterna  = "mdatainterna" + strzero(_nn,2)
					  &_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					  if &_datainterna = ldate
		                 &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					     &_mbut:refresh()
						 &_mnom:setfont(mtahomabold)
						 &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
						 &_mnom:refresh()
						 &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
						 _nnmarcadohoje = _nn
					  endif
				      ++_nndiasemanas
				   endif
				elseif _nn = 2
				   if _diacomeca = "Segunda-feira"
					  &_mbut:enable()
					  &_mbut:SetColor( corfrtsay,_clr_fundo_branco )
				      &_mbut:refresh()
					  &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
			          &_nom = alltrim(str(_nndiasemanas))
					  
					  _datainterna  = "mdatainterna" + strzero(_nn,2)
					  &_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					  if &_datainterna = ldate
		                 &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					     &_mbut:refresh()
					     &_mnom:setfont(mtahomabold)
						 &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
						 &_mnom:refresh()
					     &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
						 _nnmarcadohoje = _nn
					  endif
				      ++_nndiasemanas
				   endif
				elseif _nn = 3
				   if _diacomeca = "Terça-feira"
					  &_mbut:enable()
					  &_mbut:SetColor( corfrtsay,_clr_fundo_branco )
				      &_mbut:refresh()
					  &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
			          &_nom = alltrim(str(_nndiasemanas))
					  
					  _datainterna  = "mdatainterna" + strzero(_nn,2)
					  &_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					  if &_datainterna = ldate
		                 &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					     &_mbut:refresh()
					     &_mnom:setfont(mtahomabold)
						 &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
						 &_mnom:refresh()
					     &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
						 _nnmarcadohoje = _nn
					  endif
				      ++_nndiasemanas
				   endif
				elseif _nn = 4
				   if _diacomeca = "Quarta-feira"
					  &_mbut:enable()
					  &_mbut:SetColor( corfrtsay,_clr_fundo_branco )
				      &_mbut:refresh()
					  &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
			          &_nom = alltrim(str(_nndiasemanas))
					  
					  _datainterna  = "mdatainterna" + strzero(_nn,2)
					  &_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					  if &_datainterna = ldate
		                 &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					     &_mbut:refresh()
					     &_mnom:setfont(mtahomabold)
						 &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
						 &_mnom:refresh()
					     &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
						 _nnmarcadohoje = _nn
					  endif
				      ++_nndiasemanas
				   endif
				elseif _nn = 5
				   if _diacomeca = "Quinta-feira"
					  &_mbut:enable()
					  &_mbut:SetColor( corfrtsay,_clr_fundo_branco )
				      &_mbut:refresh()
					  &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
			          &_nom = alltrim(str(_nndiasemanas))
					  
					  _datainterna  = "mdatainterna" + strzero(_nn,2)
					  &_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					  if &_datainterna = ldate
		                 &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					     &_mbut:refresh()
					     &_mnom:setfont(mtahomabold)
						 &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
						 &_mnom:refresh()
					     &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
						 _nnmarcadohoje = _nn
					  endif
				      ++_nndiasemanas
				   endif
				elseif _nn = 6
				   if _diacomeca = "Sexta-feira"
					  &_mbut:enable()
					  &_mbut:SetColor( corfrtsay,_clr_fundo_branco )
				      &_mbut:refresh()
					  &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
			          &_nom = alltrim(str(_nndiasemanas))
					  
					  _datainterna  = "mdatainterna" + strzero(_nn,2)
					  &_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					  if &_datainterna = ldate
		                 &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					     &_mbut:refresh()
					     &_mnom:setfont(mtahomabold)
						 &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
						 &_mnom:refresh()
					     &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
						 _nnmarcadohoje = _nn
					  endif
				      ++_nndiasemanas
				   endif
				elseif _nn = 7
				   if _diacomeca = "Sábado"
					  &_mbut:enable()
					  &_mbut:SetColor( corfrtsay,_clr_fundo_branco )
				      &_mbut:refresh()
					  &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
			          &_nom = alltrim(str(_nndiasemanas))
					  
					  _datainterna  = "mdatainterna" + strzero(_nn,2)
					  &_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					  if &_datainterna = ldate
		                 &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					     &_mbut:refresh()
					     &_mnom:setfont(mtahomabold)
						 &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
						 &_mnom:refresh()
					     &_mnom:settext(alltrim(str(_nndiasemanas)) + " " + _nomedomes )
						 _nnmarcadohoje = _nn
					  endif
				      ++_nndiasemanas
				   endif
				endif
			 else
				if _nndiasemanas <= _ultimodia
					&_mbut:enable()
					&_mbut:SetColor( corfrtsay,_clr_fundo_branco )
				    &_mbut:refresh()
					&_mnom:settext(alltrim(str(_nndiasemanas))+ " " + _nomedomes)
					_datainterna  = "mdatainterna" + strzero(_nn,2)
			        &_nom = alltrim(str(_nndiasemanas))
					  
					&_datainterna = ctod(strzero(_nndiasemanas,2) + "/" + _mes + "/" + _ano)
					if &_datainterna = ldate
		               &_mbut:SetColor( corfrtsay,_clr_vermelho_hoje )
					   &_mbut:refresh()
					   &_mnom:setfont(mtahomabold)
					   &_mnom:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
					   &_mnom:refresh()
					   &_mnom:settext(alltrim(str(_nndiasemanas))+ " " + _nomedomes)
						 _nnmarcadohoje = _nn
					endif
				    ++_nndiasemanas
				else
				    // preenche a data posterior ao mês que esta sendo visualizado............................................................................
					&_mnom:settext(alltrim(str(_nndiaposterior)))
			        &_nom = "." + alltrim(str(_nndiaposterior))
				    &_mnom:SetColor( _clr_mes_anterior_posterior,_clr_fundo_letra )
					&_mnom:refresh()
				    ++_nndiaposterior
				endif
			 endif
		     	 
	     next
		 
		 // preenche a data anterior ao mês que esta sendo visualizado........................................................................................
		 _nqtdlivre = 0
		 for _nn = 1 to 42
			 _mnom = "mdiadasemana" + strzero(_nn,2)
		     if empty(&_mnom)
			    ++_nqtdlivre
		     endif
		 next
		 if _nqtdlivre > 0
             nMesAnterior = calcmes(_nDataInicio, -1)
		     _ultimodiaMesAnterior = val(pega_ultimo_dia_numero(nMesAnterior))
			 _InicioMesAnterior = ( _ultimodiaMesAnterior - _nqtdlivre ) + 1
			 for _nn = 1 to _nqtdlivre
			     _mnomAnt = "odiadasemana" + strzero(_nn,2)
				 &_mnomAnt:settext(alltrim(str(_InicioMesAnterior)))
			     _nomAnt = "mdiadasemana" + strzero(_nn,2)
			     &_nomAnt = "." + alltrim(str(_InicioMesAnterior))
				 &_mnomAnt:SetColor( _clr_mes_anterior_posterior,_clr_fundo_letra )
				 &_mnomAnt:refresh()
				 ++_InicioMesAnterior
			 next
		 endif
		 
		 if !empty(_onumeromarcar)
		    _marca_atendimento_agenda(val(_onumeromarcar))
		 else
			if _nnmarcadohoje > 0
               _marca_atendimento_agenda(_nnmarcadohoje)
			endif
	     endif
         
return nil

function _marca_atendimento_agenda(_objetMarca)
		for _ttqq = 1 to 42
		    _datainterna_em_branco  = "mdatainterna" + strzero(_ttqq,2)
		    _mbut_marca_em_branco   = "obotaocalendario" + strzero(_ttqq,2)
			if !empty(&_datainterna_em_branco)
               if &_datainterna_em_branco = ldate
		          &_mbut_marca_em_branco:SetColor( corfrtsay,_clr_vermelho_hoje )
				  &_mbut_marca_em_branco:refresh()
               else
			      &_mbut_marca_em_branco:SetColor( corfrtsay,_clr_fundo_branco )
			      &_mbut_marca_em_branco:refresh()
			   endif
			endif
		next
		_mbut_marca = "obotaocalendario" + strzero(_objetMarca,2)
		&_mbut_marca:SetColor( corfrtsay,_clr_fundo_azul )
		&_mbut_marca:refresh()
		
		_datainterna_marcado  = "mdatainterna" + strzero(_objetMarca,2)
		
		
		// Aqui procura os dados a serem apresentados.. na base de dados
		// contas a pagar, contas a receber, vendas.. etc...
		
		_totalcontasareceber = 0
		_ototalcontasareceber:settext(_totalcontasareceber)
		_totalcontasapagar   = 0
		_ototalcontasapagar:settext(_totalcontasapagar)
		_totalvendas = 0
		_ototalvendas:settext(_totalvendas)
		
return nil

function _agenda_atendimento(_objetMenu_atendimento)
		 if empty(_datainterna_marcado)
		    return nil
		 endif
		 if val(substr(_datainterna_marcado,13,2)) != _objetMenu_atendimento
		    return nil
		 endif
		 _qualdia = _ncdiainicio[dow(&_datainterna_marcado)]
		 if _qualdia = "Domingo"
		    return nil
		 endif
		 
		 // aqui ...
		 if _porsemanadia = 1
			atendimento_semana(&_datainterna_marcado,substr(_datainterna_marcado,13,2))
	     elseif _porsemanadia = 2
		    atendimento_dia(&_datainterna_marcado,substr(_datainterna_marcado,13,2))
		 endif
		 
return nil

// Atendimenton diário.
function atendimento_dia(objt_dt_semana,_onumero_marcar)
		 if empty(objt_dt_semana)
		    return nil
		 endif 
		 
		 _nDataInicio = objt_dt_semana
		 
		 define dialog atendimento_dia title "" from 000,000 to 720,1020 Pixel brush obrushtelaatendimentoc STYLE WS_POPUP transparent
		 
				@ 004,001 say _mnomefuncionario font mtahomameiogrande of atendimento_dia size 508,15 color _clr_mes_anterior_posterior,corfdosay pixel center

				@ 340,006 BUTTON oatendimentobut_dia01 prompt "Voltar a agenda" size 095,15 font obotaof of atendimento_dia pixel action ( atendimento_dia:end() )

		 activate dialog atendimento_dia center
		 _nMesAmostra  = month(_nDataInicio)
		 _nAnoAmostra  = year(_nDataInicio)
		 gera_calendario(_nMesAmostra,_nAnoAmostra,_onumero_marcar)
		 
return nil

// Atendimento semanal
function atendimento_semana(objt_dt_semana,_onumero_marcar)
		 if empty(objt_dt_semana)
		    return nil
		 endif 
		 
		 _nDataInicio = objt_dt_semana
		 
		 _adatasemana02 = ""
		 _adatasemana03 = ""
		 _adatasemana04 = ""
		 _adatasemana05 = ""
		 _adatasemana06 = ""
		 _adatasemana07 = ""
		 
		 if     val(_onumero_marcar) >= 1  .and. val(_onumero_marcar) <= 7
		        _ndatasemana   = "mdiadasemana" + "02"
				_adatasemana02 = &_ndatasemana
		        _ndatasemana   = "mdiadasemana" + "03"
				_adatasemana03 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "04"
		        _adatasemana04 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "05"
				_adatasemana05 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "06"
		        _adatasemana06 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "07"
		        _adatasemana07 = &_ndatasemana
		 elseif val(_onumero_marcar) >= 8  .and. val(_onumero_marcar) <= 14
		        _ndatasemana   = "mdiadasemana" + "09"
				_adatasemana02 = &_ndatasemana
		        _ndatasemana   = "mdiadasemana" + "10"
				_adatasemana03 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "11"
		        _adatasemana04 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "12"
				_adatasemana05 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "13"
		        _adatasemana06 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "14"
		        _adatasemana07 = &_ndatasemana
		 elseif val(_onumero_marcar) >= 15 .and. val(_onumero_marcar) <= 21
		        _ndatasemana   = "mdiadasemana" + "16"
				_adatasemana02 = &_ndatasemana
		        _ndatasemana   = "mdiadasemana" + "17"
				_adatasemana03 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "18"
		        _adatasemana04 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "19"
				_adatasemana05 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "20"
		        _adatasemana06 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "21"
		        _adatasemana07 = &_ndatasemana
		 elseif val(_onumero_marcar) >= 22 .and. val(_onumero_marcar) <= 28
		        _ndatasemana   = "mdiadasemana" + "23"
				_adatasemana02 = &_ndatasemana
		        _ndatasemana   = "mdiadasemana" + "24"
				_adatasemana03 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "25"
		        _adatasemana04 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "26"
				_adatasemana05 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "27"
		        _adatasemana06 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "28"
		        _adatasemana07 = &_ndatasemana
		 elseif val(_onumero_marcar) >= 29 .and. val(_onumero_marcar) <= 35
		        _ndatasemana   = "mdiadasemana" + "30"
				_adatasemana02 = &_ndatasemana
		        _ndatasemana   = "mdiadasemana" + "31"
				_adatasemana03 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "32"
		        _adatasemana04 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "33"
				_adatasemana05 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "34"
		        _adatasemana06 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "35"
		        _adatasemana07 = &_ndatasemana
		 elseif val(_onumero_marcar) >= 36 .and. val(_onumero_marcar) <= 42
		        _ndatasemana   = "mdiadasemana" + "37"
				_adatasemana02 = &_ndatasemana
		        _ndatasemana   = "mdiadasemana" + "38"
				_adatasemana03 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "39"
		        _adatasemana04 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "40"
				_adatasemana05 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "41"
		        _adatasemana06 = &_ndatasemana
				_ndatasemana   = "mdiadasemana" + "42"
		        _adatasemana07 = &_ndatasemana
		 endif
		 if substr(_adatasemana02,1,1) = "."
		    _adatasemana02 = ""
		 else	
		    _adatasemana02 = ctod(strzero(val(_adatasemana02),2) + "/" + _mes + "/" + _ano)
		 endif
		 if substr(_adatasemana03,1,1) = "."
		    _adatasemana03 = ""
		 else
		    _adatasemana03 = ctod(strzero(val(_adatasemana03),2) + "/" + _mes + "/" + _ano)
		 endif
		 if substr(_adatasemana04,1,1) = "."
		    _adatasemana04 = ""
		 else
		    _adatasemana04 = ctod(strzero(val(_adatasemana04),2) + "/" + _mes + "/" + _ano)
	     endif
		 if substr(_adatasemana05,1,1) = "."
		    _adatasemana05 = ""
		 else
		    _adatasemana05 = ctod(strzero(val(_adatasemana05),2) + "/" + _mes + "/" + _ano)
         endif
		 if substr(_adatasemana06,1,1) = "."
		    _adatasemana06 = ""
	     else
		    _adatasemana06 = ctod(strzero(val(_adatasemana06),2) + "/" + _mes + "/" + _ano)
		 endif
		 if substr(_adatasemana07,1,1) = "."
		    _adatasemana07 = ""
		 else
		    _adatasemana07 = ctod(strzero(val(_adatasemana07),2) + "/" + _mes + "/" + _ano)
		 endif
		 define dialog atendimento_semana title "" from 000,000 to 720,1020 Pixel brush obrushtelaatendimentos STYLE WS_POPUP transparent
		 
				@ 004,001 say _mnomefuncionario font mtahomameiogrande of atendimento_semana size 508,15 color _clr_mes_anterior_posterior,corfdosay pixel center

		        mNadafaz = space(01)
		   		@ 000,000 get oNadafaz var mNadafaz font mtahomapequena size 01,01 of atendimento_semana color corfrtsayds,corfdogetnotafiscal pixel right no border
				
				// 1º coluna -> segunda- feira
				asamplzatendimento02  = {""}
                arecatendimento02     = {}
				@ 027,002 say _oadatasemana02 var _adatasemana02 font mtahomafacpeq size 071,08 of atendimento_semana color corfrtsay,corfdosay pixel center
				@ 027,073 BTNBMP _obotaolhosemana02 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento_semana pixel action( landa_dia_agenda(_adatasemana02,"02","I") )
				_obotaolhosemana02:SetColor( corfrtsay,_clr_fundo_letra )
				@ 036,002 listbox obrzatendimento02 fields asamplzatendimento02[obrzatendimento02:nat,1],asamplzatendimento02[obrzatendimento02:nat,2];
                          headers "Horas","Agenda" FIELDSIZES 055,060;
                          size 084,299;
                          pixel of atendimento_semana font mcourierxxx
                obrzatendimento02:nLineStyle := 3
                obrzatendimento02:lCellStyle = .f.
                obrzatendimento02:lAutoSkip  = .t.
                obrzatendimento02:SetArray(asamplzatendimento02)
                obrzatendimento02:bGoTop = { || obrzatendimento02:nat := 1 }
                obrzatendimento02:bGoBottom = { || obrzatendimento02:nat := Eval( obrzatendimento02:bLogicLen ) }
                obrzatendimento02:bSkip = { | nWant, nOld | nOld := obrzatendimento02:nat, obrzatendimento02:nat += nWant,;
                obrzatendimento02:nat := Max( 1, Min( obrzatendimento02:nat, Eval( obrzatendimento02:bLogicLen ) ) ),;
                obrzatendimento02:nat - nOld }
                obrzatendimento02:bLogicLen = { || Len( asamplzatendimento02 ) }
                obrzatendimento02:cAlias = "Array"
                obrzatendimento02:nColAct       := 1
                obrzatendimento02:lMChange      := .F.
                obrzatendimento02:SetFocus()
                obrzatendimento02:Refresh()
				
				// 2º coluna -> terça- feira
		        asamplzatendimento03  = {""}
                arecatendimento03     = {}
				@ 027,087 say _oadatasemana03 var _adatasemana03 font mtahomafacpeq size 071,08 of atendimento_semana color corfrtsay,corfdosay pixel center
				@ 027,158 BTNBMP _obotaolhosemana03 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento_semana pixel action( landa_dia_agenda(_adatasemana03,"03","I") )
				_obotaolhosemana03:SetColor( corfrtsay,_clr_fundo_letra )
				@ 036,087 listbox obrzatendimento03 fields asamplzatendimento03[obrzatendimento03:nat,1],asamplzatendimento03[obrzatendimento03:nat,2];
                          headers "Horas","Agenda" FIELDSIZES 055,060;
                          size 084,299;
                          pixel of atendimento_semana font mcourierxxx
                obrzatendimento03:nLineStyle := 3
                obrzatendimento03:lCellStyle = .f.
                obrzatendimento03:lAutoSkip  = .t.
                obrzatendimento03:SetArray(asamplzatendimento03)
                obrzatendimento03:bGoTop = { || obrzatendimento03:nat := 1 }
                obrzatendimento03:bGoBottom = { || obrzatendimento03:nat := Eval( obrzatendimento03:bLogicLen ) }
                obrzatendimento03:bSkip = { | nWant, nOld | nOld := obrzatendimento03:nat, obrzatendimento03:nat += nWant,;
                obrzatendimento03:nat := Max( 1, Min( obrzatendimento03:nat, Eval( obrzatendimento03:bLogicLen ) ) ),;
                obrzatendimento03:nat - nOld }
                obrzatendimento03:bLogicLen = { || Len( asamplzatendimento03 ) }
                obrzatendimento03:cAlias = "Array"
                obrzatendimento03:nColAct       := 1
                obrzatendimento03:lMChange      := .F.
                obrzatendimento03:SetFocus()
                obrzatendimento03:Refresh()
				
				// 3º coluna -> quarta- feira
		        asamplzatendimento04  = {""}
                arecatendimento04     = {}
				@ 027,172 say _oadatasemana04 var _adatasemana04 font mtahomafacpeq size 071,08 of atendimento_semana color corfrtsay,corfdosay pixel center
				@ 027,242 BTNBMP _obotaolhosemana04 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento_semana pixel action( landa_dia_agenda(_adatasemana04,"04","I") )
				_obotaolhosemana04:SetColor( corfrtsay,_clr_fundo_letra )
				@ 036,172 listbox obrzatendimento04 fields asamplzatendimento04[obrzatendimento04:nat,1],asamplzatendimento04[obrzatendimento04:nat,2];
                          headers "Horas","Agenda" FIELDSIZES 055,060;
                          size 084,299;
                          pixel of atendimento_semana font mcourierxxx
                obrzatendimento04:nLineStyle := 3
                obrzatendimento04:lCellStyle = .f.
                obrzatendimento04:lAutoSkip  = .t.
                obrzatendimento04:SetArray(asamplzatendimento04)
                obrzatendimento04:bGoTop = { || obrzatendimento04:nat := 1 }
                obrzatendimento04:bGoBottom = { || obrzatendimento04:nat := Eval( obrzatendimento04:bLogicLen ) }
                obrzatendimento04:bSkip = { | nWant, nOld | nOld := obrzatendimento04:nat, obrzatendimento04:nat += nWant,;
                obrzatendimento04:nat := Max( 1, Min( obrzatendimento04:nat, Eval( obrzatendimento04:bLogicLen ) ) ),;
                obrzatendimento04:nat - nOld }
                obrzatendimento04:bLogicLen = { || Len( asamplzatendimento04 ) }
                obrzatendimento04:cAlias = "Array"
                obrzatendimento04:nColAct       := 1
                obrzatendimento04:lMChange      := .F.
                obrzatendimento04:SetFocus()
                obrzatendimento04:Refresh()
				
				// 4º coluna -> quinta- feira
		        asamplzatendimento05  = {""}
                arecatendimento05     = {}
				@ 027,256 say _oadatasemana05 var _adatasemana05 font mtahomafacpeq size 071,08 of atendimento_semana color corfrtsay,corfdosay pixel center
				@ 027,327 BTNBMP _obotaolhosemana05 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento_semana pixel action( landa_dia_agenda(_adatasemana05,"05","I") )
				_obotaolhosemana05:SetColor( corfrtsay,_clr_fundo_letra )
				@ 036,256 listbox obrzatendimento05 fields asamplzatendimento05[obrzatendimento05:nat,1],asamplzatendimento05[obrzatendimento05:nat,2];
                          headers "Horas","Agenda" FIELDSIZES 055,060;
                          size 084,299;
                          pixel of atendimento_semana font mcourierxxx
                obrzatendimento05:nLineStyle := 3
                obrzatendimento05:lCellStyle = .f.
                obrzatendimento05:lAutoSkip  = .t.
                obrzatendimento05:SetArray(asamplzatendimento05)
                obrzatendimento05:bGoTop = { || obrzatendimento05:nat := 1 }
                obrzatendimento05:bGoBottom = { || obrzatendimento05:nat := Eval( obrzatendimento05:bLogicLen ) }
                obrzatendimento05:bSkip = { | nWant, nOld | nOld := obrzatendimento05:nat, obrzatendimento05:nat += nWant,;
                obrzatendimento05:nat := Max( 1, Min( obrzatendimento05:nat, Eval( obrzatendimento05:bLogicLen ) ) ),;
                obrzatendimento05:nat - nOld }
                obrzatendimento05:bLogicLen = { || Len( asamplzatendimento05 ) }
                obrzatendimento05:cAlias = "Array"
                obrzatendimento05:nColAct       := 1
                obrzatendimento05:lMChange      := .F.
                obrzatendimento05:SetFocus()
                obrzatendimento05:Refresh()
				
				// 5º coluna -> sexta- feira
		        asamplzatendimento06  = {""}
                arecatendimento06     = {}
				@ 027,341 say _oadatasemana06 var _adatasemana06 font mtahomafacpeq size 071,08 of atendimento_semana color corfrtsay,corfdosay pixel center
				@ 027,411 BTNBMP _obotaolhosemana06 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento_semana pixel action( landa_dia_agenda(_adatasemana06,"06","I") )
				_obotaolhosemana06:SetColor( corfrtsay,_clr_fundo_letra )
				@ 036,341 listbox obrzatendimento06 fields asamplzatendimento06[obrzatendimento06:nat,1],asamplzatendimento06[obrzatendimento06:nat,2];
                          headers "Horas","Agenda" FIELDSIZES 055,060;
                          size 084,299;
                          pixel of atendimento_semana font mcourierxxx
                obrzatendimento06:nLineStyle := 3
                obrzatendimento06:lCellStyle = .f.
                obrzatendimento06:lAutoSkip  = .t.
                obrzatendimento06:SetArray(asamplzatendimento06)
                obrzatendimento06:bGoTop = { || obrzatendimento06:nat := 1 }
                obrzatendimento06:bGoBottom = { || obrzatendimento06:nat := Eval( obrzatendimento06:bLogicLen ) }
                obrzatendimento06:bSkip = { | nWant, nOld | nOld := obrzatendimento06:nat, obrzatendimento06:nat += nWant,;
                obrzatendimento06:nat := Max( 1, Min( obrzatendimento06:nat, Eval( obrzatendimento06:bLogicLen ) ) ),;
                obrzatendimento06:nat - nOld }
                obrzatendimento06:bLogicLen = { || Len( asamplzatendimento06 ) }
                obrzatendimento06:cAlias = "Array"
                obrzatendimento06:nColAct       := 1
                obrzatendimento06:lMChange      := .F.
                obrzatendimento06:SetFocus()
                obrzatendimento06:Refresh()
				
				// 6º coluna -> sábado
		        asamplzatendimento07  = {""}
                arecatendimento07     = {}
				@ 027,425 say _oadatasemana07 var _adatasemana07 font mtahomafacpeq size 071,08 of atendimento_semana color corfrtsay,corfdosay pixel center
				@ 027,496 BTNBMP _obotaolhosemana07 left size 013,08 font obotaof noborder resource "olho_normal" of atendimento_semana pixel action( landa_dia_agenda(_adatasemana07,"07","I") )
				_obotaolhosemana07:SetColor( corfrtsay,_clr_fundo_letra )
				@ 036,425 listbox obrzatendimento07 fields asamplzatendimento07[obrzatendimento07:nat,1],asamplzatendimento07[obrzatendimento07:nat,2];
                          headers "Horas","Agenda" FIELDSIZES 055,060;
                          size 084,299;
                          pixel of atendimento_semana font mcourierxxx
                obrzatendimento07:nLineStyle := 3
                obrzatendimento07:lCellStyle = .f.
                obrzatendimento07:lAutoSkip  = .t.
                obrzatendimento07:SetArray(asamplzatendimento07)
                obrzatendimento07:bGoTop = { || obrzatendimento07:nat := 1 }
                obrzatendimento07:bGoBottom = { || obrzatendimento07:nat := Eval( obrzatendimento07:bLogicLen ) }
                obrzatendimento07:bSkip = { | nWant, nOld | nOld := obrzatendimento07:nat, obrzatendimento07:nat += nWant,;
                obrzatendimento07:nat := Max( 1, Min( obrzatendimento07:nat, Eval( obrzatendimento07:bLogicLen ) ) ),;
                obrzatendimento07:nat - nOld }
                obrzatendimento07:bLogicLen = { || Len( asamplzatendimento07 ) }
                obrzatendimento07:cAlias = "Array"
                obrzatendimento07:nColAct       := 1
                obrzatendimento07:lMChange      := .F.
                obrzatendimento07:SetFocus()
                obrzatendimento07:Refresh()
				
				@ 340,006 BUTTON oatendimentobut_semana01 prompt "Voltar a agenda" size 095,15 font obotaof of atendimento_semana pixel action ( atendimento_semana:end() )
				
		        if empty(_adatasemana02)
		           obrzatendimento02:disable()
		        else
		           if _adatasemana02 = ldate
		              _oadatasemana02:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
					  obrzatendimento02:nClrPane := _clr_vermelho_hoje
		           endif 
		           if _nDataInicio = _adatasemana02
                       oNadafaz:bgotfocus = { || obrzatendimento02:setfocus() }
				   endif
		        endif
		        if empty(_adatasemana03)
		           obrzatendimento03:disable()
		        else
		           if _adatasemana03 = ldate
		              _oadatasemana03:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
					  obrzatendimento03:nClrPane := _clr_vermelho_hoje
		           endif 
		           if _nDataInicio = _adatasemana03
                       oNadafaz:bgotfocus = { || obrzatendimento03:setfocus() }
		           endif 
		        endif
		        if empty(_adatasemana04)
		           obrzatendimento04:disable()
		        else
		           if _adatasemana04 = ldate
		              _oadatasemana04:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
					  obrzatendimento04:nClrPane := _clr_vermelho_hoje
		           endif 
		           if _nDataInicio = _adatasemana04
                       oNadafaz:bgotfocus = { || obrzatendimento04:setfocus() }
		           endif
		        endif
		        if empty(_adatasemana05)
		           obrzatendimento05:disable()
		        else
		           if _adatasemana05 = ldate
		              _oadatasemana05:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
					  obrzatendimento05:nClrPane := _clr_vermelho_hoje
		           endif 
		           if _nDataInicio = _adatasemana05
                       oNadafaz:bgotfocus = { || obrzatendimento05:setfocus() }
		           endif
		        endif
		        if empty(_adatasemana06)
		           obrzatendimento06:disable()
		        else
		           if _adatasemana06 = ldate
		              _oadatasemana06:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
					  obrzatendimento06:nClrPane := _clr_vermelho_hoje
		           endif 
		           if _nDataInicio = _adatasemana06
                       oNadafaz:bgotfocus = { || obrzatendimento06:setfocus() }
		           endif
		        endif
		        if empty(_adatasemana07)
		           obrzatendimento07:disable()
		        else
		           if _adatasemana07 = ldate
		              _oadatasemana07:SetColor( _clr_vermelho_escuro,_clr_fundo_letra )
					  obrzatendimento07:nClrPane := _clr_vermelho_hoje
		           endif 
		           if _nDataInicio = _adatasemana07
                       oNadafaz:bgotfocus = { || obrzatendimento07:setfocus() }
		           endif
		        endif
				
		 activate dialog atendimento_semana center
		 _nMesAmostra  = month(_nDataInicio)
		 _nAnoAmostra  = year(_nDataInicio)
		 gera_calendario(_nMesAmostra,_nAnoAmostra,_onumero_marcar)
		 
return nil

function landa_dia_agenda(_objet_adatasemana,_objetnumero,_objettipo)
		 if empty(_objet_adatasemana)
		    return nil
		 endif
		 if _objettipo = "I"
		    if _objet_adatasemana < ldate
		       //msginfo("Inclusão não permitida pois a data é anterior a data atual","Atenção")
		  	   return nil
		    endif
		 endif
		 if _objettipo = "I"
		    _titulo_agenda_dia = "Lança horário no dia " + dtoc(_objet_adatasemana) + iif(!empty(_mnomefuncionario)," | " + _mnomefuncionario,"")
	     elseif _objettipo = "A"
		    _titulo_agenda_dia = "Altera/Exclui no dia " + dtoc(_objet_adatasemana) + iif(!empty(_mnomefuncionario)," | " + _mnomefuncionario,"")
		 endif
		 define dialog lanca_dia_agenda title "" from 000,000 to 650,705 pixel brush obrushtelaatendimentod STYLE WS_POPUP transparent
                
				@ 004,001 say _otitulo_agenda_dia var _titulo_agenda_dia font mtahomameiogrande of lanca_dia_agenda size 351,15 color _clr_fundo_branco,corfdosay pixel center
		 
				@ 302,100 BTNBMP ocaibut1 left size 045,19 font obotaof noborder resource "geral_incluir" of lanca_dia_agenda pixel 
				@ 302,150 BTNBMP ocaibut2 left size 045,19 font obotaof noborder resource "geral_alterar" of lanca_dia_agenda pixel 
				@ 302,200 BTNBMP ocaibut3 left size 045,19 font obotaof noborder resource "geral_excluir" of lanca_dia_agenda pixel 
				@ 302,300 BTNBMP ocaibut4 left size 045,19 font obotaof noborder resource "geral_sair"    of lanca_dia_agenda pixel action ( lanca_dia_agenda:end() )
                ocaibut1:lTransparent = .t.
				ocaibut2:lTransparent = .t.
				ocaibut3:lTransparent = .t.
				ocaibut4:lTransparent = .t.
				
		 activate dialog lanca_dia_agenda center
return nil

function calcmes(x,y)
         * funcao que calcula o mes diminuindo ou aumentando com base em outro
         * x ‚ a data do mes base e y ‚ a quantidade de meses na frente ou para tr s
         * quando y ‚ negativo a data retorno com o dia 1§ e quando ‚ positiva
         *            retorno o ultimo dia daquele mes.
         * ex.: calcmes(08.08.02, -12) = 01.08.01 | calcmes(08.08.02, 12) = 31.08.03
         if y = 0
            return(x)
         endif
         vmdia = strzero(day(x), 2)
         if y > 0
            for z = 1 to y
               x = ctod("28" + right(dtoc(x), 6))
               x = x + 30
            next z
            vmmes = month(x)
            x = x + 28
            do while .t.
               if month(x) = vmmes
                  exit
               endif
               x = x - 1
            enddo
         else
            y = y * -1
            for z = y to 1 step -1
               x = ctod("03" + right(dtoc(x), 6))
               x = x - 30
            next z
            x = ctod("01" + right(dtoc(x), 6))
         endif
return(x)

function pega_ultimo_dia_numero(ndata)
         if empty(ndata)
            return("")
         endif
return(alltrim(str(LastDay( ndata ))))

function pega_ultimo_dia(mdtin)
         if empty(mdtin)
            return .t.
         endif
         //odtfi:ctext := ctod(alltrim(str(LastDay( mdtin ))) + "/" + alltrim(str(month(mdtin))) + "/" + alltrim(str(year(mdtin))))
return .t.

function pega_ultimo_diasint(mdtin)
         if empty(mdtin)
            return .t.
         endif
return(ctod(alltrim(str(LastDay( mdtin ))) + "/" + alltrim(str(month(mdtin))) + "/" + alltrim(str(year(mdtin)))))

FUNCTION LastDay( _DateVal )

         LOCAL _LastDay, _MonthNum, _NumDays

         IF _DateVal = NIL
             _DateVal := ldate
         ELSEIF VALTYPE( _DateVal ) != 'D'
             RETURN 0
         ENDIF

         _MonthNum := MONTH( _DateVal )
         _NumDays  := 31

         DO CASE
             CASE _MonthNum = 4 .OR. _MonthNum = 6 .OR. _MonthNum = 9 .OR. ;
                                                        _MonthNum = 11
                 _NumDays := 30
             CASE _MonthNum = 2
                  IF YEAR( _DateVal ) % 4 = 0 .AND. YEAR( _DateVal ) % 100 != 0
                      _NumDays := 29
                  ELSEIF YEAR( _DateVal ) % 100 = 0 .AND. YEAR( _DateVal ) % 400 = 0
                      _NumDays := 29
                  ELSE
                      _NumDays := 28
                  ENDIF
         ENDCASE

RETURN( _NumDays )

function IsAppThemed()
return ztiporetornoAppThemed
