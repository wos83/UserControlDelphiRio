object Frame_Profile: TFrame_Profile
  Left = 0
  Top = 0
  Width = 697
  Height = 554
  Anchors = [akLeft, akTop, akRight, akBottom]
  AutoSize = True
  TabOrder = 0
  TabStop = True
  object DbGridPerf: TDBGrid
    Left = 0
    Top = 0
    Width = 601
    Height = 554
    Ctl3D = True
    DataSource = DataPerfil
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = BtnAcePerClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Title.Caption = 'Perfil'
        Width = 573
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 599
    Top = 0
    Width = 98
    Height = 554
    BevelOuter = bvNone
    TabOrder = 1
    object BtnAddPer: TBitBtn
      Left = 7
      Top = 10
      Width = 81
      Height = 25
      Cursor = crHandPoint
      Caption = '&Adicionar'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0060000060
        00006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF777777787878777777FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00600033CB
        51006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF777777C8C8C8777777FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00600000600000600040D8
        65006000006000006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF787878777777777777D1D1D1787878777777777777D1BBAD694731
        69473169473169473169473169473169473169473100600060F8985AF28F4DE5
        7A40D8653AD25C006000CCCCCC6C6C6C6B6B6B6B6B6B6C6C6C6C6C6C6B6B6B6C
        6C6C6B6B6B777777EAEAEAE5E5E5DBDBDBD2D2D2CDCDCD787878D1BBADFFFFFF
        FBF9F8F7F3F1F3EDEAEFE7E3EBE1DBE6D9D2E1D2CA0060000060000060005AF2
        8F006000006000006000CCCCCCFFFFFFFBFBFBF7F7F7F2F2F2EEEEEEEAEAEAE3
        E3E3DFDFDF777777777777777777E6E6E6777777777777787878D1BBADFFFFFF
        CF875FCF875FF7F3F1CF875FCF875FEBE1DBCF875FCF875FDCCBC100600060F8
        98006000FF00FFFF00FFCCCCCCFFFFFFA4A4A4A4A4A4F7F7F7A5A5A5A4A4A4EA
        EAEAA5A5A5A4A4A4D9D9D9777777EAEAEA777777FF00FFFF00FFD1BBADFFFFFF
        FFFFFFFFFFFFFBF9F8F7F3F1F3EDEAEFE7E3EBE1DBE6D9D2E1D2CA0060000060
        00006000FF00FFFF00FFCCCCCCFFFFFFFFFFFFFFFFFFFBFBFBF7F7F7F3F3F3EE
        EEEEE9E9E9E4E4E4DFDFDF777777777777777777FF00FFFF00FFD1BBADD1BBAD
        D1BBADD1BBADE070406947316947316947316947316947316947316947316947
        31694731694731694731CDCDCDCCCCCCCCCCCCCCCCCC9494946C6C6C6C6C6C6B
        6B6B6C6C6C6B6B6B6C6C6C6B6B6B6C6C6C6B6B6B6C6C6C6C6C6CFF00FFFF00FF
        FF00FFFF00FFE07040FFFFFFFBF9F8F7F3F1F3EDEAEFE7E3EBE1DBE6D9D2E1D2
        CADCCBC1DBC9BF694731FF00FFFF00FFFF00FFFF00FF959595FFFFFFFBFBFBF7
        F7F7F2F2F2EEEEEEEAEAEAE3E3E3DFDFDFD9D9D9D8D8D86C6C6CFF00FFFF00FF
        FF00FFFF00FFE07040FFFFFFCF875FCF875FF7F3F1CF875FCF875FEBE1DBCF87
        5FCF875FDCCBC1694731FF00FFFF00FFFF00FFFF00FF949494FFFFFFA5A5A5A4
        A4A4F7F7F7A5A5A5A4A4A4EAEAEAA5A5A5A4A4A4DADADA6B6B6BFF00FFFF00FF
        FF00FFFF00FFE07040FFFFFFFFFFFFFFFFFFFBF9F8F7F3F1F3EDEAEFE7E3EBE1
        DBE6D9D2E1D2CA694731FF00FFFF00FFFF00FFFF00FF949494FFFFFFFFFFFFFF
        FFFFFBFBFBF7F7F7F2F2F2EEEEEEEAEAEAE4E4E4DFDFDF6C6C6CFF00FFFF00FF
        FF00FFFF00FFE07040E07040E07040E07040E07040E07040E07040E07040E070
        40E07040E07040E07040FF00FFFF00FFFF00FFFF00FF95959595959595959594
        9494949494949494959595959595949494959595959595959595FF00FFFF00FF
        FF00FFFF00FFE07040FBC39FFBC39FFAC19CF5B18BEFA27AEB9369E68254E070
        40E07040E07040E07040FF00FFFF00FFFF00FFFF00FF949494D2D2D2D2D2D2D0
        D0D0C4C4C4BABABAAFAFAFA1A1A1949494959595959595959595FF00FFFF00FF
        FF00FFFF00FFE07040E07040E07040E07040E07040E07040E07040E07040E070
        40E07040E07040E07040FF00FFFF00FFFF00FFFF00FF95959595959594949495
        9595959595959595949494959595949494949494959595959595FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BtnAddPerClick
    end
    object BtnAltPer: TBitBtn
      Left = 7
      Top = 72
      Width = 81
      Height = 25
      Cursor = crHandPoint
      Caption = '&Alterar'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BBAD694731
        694731694731694731694731694731694731694731694731694731694731FF00
        FFFF00FFFF00FFFF00FFCCCCCC6C6C6C6B6B6B6C6C6C6C6C6C6C6C6C6C6C6C6C
        6C6C6B6B6B6C6C6C6C6C6C6B6B6BFF00FFFF00FFFF00FFFF00FFD1BBADFFFFFF
        FBF9F8F7F3F1F3EDEAEFE7E3EBE1DBE6D9D2E1D2CADCCBC1DBC9BF694731FF00
        FFFF00FFFF00FFFF00FFCDCDCDFFFFFFFBFBFBF7F7F7F2F2F2EEEEEEE9E9E9E3
        E3E3DFDFDFDADADAD8D8D86C6C6CFF00FFFF00FFFF00FFFF00FFD1BBADFFFFFF
        CF875FCF875FF7F3F1CF875FCF875F1C1C1C1C1C1C1C1C1CDCCBC1694731FF00
        FFFF00FFFF00FFFF00FFCDCDCDFFFFFFA4A4A4A4A4A4F7F7F7A4A4A4A4A4A440
        4040404040414141DADADA6C6C6CFF00FFFF00FFFF00FFFF00FFD1BBADFFFFFF
        FFFFFFFFFFFFFBF9F8F7F3F11C1C1C0098C8FCFAF8A39D98E1D2CA694731FF00
        FFFF00FFFF00FFFF00FFCDCDCDFFFFFFFFFFFFFFFFFFFBFBFBF7F7F7414141B9
        B9B9FCFCFCB7B7B7DFDFDF6B6B6BFF00FFFF00FFFF00FFFF00FFD1BBADD1BBAD
        D1BBADD1BBADE070401C1C1C0098C84ABEDF0098C8A39D986947316947316947
        31694731694731694731CCCCCCCDCDCDCDCDCDCDCDCD959595404040B9B9B9D3
        D3D3B9B9B9B7B7B76C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6CFF00FFFF00FF
        FF00FFFF00FF1C1C1C0098C84ABEDF94E4F60098C8EFE7E3EBE1DBE6D9D2E1D2
        CADCCBC1DBC9BF694731FF00FFFF00FFFF00FFFF00FF414141B9B9B9D3D3D3ED
        EDEDB9B9B9EEEEEEEAEAEAE4E4E4DFDFDFD9D9D9D8D8D86C6C6CFF00FFFF00FF
        FF00FF1C1C1C0098C84ABEDF94E4F60098C8F7F3F1CF875FCF875FEBE1DBCF87
        5FCF875FDCCBC1694731FF00FFFF00FFFF00FF414141B9B9B9D3D3D3EDEDEDB9
        B9B9F7F7F7A4A4A4A4A4A4EAEAEAA4A4A4A4A4A4D9D9D96C6C6CFF00FFFF00FF
        1C1C1C0098C84ABEDF94E4F60098C8FFFFFFFBF9F8F7F3F1F3EDEAEFE7E3EBE1
        DBE6D9D2E1D2CA694731FF00FFFF00FF414141B9B9B9D3D3D3EDEDEDB9B9B9FF
        FFFFFBFBFBF7F7F7F3F3F3EEEEEEE9E9E9E3E3E3DFDFDF6C6C6CFF00FF00009A
        8080804ABEDF94E4F60098C8E07040E07040E07040E07040E07040E07040E070
        40E07040E07040E07040FF00FF7272729F9F9FD3D3D3EDEDEDB9B9B994949495
        959595959595959594949495959594949495959595959594949400009A00009A
        778C98D2BAAC0098C8FBC39FFBC39FFAC19CF5B18BEFA27AEB9369E68254E070
        40E07040E07040E07040727272727272AAAAAACCCCCCB9B9B9D2D2D2D2D2D2D0
        D0D0C4C4C4B9B9B9AFAFAFA2A2A29494949595959595959595954A23C70030F8
        6D8AFD0030F8E07040E07040E07040E07040E07040E07040E07040E07040E070
        40E07040E07040E07040A85FA8A2A2A2C2C2C2A2A2A295959595959595959594
        9494959595959595959595949494959595959595959595959595FF00FF8817DA
        0030F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC63EC6A2A2A2FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BtnAltPerClick
    end
    object BtnExcPer: TBitBtn
      Left = 7
      Top = 103
      Width = 81
      Height = 25
      Cursor = crHandPoint
      Caption = '&Excluir'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF0030F8000098FF00FFFF00FFFF00FFFF00
        FFFF00FF0000980030F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3
        A3A3707070FF00FFFF00FFFF00FFFF00FFFF00FF707070A2A2A2FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0030F8000098FF00FFFF00FFFF00
        FF0000980030F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFA2A2A2707070FF00FFFF00FFFF00FF707070A3A3A3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0030F8000098FF00FF0000
        980030F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA2A2A2707070FF00FF727272A3A3A3FF00FFFF00FFD1BBAD694731
        6947316947316947316947316947316947316947316947310030F8002AD0002A
        D0FF00FFFF00FFFF00FFCCCCCC6C6C6C6C6C6C6C6C6C6B6B6B6C6C6C6B6B6B6B
        6B6B6C6C6C6C6C6CA3A3A3919191919191FF00FFFF00FFFF00FFD1BBADE8DCD4
        E6D9D1E4D7CEE2D4CAE1D1C7DFCFC4DDCBC0DBC8BDD8C5B90030F8002AD00000
        98FF00FFFF00FFFF00FFCDCDCDE6E6E6E3E3E3E2E2E2E0E0E0DDDDDDDCDCDCD9
        D9D9D7D7D7D5D5D5A2A2A2919191707070FF00FFFF00FFFF00FFD1BBADE8DCD4
        694731694731E4D7CE694731694731DFCFC46947310030F80000986947310030
        F8000098FF00FFFF00FFCDCDCDE6E6E66C6C6C6C6C6CE2E2E26C6C6C6C6C6CDC
        DCDC6C6C6CA2A2A27070706C6C6CA3A3A3707070FF00FFFF00FFD1BBADE8DCD4
        E8DCD4E8DCD4E6D9D1E4D7CEE2D4CAE1D1C70030F8000098DBC8BD694731FF00
        FF0030F8000098FF00FFCDCDCDE6E6E6E6E6E6E6E6E6E3E3E3E2E2E2DFDFDFDD
        DDDDA3A3A3707070D7D7D76C6C6CFF00FFA3A3A3727272FF00FFD1BBADD1BBAD
        D1BBADD1BBADE070406947316947316947310000986947316947316947316947
        316947310030F8694731CCCCCCCCCCCCCDCDCDCDCDCD9595956B6B6B6C6C6C6C
        6C6C7070706C6C6C6C6C6C6C6C6C6C6C6C6C6C6CA2A2A26C6C6CFF00FFFF00FF
        FF00FFFF00FFE07040FFFFFFFBF9F8F7F3F1F3EDEAEFE7E3EBE1DBE6D9D2E1D2
        CADCCBC1DBC9BF694731FF00FFFF00FFFF00FFFF00FF959595FFFFFFFBFBFBF7
        F7F7F2F2F2EEEEEEE9E9E9E4E4E4DFDFDFDADADAD8D8D86C6C6CFF00FFFF00FF
        FF00FFFF00FFE07040FFFFFF694731694731F7F3F1694731694731EBE1DB6947
        31694731DCCBC1694731FF00FFFF00FFFF00FFFF00FF959595FFFFFF6C6C6C6B
        6B6BF7F7F76C6C6C6C6C6CEAEAEA6B6B6B6C6C6CD9D9D96C6C6CFF00FFFF00FF
        FF00FFFF00FFE07040FFFFFFFFFFFFFFFFFFFBF9F8F7F3F1F3EDEAEFE7E3EBE1
        DBE6D9D2E1D2CA694731FF00FFFF00FFFF00FFFF00FF959595FFFFFFFFFFFFFF
        FFFFFBFBFBF7F7F7F3F3F3EEEEEEEAEAEAE3E3E3DFDFDF6C6C6CFF00FFFF00FF
        FF00FFFF00FFE07040E07040E07040E07040E07040E07040E07040E07040E070
        40E07040E07040E07040FF00FFFF00FFFF00FFFF00FF95959595959595959595
        9595949494959595959595959595959595959595959595949494FF00FFFF00FF
        FF00FFFF00FFE07040FBC39FFBC39FFAC19CF5B18BEFA27AEB9369E68254E070
        40E07040E07040E07040FF00FFFF00FFFF00FFFF00FF959595D2D2D2D2D2D2D0
        D0D0C4C4C4B9B9B9AFAFAFA2A2A2959595949494959595959595FF00FFFF00FF
        FF00FFFF00FFE07040E07040E07040E07040E07040E07040E07040E07040E070
        40E07040E07040E07040FF00FFFF00FFFF00FFFF00FF95959595959594949495
        9595959595959595959595959595949494959595959595959595FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = BtnExcPerClick
    end
    object BtnAcePer: TBitBtn
      Left = 7
      Top = 134
      Width = 81
      Height = 25
      Cursor = crHandPoint
      Caption = '&Acessos'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC2652BA53C00A53C00A53C00A53C00A53C00A53C
        00A53C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89898969
        69696969696969696969696969696A6A6A696969FF00FFFF00FFFF00FFFF00FF
        A22E08A22E08A22E08A22E08C2652BFFD4A5FFD4A5FFD4A5FFCD97FFC07DFFAD
        55A53C00FF00FFFF00FFFF00FFFF00FF606060606060606060606060898989DC
        DCDCDCDCDCDCDCDCD7D7D7CCCCCCBEBEBE6A6A6AFF00FFFF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FFC2652BC2652BC2652BC2652BC2652BC2652BC265
        2BC2652BFF00FFFF00FFFF00FFFF00FF606060FF00FFFF00FFFF00FF89898989
        8989898989898989898989898989898989898989FF00FFFF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FF1C1C1C986060986060A53C00A53C00A53C00A53C
        00A53C00FF00FFFF00FFFF00FFFF00FF616161FF00FFFF00FFFF00FF41414188
        8888888888696969696969696969696969696969FF00FFFF00FFFF00FFFF00FF
        A22E08A22E08A22E08A22E08C89898FCFAF80098C81C1C1CFFCD97FFC07DFFAD
        55A53C00FF00FFFF00FFFF00FFFF00FF606060606060606060606060B5B5B5FC
        FCFCB9B9B9414141D7D7D7CCCCCCBEBEBE696969FF00FFFF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FFC898980098C84ABEDF0098C81C1C1CC2652BC265
        2BC2652BFF00FFFF00FFFF00FFFF00FF606060FF00FFFF00FFFF00FFB5B5B5B9
        B9B9D3D3D3B9B9B9414141898989898989898989FF00FFFF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FFFF00FF0098C894E4F64ABEDF0098C81C1C1CFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FF00FFFF00FFFF00FFFF00FFB9
        B9B9EDEDEDD3D3D3B9B9B9414141FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FFC2652BA53C000098C894E4F64ABEDF0098C81C1C
        1CA53C00FF00FFFF00FFFF00FFFF00FF606060FF00FFFF00FFFF00FF89898969
        6969B9B9B9EDEDEDD3D3D3B9B9B94040406A6A6AFF00FFFF00FFFF00FFFF00FF
        A22E08A22E08A22E08A22E08C2652BFFD4A5FFD4A50098C894E4F64ABEDF0098
        C81C1C1CFF00FFFF00FFFF00FFFF00FF606060606060606060606060898989DC
        DCDCDCDCDCB9B9B9EDEDEDD3D3D3BABABA414141FF00FFFF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FFC2652BC2652BC2652BC2652B0098C894E4F64ABE
        DF80808000009AFF00FFFF00FFFF00FF606060FF00FFFF00FFFF00FF89898989
        8989898989898989BABABAEDEDEDD3D3D3A0A0A0727272FF00FFFF00FFFF00FF
        A22E08FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0098C8D2BA
        AC778C9800009A00009AFF00FFFF00FF606060FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFB9B9B9CCCCCCABABAB727272727272C2652BA22E08
        A22E08A22E08A22E08A22E08A22E08A22E16FF00FFFF00FFFF00FFFF00FF0030
        F86D8AFD0030F800009A89898960606060606060606060606060606060606061
        6161FF00FFFF00FFFF00FFFF00FFA2A2A2C2C2C2A3A3A3727272C2652BFFD4A5
        FFD4A5FFD4A5FFCD97FFC07DFFAD55A22E08FF00FFFF00FFFF00FFFF00FFFF00
        FF0030F80030F8FF00FF898989DCDCDCDCDCDCDCDCDCD7D7D7CCCCCCBEBEBE60
        6060FF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2A3A3A3FF00FFC2652BC2652B
        C2652BC2652BC2652BC2652BC2652BC2652BFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF89898989898989898989898989898989898989898989
        8989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BtnAcePerClick
    end
    object BtnCopiaPer: TBitBtn
      Left = 7
      Top = 41
      Width = 81
      Height = 25
      Cursor = crHandPoint
      Caption = '&Copiar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB98385B98385B98385B983
        85B98385B98385B98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFB98385F6DDB7F4D7ACF3D3A1F1CF98F0CA8FB98385FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA8E85F8E5C98A94D91E47
        F6888ECDF2D19CB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFCB9A82FAEDD91E49F90033FF1E48F6F4D8ABB98385FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA887FCF5E98D9DED1E49
        FA8B97E0F6E0BDB98385FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFE3B18EFEFBF6FCF7EDFBF2E4FAEDDAF8E8CEB98385FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEDBD92FFFFFFFEFCFAFDF9
        F2B98384B98384BE8675B78183B78183B78183B78183B78183B78183B78183B7
        8183FF00FFEDBD92FFFFFFFFFFFFFEFDFCB98384D39769FF00FFB78183EED1B1
        E1B894E1B68CDFB180DCAB75EFC686B78183FF00FFEDBD92DCA887DCA887DCA8
        87B98384FF00FF007404B78183CA8F6B952B009A3401993401993300E4B57CB7
        8183FF00FFFF00FF45812CFF00FFFF00FFFF00FFFF00FF057E0EBA8E85F8EEE5
        A14213972E00942900BD7649FDE5B3B78183FF00FF017809109726FF00FFFF00
        FFFF00FF049012087F10CB9A82FFFFFFD5A992922600A04112ECCCAEFFEFC5B7
        818303750F49CC722EA848037008097B110C91160D9C1905730BDCA887FFFFFF
        FCF7F5AE5B33CD9574FBF1DEDECBB4428A3E44D2735CE78E3ECA6027B84014AB
        250EA31B07800FFF00FFE3B18EFFFFFFFFFFFFEDDBD1F9F2EAB78183B78183B7
        847530AB4A38C65826AF3D0D8A18098611077B0DFF00FFFF00FFEDBD92FFFFFF
        FFFFFFFFFFFFFDFFFFB78183DC9D64FF00FFFF00FF138E21199F29FF00FFFF00
        FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887B78183FF00FFFF
        00FFFF00FFFF00FF0A7D12FF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 4
      OnClick = BtnCopiaPerClick
    end
  end
  object DataPerfil: TDataSource
    AutoEdit = False
    Left = 632
    Top = 192
  end
end
