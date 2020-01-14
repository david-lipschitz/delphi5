object frmVBRefabric: TfrmVBRefabric
  Left = 229
  Top = 102
  Width = 780
  Height = 544
  Caption = 'Refabric: Reroll Full Width Pieces'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 33
    Align = alTop
    TabOrder = 0
    object PrintSpdBtn: TSpeedButton
      Left = 472
      Top = 5
      Width = 25
      Height = 25
      Hint = 'Print this form'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = PrintSpdBtnClick
    end
    object Label19: TLabel
      Left = 536
      Top = 7
      Width = 58
      Height = 13
      Caption = 'Strips in Box'
    end
    object FindFastNextIncompleteSpnBtn: TSpeedButton
      Left = 504
      Top = 5
      Width = 25
      Height = 25
      Hint = 'Find Next Incomplete Order'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FF3333333333333447333333333333377FFF33333333333744473333333
        333337773FF3333333333444447333333333373F773FF3333333334444447333
        33333373F3773FF3333333744444447333333337F333773FF333333444444444
        733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
        999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
        33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
        333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
        33333777333333333333CC333333333333337733333333333333}
      NumGlyphs = 2
      Visible = False
    end
    object btnClose: TBitBtn
      Left = 680
      Top = 5
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnCloseClick
      Kind = bkClose
    end
    object btnBoxSearch: TBitBtn
      Left = 8
      Top = 4
      Width = 105
      Height = 25
      Caption = 'Box Search'
      TabOrder = 1
      OnClick = btnBoxSearchClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FBFFF
        FFFFF000000033333333FBBFFFFBF00000003333333FBFFFFBFFFE0000003333
        333FBFFFFBFBF600000033333333FBBFFFFFF70000003333333444FBFFFBF600
        000033333344834FBFFFF1000000333334847F84BFFFF6000000333334484F84
        FBBFB00000003333348F74483FF3F6000000333344FFF7433333300000003344
        8F8444333333300000003448F7433333333330000000348F7733333333333000
        000034F77433333333333F000000344443333333333330000000333333333333
        333337000000}
    end
    object edtStripsInBox: TDBEdit
      Left = 600
      Top = 5
      Width = 50
      Height = 21
      Color = clBtnFace
      DataField = 'STRIPSINBOX'
      DataSource = datBoxStripCount
      ReadOnly = True
      TabOrder = 2
    end
    object btnRefabricBoxSearch: TBitBtn
      Left = 248
      Top = 4
      Width = 153
      Height = 25
      Caption = 'Refabricked Box Search'
      TabOrder = 3
      OnClick = btnRefabricBoxSearchClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FBFFF
        FFFFF000000033333333FBBFFFFBF00000003333333FBFFFFBFFFE0000003333
        333FBFFFFBFBF600000033333333FBBFFFFFF70000003333333444FBFFFBF600
        000033333344834FBFFFF1000000333334847F84BFFFF6000000333334484F84
        FBBFB00000003333348F74483FF3F6000000333344FFF7433333300000003344
        8F8444333333300000003448F7433333333330000000348F7733333333333000
        000034F77433333333333F000000344443333333333330000000333333333333
        333337000000}
    end
    object btnRefabricWIP: TBitBtn
      Left = 120
      Top = 4
      Width = 121
      Height = 25
      Caption = 'Refabric WIP'
      TabOrder = 4
      OnClick = btnRefabricWIPClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FBFFF
        FFFFF000000033333333FBBFFFFBF00000003333333FBFFFFBFFFE0000003333
        333FBFFFFBFBF600000033333333FBBFFFFFF70000003333333444FBFFFBF600
        000033333344834FBFFFF1000000333334847F84BFFFF6000000333334484F84
        FBBFB00000003333348F74483FF3F6000000333344FFF7433333300000003344
        8F8444333333300000003448F7433333333330000000348F7733333333333000
        000034F77433333333333F000000344443333333333330000000333333333333
        333337000000}
    end
  end
  object gbxOrigPiece: TGroupBox
    Left = 0
    Top = 33
    Width = 772
    Height = 216
    Align = alTop
    Caption = ' Piece '
    TabOrder = 1
    object Label33: TLabel
      Left = 12
      Top = 31
      Width = 24
      Height = 13
      Caption = 'Type'
    end
    object Label11: TLabel
      Left = 42
      Top = 15
      Width = 43
      Height = 13
      Caption = 'Structure'
    end
    object Label12: TLabel
      Left = 98
      Top = 15
      Width = 30
      Height = 13
      Caption = 'Colour'
    end
    object Label18: TLabel
      Left = 154
      Top = 15
      Width = 27
      Height = 13
      Caption = 'Finish'
      FocusControl = EditVBFin
    end
    object Label9: TLabel
      Left = 210
      Top = 15
      Width = 28
      Height = 13
      Caption = 'Width'
    end
    object Label5: TLabel
      Left = 268
      Top = 15
      Width = 51
      Height = 13
      Caption = 'Carton No.'
      FocusControl = EditBOXNO
    end
    object Label26: TLabel
      Left = 402
      Top = 15
      Width = 48
      Height = 13
      Caption = 'Label Stru'
    end
    object Label41: TLabel
      Left = 460
      Top = 15
      Width = 38
      Height = 13
      Caption = 'CustRef'
      FocusControl = EditCustRef
    end
    object Label39: TLabel
      Left = 525
      Top = 53
      Width = 39
      Height = 13
      Caption = 'Seq No.'
      FocusControl = EditSEQNO
    end
    object Label25: TLabel
      Left = 460
      Top = 53
      Width = 58
      Height = 13
      Caption = 'Unique Strip'
    end
    object Label4: TLabel
      Left = 402
      Top = 53
      Width = 32
      Height = 13
      Caption = 'Lot No'
    end
    object Label6: TLabel
      Left = 328
      Top = 53
      Width = 53
      Height = 13
      Caption = 'Date Manu'
      FocusControl = EditDATEMANU
    end
    object Label8: TLabel
      Left = 268
      Top = 53
      Width = 41
      Height = 13
      Caption = 'Strip No.'
      FocusControl = EditStripNo
    end
    object Label16: TLabel
      Left = 210
      Top = 53
      Width = 27
      Height = 13
      Caption = 'Piece'
    end
    object Label1: TLabel
      Left = 156
      Top = 53
      Width = 27
      Height = 13
      Caption = 'Finish'
      FocusControl = EditFinNo
    end
    object Label27: TLabel
      Left = 98
      Top = 53
      Width = 31
      Height = 13
      Caption = 'Greige'
    end
    object Label15: TLabel
      Left = 42
      Top = 53
      Width = 26
      Height = 13
      Caption = 'Warp'
    end
    object Label7: TLabel
      Left = 266
      Top = 93
      Width = 28
      Height = 13
      Caption = 'Faults'
      FocusControl = EditFAULTS
    end
    object Label21: TLabel
      Left = 322
      Top = 93
      Width = 103
      Height = 13
      Caption = 'Long Fault Length (m)'
    end
    object Label20: TLabel
      Left = 42
      Top = 93
      Width = 32
      Height = 13
      Caption = 'Quality'
    end
    object Label40: TLabel
      Left = 100
      Top = 93
      Width = 37
      Height = 13
      Caption = 'Reason'
    end
    object Label10: TLabel
      Left = 208
      Top = 93
      Width = 44
      Height = 13
      Caption = 'Gross (m)'
      FocusControl = EditGROSSLENGTH
    end
    object Label3: TLabel
      Left = 442
      Top = 93
      Width = 49
      Height = 13
      Caption = 'Allowance'
    end
    object Label13: TLabel
      Left = 500
      Top = 93
      Width = 17
      Height = 13
      Caption = 'Net'
    end
    object Label30: TLabel
      Left = 328
      Top = 15
      Width = 39
      Height = 13
      Caption = 'Row No'
    end
    object Label28: TLabel
      Left = 580
      Top = 53
      Width = 23
      Height = 13
      Caption = 'Rtnd'
    end
    object Label35: TLabel
      Left = 328
      Top = 131
      Width = 23
      Height = 13
      Caption = 'Date'
      FocusControl = EditDespDate
    end
    object Label17: TLabel
      Left = 268
      Top = 131
      Width = 46
      Height = 13
      Caption = 'Despatch'
    end
    object Label23: TLabel
      Left = 210
      Top = 131
      Width = 26
      Height = 13
      Caption = 'Pallet'
    end
    object Label34: TLabel
      Left = 169
      Top = 149
      Width = 28
      Height = 13
      Caption = 'Desp:'
    end
    object Label37: TLabel
      Left = 98
      Top = 131
      Width = 46
      Height = 13
      Caption = 'Date Rqd'
    end
    object Label36: TLabel
      Left = 42
      Top = 131
      Width = 51
      Height = 13
      Caption = 'VT Ord No'
    end
    object Label31: TLabel
      Left = 12
      Top = 179
      Width = 19
      Height = 13
      Caption = 'Ent:'
    end
    object Label32: TLabel
      Left = 210
      Top = 181
      Width = 40
      Height = 13
      Caption = 'Modified'
    end
    object Label2: TLabel
      Left = 10
      Top = 71
      Width = 27
      Height = 13
      Caption = 'Piece'
    end
    object Label14: TLabel
      Left = 5
      Top = 149
      Width = 33
      Height = 13
      Caption = 'Picked'
    end
    object Label22: TLabel
      Left = 16
      Top = 200
      Width = 188
      Height = 13
      Caption = 'Can'#39't change if on pallet or on despatch'
    end
    object EditVBSTRU: TDBEdit
      Left = 42
      Top = 29
      Width = 50
      Height = 21
      TabStop = False
      Color = clLime
      DataField = 'VBSTRU'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 0
    end
    object EditVBCOL: TDBEdit
      Left = 98
      Top = 29
      Width = 50
      Height = 21
      TabStop = False
      Color = clLime
      DataField = 'VBCOL'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 1
    end
    object EditVBFin: TDBEdit
      Left = 154
      Top = 29
      Width = 50
      Height = 21
      TabStop = False
      Color = clLime
      DataField = 'VBFIN'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 2
    end
    object edtMetricWidth: TDBEdit
      Left = 210
      Top = 29
      Width = 50
      Height = 21
      TabStop = False
      Color = clLime
      DataField = 'METRICWIDTH'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 3
    end
    object EditBOXNO: TDBEdit
      Left = 268
      Top = 29
      Width = 50
      Height = 21
      Color = clLime
      DataField = 'BOXNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 402
      Top = 29
      Width = 50
      Height = 21
      Color = clBtnFace
      DataField = 'LABELSTRU'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 5
    end
    object EditCustRef: TDBEdit
      Left = 460
      Top = 29
      Width = 57
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'LABELSTRUCUSTREF'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 6
    end
    object EditSEQNO: TDBEdit
      Left = 525
      Top = 69
      Width = 50
      Height = 21
      Color = clBtnFace
      DataField = 'SEQNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 7
    end
    object EditRollNo: TDBEdit
      Left = 460
      Top = 69
      Width = 57
      Height = 21
      TabStop = False
      Color = clLime
      DataField = 'ROLLNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 8
    end
    object EditLotNo: TDBEdit
      Left = 402
      Top = 69
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'LOTNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 9
    end
    object EditDATEMANU: TDBEdit
      Left = 328
      Top = 69
      Width = 68
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DATEMANU'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 10
    end
    object EditStripNo: TDBEdit
      Left = 268
      Top = 69
      Width = 50
      Height = 21
      Color = clBtnFace
      DataField = 'STRIPNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 11
    end
    object EditPieceNo: TDBEdit
      Left = 210
      Top = 69
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PIECENO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 12
    end
    object EditFinNo: TDBEdit
      Left = 156
      Top = 69
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'FINNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 13
    end
    object EditGreigeNo: TDBEdit
      Left = 98
      Top = 69
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'GREIGENO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 14
    end
    object EditWarpNo: TDBEdit
      Left = 42
      Top = 69
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'WARPNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 15
    end
    object EditFAULTS: TDBEdit
      Left = 266
      Top = 107
      Width = 50
      Height = 21
      Color = clYellow
      DataField = 'FAULTS'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 16
    end
    object EditLongLength: TDBEdit
      Left = 322
      Top = 107
      Width = 50
      Height = 21
      Color = clBtnFace
      DataField = 'LONGLENGTH'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 17
    end
    object DBEdit3: TDBEdit
      Left = 42
      Top = 107
      Width = 50
      Height = 21
      Color = clBtnFace
      DataField = 'QLTY'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 18
    end
    object DBEdit4: TDBEdit
      Left = 100
      Top = 107
      Width = 50
      Height = 21
      Color = clBtnFace
      DataField = 'QLTYREASON'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 19
    end
    object EditGROSSLENGTH: TDBEdit
      Left = 208
      Top = 107
      Width = 50
      Height = 21
      Color = clYellow
      DataField = 'GROSSLENGTH'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 20
    end
    object EditAllowance: TDBEdit
      Left = 442
      Top = 107
      Width = 50
      Height = 21
      TabStop = False
      Color = clYellow
      DataField = 'ALLOWANCE'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 21
    end
    object EditNetLength: TDBEdit
      Left = 500
      Top = 107
      Width = 50
      Height = 21
      TabStop = False
      Color = clYellow
      DataField = 'NETLENGTH'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 22
    end
    object EditRowNo: TDBEdit
      Left = 328
      Top = 29
      Width = 40
      Height = 21
      Hint = 'Row No from last stock take (if not picked)'
      TabStop = False
      Color = clLime
      DataField = 'ROWNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 23
    end
    object EditReturned: TDBEdit
      Left = 580
      Top = 69
      Width = 30
      Height = 21
      Color = clSilver
      DataField = 'RETURNED'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 24
    end
    object EditDespDate: TDBEdit
      Left = 328
      Top = 147
      Width = 64
      Height = 21
      Hint = 'Filled in after despatch sent'
      TabStop = False
      Color = clSilver
      DataField = 'DESPDATE'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 25
    end
    object EditDespNo: TDBEdit
      Left = 268
      Top = 147
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'DESPNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 26
    end
    object EditPalletNo: TDBEdit
      Left = 210
      Top = 147
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PALLETNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 27
    end
    object ShowDatePicked: TDBEdit
      Left = 98
      Top = 147
      Width = 65
      Height = 21
      Color = clSilver
      DataField = 'DATERQD'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 28
    end
    object EditVTOrdNo: TDBEdit
      Left = 42
      Top = 147
      Width = 50
      Height = 21
      Hint = '=Order No'
      TabStop = False
      Color = clSilver
      DataField = 'VTORDNO'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 29
    end
    object EditDateRcvd: TDBEdit
      Left = 42
      Top = 177
      Width = 100
      Height = 21
      Color = clSilver
      DataField = 'DATERCVD'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 30
    end
    object EditInitials: TDBEdit
      Left = 146
      Top = 177
      Width = 40
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'INITIALS'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 31
    end
    object ShowDateMod: TDBEdit
      Left = 268
      Top = 177
      Width = 100
      Height = 21
      Color = clSilver
      DataField = 'DATEMOD'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 32
    end
    object ShowUserMod: TDBEdit
      Left = 372
      Top = 177
      Width = 40
      Height = 21
      Color = clSilver
      DataField = 'USERMOD'
      DataSource = datOrigPiece
      ReadOnly = True
      TabOrder = 33
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 249
    Width = 772
    Height = 40
    Align = alTop
    TabOrder = 2
    object Label24: TLabel
      Left = 481
      Top = 2
      Width = 57
      Height = 13
      Caption = 'Label Count'
    end
    object edtLabelCount: TEdit
      Left = 481
      Top = 16
      Width = 45
      Height = 21
      TabOrder = 0
      Text = '2'
    end
    object LabelCountBtn: TSpinButton
      Left = 541
      Top = 13
      Width = 20
      Height = 24
      DownGlyph.Data = {
        BA000000424DBA00000000000000420000002800000009000000060000000100
        1000030000007800000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03DE03DE03DE03DE03DE03DE03DE03D0700E03DE03DE03D
        E03D0000E03DE03DE03DE03D8002E03DE03DE03D000000000000E03DE03DE03D
        0600E03DE03D00000000000000000000E03DE03D0400E03D0000000000000000
        000000000000E03D1001E03DE03DE03DE03DE03DE03DE03DE03DE03D8002}
      FocusControl = edtLabelCount
      TabOrder = 1
      UpGlyph.Data = {
        BA000000424DBA00000000000000420000002800000009000000060000000100
        1000030000007800000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03DE03DE03DE03DE03DE03DE03DE03D0300E03D00000000
        00000000000000000000E03D5A02E03DE03D00000000000000000000E03DE03D
        6900E03DE03DE03D000000000000E03DE03DE03D7C02E03DE03DE03DE03D0000
        E03DE03DE03DE03D0600E03DE03DE03DE03DE03DE03DE03DE03DE03DB681}
      OnDownClick = LabelCountBtnDownClick
      OnUpClick = LabelCountBtnUpClick
    end
    object btnSave: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Save'
      Default = True
      Enabled = False
      TabOrder = 2
      OnClick = btnSaveClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'C&ancel'
      Enabled = False
      TabOrder = 3
      OnClick = btnCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnPost: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Post'
      Enabled = False
      TabOrder = 4
      OnClick = btnPostClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object btnClear: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Clear'
      Enabled = False
      TabOrder = 5
      OnClick = btnClearClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnStrips: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Strips'
      Enabled = False
      TabOrder = 6
      OnClick = btnStripsClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pgeNewPieces: TPageControl
    Left = 0
    Top = 289
    Width = 772
    Height = 228
    ActivePage = tshNewPieces
    Align = alClient
    TabOrder = 3
    object tshNewPieces: TTabSheet
      Caption = 'New Pieces'
      object dbgNewPieces: TDBGrid
        Left = 0
        Top = 0
        Width = 764
        Height = 153
        Align = alClient
        DataSource = datNewPieces
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'ROLLNO'
            ReadOnly = False
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'LINENO'
            ReadOnly = False
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'BOXNO'
            ReadOnly = False
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'GROSSLENGTH'
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'FAULTS'
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'ALLOWANCE'
            Title.Caption = 'Allow'
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'NETLENGTH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFABRICDATE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'METRICWIDTH'
            Title.Caption = 'Width'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QLTY'
            Title.Caption = 'Qlty'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QLTYREASON'
            Title.Caption = 'QR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LABELSTRU'
            Title.Caption = 'LS'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LABELSTRUCUSTREF'
            Title.Caption = 'LSCustRef'
            Visible = True
          end>
      end
      object StatusBar: TStatusBar
        Left = 0
        Top = 181
        Width = 764
        Height = 19
        Panels = <>
        SimplePanel = True
        SimpleText = 'Ready'
      end
      object Panel3: TPanel
        Left = 0
        Top = 153
        Width = 764
        Height = 28
        Align = alBottom
        TabOrder = 2
        object Label29: TLabel
          Left = 176
          Top = 5
          Width = 29
          Height = 13
          Caption = 'Totals'
        end
        object Label38: TLabel
          Left = 472
          Top = 8
          Width = 50
          Height = 13
          Caption = 'FW Gross:'
        end
        object edtNewGrossLength: TDBEdit
          Left = 208
          Top = 3
          Width = 63
          Height = 21
          Color = clBtnFace
          DataField = 'GROSSLENGTH'
          DataSource = datGetTotals
          TabOrder = 0
        end
        object edtNewFaults: TDBEdit
          Left = 272
          Top = 3
          Width = 63
          Height = 21
          Color = clBtnFace
          DataField = 'FAULTS'
          DataSource = datGetTotals
          TabOrder = 1
        end
        object edtNewAllowance: TDBEdit
          Left = 337
          Top = 3
          Width = 63
          Height = 21
          Color = clBtnFace
          DataField = 'ALLOWANCE'
          DataSource = datGetTotals
          TabOrder = 2
        end
        object edtNewNet: TDBEdit
          Left = 402
          Top = 3
          Width = 63
          Height = 21
          Color = clBtnFace
          DataField = 'NETLENGTH'
          DataSource = datGetTotals
          TabOrder = 3
        end
        object edtRecalcGross: TDBEdit
          Left = 536
          Top = 3
          Width = 63
          Height = 21
          Color = clBtnFace
          DataField = 'RECALCGROSSMETRES'
          DataSource = datGetTotals
          TabOrder = 4
        end
        object dbnNewPieces: TDBNavigator
          Left = 8
          Top = 4
          Width = 155
          Height = 20
          DataSource = datNewPieces
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
          TabOrder = 5
        end
      end
    end
    object tshHistory: TTabSheet
      Caption = 'Piece History'
      ImageIndex = 1
      object dbgPieceHistory: TDBGrid
        Left = 0
        Top = 0
        Width = 764
        Height = 200
        Align = alClient
        Color = clBtnFace
        DataSource = datPieceHistory
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgPieceHistoryDrawColumnCell
        OnDblClick = dbgPieceHistoryDblClick
      end
    end
  end
  object datOrigPiece: TDataSource
    DataSet = qryOrigPiece
    Left = 632
    Top = 42
  end
  object qryOrigPiece: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select *'
      'from vbrcpt'
      'where boxno=:boxno')
    Left = 600
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'boxno'
        ParamType = ptUnknown
        Value = '171695'
      end>
    object qryOrigPieceVBSTRU: TStringField
      FieldName = 'VBSTRU'
      Origin = 'VBSTOCK.VBRCPT.VBSTRU'
      FixedChar = True
      Size = 3
    end
    object qryOrigPieceVBCOL: TStringField
      FieldName = 'VBCOL'
      Origin = 'VBSTOCK.VBRCPT.VBCOL'
      FixedChar = True
      Size = 3
    end
    object qryOrigPieceLOTNO: TIntegerField
      FieldName = 'LOTNO'
      Origin = 'VBSTOCK.VBRCPT.LOTNO'
    end
    object qryOrigPieceBOXNO: TIntegerField
      FieldName = 'BOXNO'
      Origin = 'VBSTOCK.VBRCPT.BOXNO'
    end
    object qryOrigPieceDATEMANU: TDateTimeField
      FieldName = 'DATEMANU'
      Origin = 'VBSTOCK.VBRCPT.DATEMANU'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOrigPieceFAULTS: TSmallintField
      FieldName = 'FAULTS'
      Origin = 'VBSTOCK.VBRCPT.FAULTS'
    end
    object qryOrigPieceMETRICWIDTH: TSmallintField
      FieldName = 'METRICWIDTH'
      Origin = 'VBSTOCK.VBRCPT.METRICWIDTH'
    end
    object qryOrigPieceGROSSLENGTH: TFloatField
      FieldName = 'GROSSLENGTH'
      Origin = 'VBSTOCK.VBRCPT.GROSSLENGTH'
    end
    object qryOrigPieceWARPNO: TIntegerField
      FieldName = 'WARPNO'
      Origin = 'VBSTOCK.VBRCPT.WARPNO'
    end
    object qryOrigPiecePIECENO: TSmallintField
      FieldName = 'PIECENO'
      Origin = 'VBSTOCK.VBRCPT.PIECENO'
    end
    object qryOrigPieceSTRIPNO: TSmallintField
      FieldName = 'STRIPNO'
      Origin = 'VBSTOCK.VBRCPT.STRIPNO'
    end
    object qryOrigPieceINITIALS: TStringField
      FieldName = 'INITIALS'
      Origin = 'VBSTOCK.VBRCPT.INITIALS'
      FixedChar = True
      Size = 4
    end
    object qryOrigPieceDESPNO: TIntegerField
      FieldName = 'DESPNO'
      Origin = 'VBSTOCK.VBRCPT.DESPNO'
    end
    object qryOrigPieceDATERCVD: TDateTimeField
      FieldName = 'DATERCVD'
      Origin = 'VBSTOCK.VBRCPT.DATERCVD'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object qryOrigPieceQLTY: TStringField
      FieldName = 'QLTY'
      Origin = 'VBSTOCK.VBRCPT.QLTY'
      FixedChar = True
      Size = 1
    end
    object qryOrigPieceROLLNO: TIntegerField
      FieldName = 'ROLLNO'
      Origin = 'VBSTOCK.VBRCPT.ROLLNO'
    end
    object qryOrigPieceLONGLENGTH: TFloatField
      FieldName = 'LONGLENGTH'
      Origin = 'VBSTOCK.VBRCPT.LONGLENGTH'
    end
    object qryOrigPiecePALLETNO: TIntegerField
      FieldName = 'PALLETNO'
      Origin = 'VBSTOCK.VBRCPT.PALLETNO'
    end
    object qryOrigPieceNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
      Origin = 'VBSTOCK.VBRCPT.NETLENGTH'
    end
    object qryOrigPieceALLOWANCE: TFloatField
      FieldName = 'ALLOWANCE'
      Origin = 'VBSTOCK.VBRCPT.ALLOWANCE'
    end
    object qryOrigPieceGREIGENO: TSmallintField
      FieldName = 'GREIGENO'
      Origin = 'VBSTOCK.VBRCPT.GREIGENO'
    end
    object qryOrigPieceRETURNED: TStringField
      FieldName = 'RETURNED'
      Origin = 'VBSTOCK.VBRCPT.RETURNED'
      FixedChar = True
      Size = 1
    end
    object qryOrigPieceVTORDNO: TIntegerField
      FieldName = 'VTORDNO'
      Origin = 'VBSTOCK.VBRCPT.VTORDNO'
    end
    object qryOrigPieceDATERQD: TDateTimeField
      FieldName = 'DATERQD'
      Origin = 'VBSTOCK.VBRCPT.DATERQD'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOrigPieceROWNO: TIntegerField
      FieldName = 'ROWNO'
      Origin = 'VBSTOCK.VBRCPT.ROWNO'
    end
    object qryOrigPieceDATEMOD: TDateTimeField
      FieldName = 'DATEMOD'
      Origin = 'VBSTOCK.VBRCPT.DATEMOD'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object qryOrigPieceUSERMOD: TStringField
      FieldName = 'USERMOD'
      Origin = 'VBSTOCK.VBRCPT.USERMOD'
      FixedChar = True
      Size = 4
    end
    object qryOrigPieceDESPDATE: TDateTimeField
      FieldName = 'DESPDATE'
      Origin = 'VBSTOCK.VBRCPT.DESPDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryOrigPieceFINNO: TIntegerField
      FieldName = 'FINNO'
      Origin = 'VBSTOCK.VBRCPT.FINNO'
    end
    object qryOrigPieceVBFIN: TStringField
      FieldName = 'VBFIN'
      Origin = 'VBSTOCK.VBRCPT.VBFIN'
      FixedChar = True
      Size = 2
    end
    object qryOrigPieceSEQNO: TIntegerField
      FieldName = 'SEQNO'
      Origin = 'VBSTOCK.VBRCPT.SEQNO'
    end
    object qryOrigPieceQLTYREASON: TStringField
      FieldName = 'QLTYREASON'
      Origin = 'VBSTOCK.VBRCPT.QLTYREASON'
      FixedChar = True
      Size = 2
    end
    object qryOrigPieceLABELSTRU: TStringField
      FieldName = 'LABELSTRU'
      Origin = 'VBSTOCK.VBRCPT.LABELSTRU'
      FixedChar = True
      Size = 2
    end
    object qryOrigPieceLABELSTRUCUSTREF: TStringField
      FieldName = 'LABELSTRUCUSTREF'
      Origin = 'VBSTOCK.VBRCPT.LABELSTRUCUSTREF'
      FixedChar = True
      Size = 6
    end
    object qryOrigPieceVTORDDETITEMNO: TIntegerField
      FieldName = 'VTORDDETITEMNO'
      Origin = 'VBSTOCK.VBRCPT.VTORDDETITEMNO'
    end
    object qryOrigPieceVALUERATING: TIntegerField
      FieldName = 'VALUERATING'
      Origin = 'VBSTOCK.VBRCPT.VALUERATING'
    end
  end
  object tabNewPieces: TTable
    BeforeInsert = tabNewPiecesBeforeInsert
    BeforeEdit = tabNewPiecesBeforeEdit
    BeforePost = tabNewPiecesBeforePost
    AfterPost = tabNewPiecesAfterPost
    BeforeCancel = tabNewPiecesBeforeCancel
    AfterCancel = tabNewPiecesAfterCancel
    BeforeDelete = tabNewPiecesBeforeDelete
    AfterDelete = tabNewPiecesAfterDelete
    OnNewRecord = tabNewPiecesNewRecord
    OnPostError = tabNewPiecesPostError
    DatabaseName = 'VBStock'
    IndexName = 'RDB$PRIMARY123'
    TableName = 'VBREFABRICCHANGES'
    Left = 408
    Top = 362
    object tabNewPiecesROLLNO: TIntegerField
      DisplayLabel = 'Roll No'
      FieldName = 'ROLLNO'
      ReadOnly = True
      Required = True
    end
    object tabNewPiecesLINENO: TIntegerField
      DisplayLabel = 'Line No'
      FieldName = 'LINENO'
      ReadOnly = True
      Required = True
    end
    object tabNewPiecesBOXNO: TIntegerField
      DisplayLabel = 'Box No'
      FieldName = 'BOXNO'
      ReadOnly = True
    end
    object tabNewPiecesGROSSLENGTH: TFloatField
      DisplayLabel = 'Gross m'
      FieldName = 'GROSSLENGTH'
    end
    object tabNewPiecesFAULTS: TIntegerField
      DisplayLabel = 'Faults'
      FieldName = 'FAULTS'
    end
    object tabNewPiecesALLOWANCE: TFloatField
      FieldName = 'ALLOWANCE'
      ReadOnly = True
    end
    object tabNewPiecesNETLENGTH: TFloatField
      DisplayLabel = 'Net m'
      FieldName = 'NETLENGTH'
      ReadOnly = True
    end
    object tabNewPiecesREFABRICDATE: TDateTimeField
      DisplayLabel = 'Refabric Date'
      DisplayWidth = 10
      FieldName = 'REFABRICDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tabNewPiecesMETRICWIDTH: TIntegerField
      FieldName = 'METRICWIDTH'
      ReadOnly = True
    end
    object tabNewPiecesQLTY: TStringField
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object tabNewPiecesQLTYREASON: TStringField
      FieldName = 'QLTYREASON'
      FixedChar = True
      Size = 2
    end
    object tabNewPiecesLABELSTRU: TStringField
      FieldName = 'LABELSTRU'
      FixedChar = True
      Size = 2
    end
    object tabNewPiecesLABELSTRUCUSTREF: TStringField
      FieldName = 'LABELSTRUCUSTREF'
      FixedChar = True
      Size = 6
    end
  end
  object datNewPieces: TDataSource
    DataSet = tabNewPieces
    OnStateChange = datNewPiecesStateChange
    Left = 440
    Top = 362
  end
  object qryPieceHistory: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select vr.*,vb.despdate'
      'from vbrefabric vr, vbrcpt vb'
      'where vr.newboxno=vb.boxno'
      'and vr.startrollno'
      'in'
      '('
      'select vr1.startrollno'
      'from vbrefabric vr1'
      
        'where ((vr1.origrollno=:origrollno) or (vr1.newrollno=:origrolln' +
        'o))'
      ')'
      'order by vr.origboxno,vr.ref')
    Left = 409
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'origrollno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'origrollno'
        ParamType = ptUnknown
      end>
    object qryPieceHistoryREF: TIntegerField
      DisplayLabel = 'Ref'
      DisplayWidth = 5
      FieldName = 'REF'
      Origin = 'VBSTOCK.VBREFABRIC.REF'
    end
    object qryPieceHistorySTARTROLLNO: TIntegerField
      DisplayLabel = 'Start Roll'
      DisplayWidth = 8
      FieldName = 'STARTROLLNO'
      Origin = 'VBSTOCK.VBREFABRIC.STARTROLLNO'
    end
    object qryPieceHistoryORIGROLLNO: TIntegerField
      DisplayLabel = 'Orig Roll'
      DisplayWidth = 8
      FieldName = 'ORIGROLLNO'
      Origin = 'VBSTOCK.VBREFABRIC.ORIGROLLNO'
    end
    object qryPieceHistoryNEWROLLNO: TIntegerField
      DisplayLabel = 'New Roll'
      DisplayWidth = 8
      FieldName = 'NEWROLLNO'
      Origin = 'VBSTOCK.VBREFABRIC.NEWROLLNO'
    end
    object qryPieceHistoryORIGBOXNO: TIntegerField
      DisplayLabel = 'Orig Box'
      DisplayWidth = 8
      FieldName = 'ORIGBOXNO'
      Origin = 'VBSTOCK.VBREFABRIC.ORIGBOXNO'
    end
    object qryPieceHistoryNEWBOXNO: TIntegerField
      DisplayLabel = 'New Box'
      DisplayWidth = 8
      FieldName = 'NEWBOXNO'
      Origin = 'VBSTOCK.VBREFABRIC.NEWBOXNO'
    end
    object qryPieceHistoryMANUDATE: TDateTimeField
      DisplayLabel = 'Manu'
      DisplayWidth = 10
      FieldName = 'MANUDATE'
      Origin = 'VBSTOCK.VBREFABRIC.MANUDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPieceHistoryREFABRICDATE: TDateTimeField
      DisplayLabel = 'Refabric'
      DisplayWidth = 10
      FieldName = 'REFABRICDATE'
      Origin = 'VBSTOCK.VBREFABRIC.REFABRICDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPieceHistoryDESPDATE: TDateTimeField
      DisplayLabel = 'Despatched'
      DisplayWidth = 10
      FieldName = 'DESPDATE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPieceHistoryGROSSLENGTH: TFloatField
      DisplayLabel = 'Gross m'
      DisplayWidth = 8
      FieldName = 'GROSSLENGTH'
      Origin = 'VBSTOCK.VBREFABRIC.GROSSLENGTH'
    end
    object qryPieceHistoryFAULTS: TIntegerField
      DisplayLabel = 'Faults'
      DisplayWidth = 6
      FieldName = 'FAULTS'
      Origin = 'VBSTOCK.VBREFABRIC.FAULTS'
    end
    object qryPieceHistoryALLOWANCE: TFloatField
      DisplayLabel = 'Allow'
      DisplayWidth = 6
      FieldName = 'ALLOWANCE'
    end
    object qryPieceHistoryNETLENGTH: TFloatField
      DisplayLabel = 'Net m'
      DisplayWidth = 8
      FieldName = 'NETLENGTH'
      Origin = 'VBSTOCK.VBREFABRIC.NETLENGTH'
    end
    object qryPieceHistoryROWNO: TIntegerField
      DisplayLabel = 'Row'
      DisplayWidth = 6
      FieldName = 'ROWNO'
      Origin = 'VBSTOCK.VBREFABRIC.ROWNO'
    end
    object qryPieceHistoryMETRICWIDTH: TIntegerField
      DisplayLabel = 'Width'
      DisplayWidth = 6
      FieldName = 'METRICWIDTH'
    end
    object qryPieceHistoryQLTY: TStringField
      DisplayLabel = 'Qlty'
      FieldName = 'QLTY'
      FixedChar = True
      Size = 1
    end
    object qryPieceHistoryQLTYREASON: TStringField
      DisplayLabel = 'QR'
      FieldName = 'QLTYREASON'
      FixedChar = True
      Size = 2
    end
    object qryPieceHistoryLABELSTRU: TStringField
      DisplayLabel = 'LS'
      FieldName = 'LABELSTRU'
      FixedChar = True
      Size = 2
    end
    object qryPieceHistoryUSERENT: TStringField
      DisplayLabel = 'User Ent'
      FieldName = 'USERENT'
      Origin = 'VBSTOCK.VBREFABRIC.USERENT'
      FixedChar = True
      Size = 4
    end
    object qryPieceHistoryDATEENT: TDateTimeField
      DisplayLabel = 'Entered'
      DisplayWidth = 10
      FieldName = 'DATEENT'
      Origin = 'VBSTOCK.VBREFABRIC.DATEENT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPieceHistoryLABELSTRUCUSTREF: TStringField
      DisplayLabel = 'LSCustRef'
      FieldName = 'LABELSTRUCUSTREF'
      FixedChar = True
      Size = 6
    end
  end
  object datPieceHistory: TDataSource
    DataSet = qryPieceHistory
    Left = 441
    Top = 330
  end
  object qryBoxStripCount: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select count(*) stripsinbox'
      'from vbrcpt'
      'where boxno=:boxno')
    Left = 672
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'boxno'
        ParamType = ptUnknown
      end>
    object qryBoxStripCountSTRIPSINBOX: TIntegerField
      FieldName = 'STRIPSINBOX'
    end
  end
  object datBoxStripCount: TDataSource
    DataSet = qryBoxStripCount
    Left = 704
    Top = 42
  end
  object qryFetchNextLineNo: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select max(lineno) maxlineno'
      'from vbrefabricchanges'
      'where rollno=:rollno')
    Left = 412
    Top = 394
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end>
    object qryFetchNextLineNoMAXLINENO: TIntegerField
      FieldName = 'MAXLINENO'
    end
  end
  object qryDeleteChanges: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'delete'
      'from vbrefabricchanges'
      'where rollno=:rollno')
    Left = 444
    Top = 394
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end>
  end
  object qryCheckChanges: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      
        'select sum(grosslength) grosslength,sum(allowance) allowance,sum' +
        '(netlength) netlength'
      'from vbrefabricchanges'
      'where rollno=:rollno')
    Left = 140
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end>
    object qryCheckChangesGROSSLENGTH: TFloatField
      FieldName = 'GROSSLENGTH'
    end
    object qryCheckChangesALLOWANCE: TFloatField
      FieldName = 'ALLOWANCE'
    end
    object qryCheckChangesNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
    end
  end
  object qryGetMaxStripNo: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select max(stripno) maxstripno'
      'from vbrcpt'
      'where warpno=:warpno'
      'and pieceno=:pieceno')
    Left = 172
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'warpno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pieceno'
        ParamType = ptUnknown
      end>
    object qryGetMaxStripNoMAXSTRIPNO: TSmallintField
      FieldName = 'MAXSTRIPNO'
    end
  end
  object qryGetMaxBoxNo: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select max(boxNo) maxboxno'
      'from vbrcpt')
    Left = 206
    Top = 434
    object qryGetMaxBoxNoMAXBOXNO: TIntegerField
      FieldName = 'MAXBOXNO'
    end
  end
  object qryInsertVBRcpt: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'insert into vbrcpt'
      '('
      
        ' vbstru,vbcol,lotno,boxno,datemanu,faults,metricwidth,grosslengt' +
        'h,'
      ' warpno,pieceno,stripno,initials,datercvd,qlty,rollno,'
      ' longlength,netlength,allowance,greigeno,returned,'
      ' rowno,datemod,usermod,finno,'
      ' vbfin,seqno,qltyreason,labelstru,labelstrucustref,'
      ' valuerating,palletno,despno'
      ')'
      'values'
      '('
      
        ' :vbstru,:vbcol,:lotno,:boxno,:datemanu,:faults,:metricwidth,:gr' +
        'osslength,'
      ' :warpno,:pieceno,:stripno,:initials,:datercvd,:qlty,:rollno,'
      ' :longlength,:netlength,:allowance,:greigeno,:returned,'
      ' :rowno,:datemod,:usermod,:finno,'
      ' :vbfin,:seqno,:qltyreason,:labelstru,:labelstrucustref,'
      ' :valuerating,:palletno,:despno'
      ')')
    Left = 236
    Top = 434
    ParamData = <
      item
        DataType = ftString
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'lotno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'boxno'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datemanu'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'faults'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'grosslength'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'warpno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pieceno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'stripno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'initials'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datercvd'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'longlength'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'netlength'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'allowance'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'greigeno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'returned'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rowno'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'datemod'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'usermod'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'finno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'seqno'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qltyreason'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'labelstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'labelstrucustref'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'valuerating'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'palletno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'despno'
        ParamType = ptUnknown
      end>
  end
  object qryInsertVBRefabric: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'insert into vbrefabric'
      '('
      ' ref,origrollno,newrollno,origboxno,newboxno,manudate,'
      
        ' refabricdate,grosslength,faults,netlength,rowno,dateent,userent' +
        ','
      ' startrollno,allowance,metricwidth,qlty,qltyreason,labelstru'
      ')'
      'values'
      '('
      ' :ref,:origrollno,:newrollno,:origboxno,:newboxno,:manudate,'
      
        ' :refabricdate,:grosslength,:faults,:netlength,:rowno,:dateent,:' +
        'userent,'
      
        ' :startrollno,:allowance,:metricwidth,:qlty,:qltyreason,:labelst' +
        'ru'
      ')')
    Left = 300
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'origrollno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'newrollno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'origboxno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'newboxno'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'manudate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'refabricdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'grosslength'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'faults'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'netlength'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rowno'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dateent'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'userent'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'startrollno'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'allowance'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qltyreason'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'labelstru'
        ParamType = ptUnknown
      end>
  end
  object GenRollNoProc: TStoredProc
    DatabaseName = 'VBStock'
    StoredProcName = 'SPROLLNO'
    Left = 334
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODE'
        ParamType = ptOutput
      end>
  end
  object spGenRefabricRef: TStoredProc
    DatabaseName = 'VBStock'
    StoredProcName = 'SPREFABRICREF'
    Left = 372
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODE'
        ParamType = ptOutput
      end>
  end
  object qryGetStartRollNo: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select startrollno'
      'from vbrefabric'
      'where newrollno=:newrollno')
    Left = 404
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'newrollno'
        ParamType = ptUnknown
      end>
    object qryGetStartRollNoSTARTROLLNO: TIntegerField
      FieldName = 'STARTROLLNO'
    end
  end
  object qryGetTotals: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      
        'select sum(fc.grosslength) grosslength,sum(fc.allowance) allowan' +
        'ce,'
      '  sum(fc.netlength) netlength, sum(fc.faults) faults,'
      '  sum(fc.grosslength/vw.strips) recalcgrossmetres'
      'from vbrefabricchanges fc, vbwidth vw'
      'where fc.rollno=:rollno'
      'and fc.metricwidth=vw.metricwidth')
    Left = 476
    Top = 362
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end>
    object qryGetTotalsGROSSLENGTH: TFloatField
      FieldName = 'GROSSLENGTH'
    end
    object qryGetTotalsALLOWANCE: TFloatField
      FieldName = 'ALLOWANCE'
    end
    object qryGetTotalsNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
    end
    object qryGetTotalsFAULTS: TIntegerField
      FieldName = 'FAULTS'
    end
    object qryGetTotalsRECALCGROSSMETRES: TFloatField
      FieldName = 'RECALCGROSSMETRES'
    end
  end
  object datGetTotals: TDataSource
    DataSet = qryGetTotals
    Left = 508
    Top = 362
  end
  object qryUpdateVBRcpt: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'update vbrcpt'
      'set metricwidth=:metricwidth,'
      ' grosslength=:grosslength,'
      ' qlty=:qlty,'
      ' longlength=:longlength,'
      ' netlength=:netlength,'
      ' faults=:faults,'
      ' allowance=:allowance,'
      ' qltyreason=:qltyreason,'
      ' labelstru=:labelstru,'
      ' labelstrucustref=:labelstrucustref'
      'where rollno=:rollno')
    Left = 268
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'metricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'grosslength'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'longlength'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'netlength'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'faults'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'allowance'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qltyreason'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'labelstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'labelstrucustref'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end>
  end
  object QltyReasonQuery: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select *'
      'from qltyreason'
      'where firstqlty=:firstqlty'
      'and qltyreason=:qltyreason')
    Left = 238
    Top = 366
    ParamData = <
      item
        DataType = ftString
        Name = 'firstqlty'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'qltyreason'
        ParamType = ptUnknown
      end>
  end
  object qryCheckIfDifferentMW: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select *'
      'from vbrefabricchanges'
      'where metricwidth<>:originalmetricwidth'
      'and rollno=:rollno')
    Left = 268
    Top = 362
    ParamData = <
      item
        DataType = ftInteger
        Name = 'originalmetricwidth'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end>
    object qryCheckIfDifferentMWROLLNO: TIntegerField
      FieldName = 'ROLLNO'
      Origin = 'VBSTOCK.VBREFABRICCHANGES.ROLLNO'
    end
  end
  object qryRecalcGrossm: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select sum(fc.grosslength/vw.strips) recalcgrossmetres'
      'from vbrefabricchanges fc, vbwidth vw'
      'where fc.rollno=:rollno'
      'and fc.metricwidth=vw.metricwidth')
    Left = 300
    Top = 362
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rollno'
        ParamType = ptUnknown
      end>
    object qryRecalcGrossmRECALCGROSSMETRES: TFloatField
      FieldName = 'RECALCGROSSMETRES'
    end
  end
  object qryFirstRoll: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select boxno'
      'from vbrefabricchanges')
    Left = 44
    Top = 354
    object qryFirstRollBOXNO: TIntegerField
      FieldName = 'BOXNO'
    end
  end
  object qryQuery: TQuery
    DatabaseName = 'VBStock'
    Left = 68
    Top = 386
  end
  object qryLabels: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select vr.*,vw.imperialwidth,vw.MetricLabelDescr'
      'from vbrefabric re, vbrcpt vr, vbwidth vw'
      'where re.origrollno=:origrollno'
      'and re.netlength>0'
      'and re.newrollno=vr.rollno'
      'and vr.metricwidth=vw.metricwidth'
      'order by vr.stripno'
      '')
    Left = 100
    Top = 386
    ParamData = <
      item
        DataType = ftInteger
        Name = 'origrollno'
        ParamType = ptUnknown
      end>
    object qryLabelsVBSTRU: TStringField
      FieldName = 'VBSTRU'
      Origin = 'VBSTOCK.VBRCPT.VBSTRU'
      FixedChar = True
      Size = 3
    end
    object qryLabelsVBCOL: TStringField
      FieldName = 'VBCOL'
      Origin = 'VBSTOCK.VBRCPT.VBCOL'
      FixedChar = True
      Size = 3
    end
    object qryLabelsLOTNO: TIntegerField
      FieldName = 'LOTNO'
      Origin = 'VBSTOCK.VBRCPT.LOTNO'
    end
    object qryLabelsBOXNO: TIntegerField
      FieldName = 'BOXNO'
      Origin = 'VBSTOCK.VBRCPT.BOXNO'
    end
    object qryLabelsDATEMANU: TDateTimeField
      FieldName = 'DATEMANU'
      Origin = 'VBSTOCK.VBRCPT.DATEMANU'
    end
    object qryLabelsFAULTS: TSmallintField
      FieldName = 'FAULTS'
      Origin = 'VBSTOCK.VBRCPT.FAULTS'
    end
    object qryLabelsMETRICWIDTH: TSmallintField
      FieldName = 'METRICWIDTH'
      Origin = 'VBSTOCK.VBRCPT.METRICWIDTH'
    end
    object qryLabelsGROSSLENGTH: TFloatField
      FieldName = 'GROSSLENGTH'
      Origin = 'VBSTOCK.VBRCPT.GROSSLENGTH'
    end
    object qryLabelsWARPNO: TIntegerField
      FieldName = 'WARPNO'
      Origin = 'VBSTOCK.VBRCPT.WARPNO'
    end
    object qryLabelsPIECENO: TSmallintField
      FieldName = 'PIECENO'
      Origin = 'VBSTOCK.VBRCPT.PIECENO'
    end
    object qryLabelsSTRIPNO: TSmallintField
      FieldName = 'STRIPNO'
      Origin = 'VBSTOCK.VBRCPT.STRIPNO'
    end
    object qryLabelsINITIALS: TStringField
      FieldName = 'INITIALS'
      Origin = 'VBSTOCK.VBRCPT.INITIALS'
      FixedChar = True
      Size = 4
    end
    object qryLabelsDESPNO: TIntegerField
      FieldName = 'DESPNO'
      Origin = 'VBSTOCK.VBRCPT.DESPNO'
    end
    object qryLabelsDATERCVD: TDateTimeField
      FieldName = 'DATERCVD'
      Origin = 'VBSTOCK.VBRCPT.DATERCVD'
    end
    object qryLabelsQLTY: TStringField
      FieldName = 'QLTY'
      Origin = 'VBSTOCK.VBRCPT.QLTY'
      FixedChar = True
      Size = 1
    end
    object qryLabelsROLLNO: TIntegerField
      FieldName = 'ROLLNO'
      Origin = 'VBSTOCK.VBRCPT.ROLLNO'
    end
    object qryLabelsLONGLENGTH: TFloatField
      FieldName = 'LONGLENGTH'
      Origin = 'VBSTOCK.VBRCPT.LONGLENGTH'
    end
    object qryLabelsPALLETNO: TIntegerField
      FieldName = 'PALLETNO'
      Origin = 'VBSTOCK.VBRCPT.PALLETNO'
    end
    object qryLabelsNETLENGTH: TFloatField
      FieldName = 'NETLENGTH'
      Origin = 'VBSTOCK.VBRCPT.NETLENGTH'
    end
    object qryLabelsALLOWANCE: TFloatField
      FieldName = 'ALLOWANCE'
      Origin = 'VBSTOCK.VBRCPT.ALLOWANCE'
    end
    object qryLabelsGREIGENO: TSmallintField
      FieldName = 'GREIGENO'
      Origin = 'VBSTOCK.VBRCPT.GREIGENO'
    end
    object qryLabelsRETURNED: TStringField
      FieldName = 'RETURNED'
      Origin = 'VBSTOCK.VBRCPT.RETURNED'
      FixedChar = True
      Size = 1
    end
    object qryLabelsVTORDNO: TIntegerField
      FieldName = 'VTORDNO'
      Origin = 'VBSTOCK.VBRCPT.VTORDNO'
    end
    object qryLabelsDATERQD: TDateTimeField
      FieldName = 'DATERQD'
      Origin = 'VBSTOCK.VBRCPT.DATERQD'
    end
    object qryLabelsROWNO: TIntegerField
      FieldName = 'ROWNO'
      Origin = 'VBSTOCK.VBRCPT.ROWNO'
    end
    object qryLabelsDATEMOD: TDateTimeField
      FieldName = 'DATEMOD'
      Origin = 'VBSTOCK.VBRCPT.DATEMOD'
    end
    object qryLabelsUSERMOD: TStringField
      FieldName = 'USERMOD'
      Origin = 'VBSTOCK.VBRCPT.USERMOD'
      FixedChar = True
      Size = 4
    end
    object qryLabelsDESPDATE: TDateTimeField
      FieldName = 'DESPDATE'
      Origin = 'VBSTOCK.VBRCPT.DESPDATE'
    end
    object qryLabelsFINNO: TIntegerField
      FieldName = 'FINNO'
      Origin = 'VBSTOCK.VBRCPT.FINNO'
    end
    object qryLabelsVBFIN: TStringField
      FieldName = 'VBFIN'
      Origin = 'VBSTOCK.VBRCPT.VBFIN'
      FixedChar = True
      Size = 2
    end
    object qryLabelsSEQNO: TIntegerField
      FieldName = 'SEQNO'
      Origin = 'VBSTOCK.VBRCPT.SEQNO'
    end
    object qryLabelsQLTYREASON: TStringField
      FieldName = 'QLTYREASON'
      Origin = 'VBSTOCK.VBRCPT.QLTYREASON'
      FixedChar = True
      Size = 2
    end
    object qryLabelsLABELSTRU: TStringField
      FieldName = 'LABELSTRU'
      Origin = 'VBSTOCK.VBRCPT.LABELSTRU'
      FixedChar = True
      Size = 2
    end
    object qryLabelsLABELSTRUCUSTREF: TStringField
      FieldName = 'LABELSTRUCUSTREF'
      Origin = 'VBSTOCK.VBRCPT.LABELSTRUCUSTREF'
      FixedChar = True
      Size = 6
    end
    object qryLabelsVTORDDETITEMNO: TIntegerField
      FieldName = 'VTORDDETITEMNO'
      Origin = 'VBSTOCK.VBRCPT.VTORDDETITEMNO'
    end
    object qryLabelsVALUERATING: TIntegerField
      FieldName = 'VALUERATING'
      Origin = 'VBSTOCK.VBRCPT.VALUERATING'
    end
    object qryLabelsIMPERIALWIDTH: TStringField
      FieldName = 'IMPERIALWIDTH'
      FixedChar = True
      Size = 4
    end
    object qryLabelsMETRICLABELDESCR: TStringField
      FieldName = 'METRICLABELDESCR'
      FixedChar = True
      Size = 5
    end
  end
  object qryCustPart: TQuery
    DatabaseName = 'VBStock'
    SQL.Strings = (
      'select descr,styledescr,partno'
      'from custpart'
      'where custref=:custref'
      'and vbstru=:vbstru'
      'and vbcol=:vbcol'
      'and vbfin=:vbfin'
      'and vbwidth=:vbwidth')
    Left = 134
    Top = 390
    ParamData = <
      item
        DataType = ftString
        Name = 'custref'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbstru'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbcol'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'vbfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vbwidth'
        ParamType = ptUnknown
      end>
    object qryCustPartDESCR: TStringField
      FieldName = 'DESCR'
      Size = 10
    end
    object qryCustPartSTYLEDESCR: TStringField
      FieldName = 'STYLEDESCR'
      Size = 16
    end
    object qryCustPartPARTNO: TStringField
      FieldName = 'PARTNO'
      Size = 11
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3500
    OnTimer = Timer1Timer
    Left = 36
    Top = 386
  end
end
