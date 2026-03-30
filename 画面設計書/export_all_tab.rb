#!/bin/env ruby

# drawioのページ(タブ)の順番と合わせること
PAGES = [
  {
    name: '画面遷移',
    file_name: 'screen_flow_diagram.svg',
    skip: true
  },
  {
    name: '基本構成(ログイン)',
    file_name: 'basic_structure_login.svg',
    skip: false
  },
  {
    name: '基本構成(ログイン以外)',
    file_name: 'basic_structure.svg',
    skip: false
  },
  {
    name: 'ヘッダー(ログイン)',
    file_name: 'header_login.svg',
    skip: false
  },
  {
    name: 'ヘッダー(ログイン以外)',
    file_name: 'header.svg',
    skip: false
  },
  {
    name: 'フッター',
    file_name: 'footer.svg',
    skip: false
  },
  {
    name: 'コンテンツ',
    file_name: 'contents.svg',
    skip: false
  },
  {
    name: 'サイドメニュー',
    file_name: 'side_menu.svg',
    skip: false
  },
  {
    name: '計算中プログレスバー',
    file_name: 'progress_bar.svg',
    skip: false
  },
  {
    name: 'ログイン画面',
    file_name: 'login.svg',
    skip: false
  },
  {
    name: '新規ユーザー登録画面',
    file_name: 'user_new.svg',
    skip: false
  },
  {
    name: 'パスワード忘れメール送信画面',
    file_name: 'password_reminder.svg',
    skip: false
  },
  {
    name: 'パスワード設定画面',
    file_name: 'change_password.svg',
    skip: false
  },
  {
    name: 'ユーザー一覧画面(管理者)',
    file_name: 'user_list.svg',
    skip: false
  },
  {
    name: 'ユーザー一覧画面(営業)',
    file_name: 'user_list_for_sales.svg',
    skip: false
  },
  {
    name: 'ユーザー編集画面',
    file_name: 'user_edit.svg',
    skip: false
  },
  {
    name: 'ユーザー詳細画面(営業)',
    file_name: 'user_show_for_sales.svg',
    skip: false
  },
  {
    name: '登録情報画面',
    file_name: 'user_profile.svg',
    skip: false
  },
  {
    name: '形式選択画面',
    file_name: 'products.svg',
    skip: false
  },
  {
    name: '案件一覧画面',
    file_name: 'projects.svg',
    skip: false
  },
  {
    name: '案件一覧のcsv出力内容',
    file_name: 'projects_csv_export.svg',
    skip: false
  },
  {
    name: 'ライナープレート編集画面',
    file_name: 'lp_master.svg',
    skip: false
  },
  {
    name: 'H形鋼編集画面',
    file_name: 'h_beam_master.svg',
    skip: false
  },
  {
    name: 'SDB案件検索画面',
    file_name: 'search_sdb.svg',
    skip: false
  },
  {
    name: 'カゴ枠情報入力画面',
    file_name: 'reinforcement_cage_inputs.svg',
    skip: false
  },
  {
    name: 'クーロン土圧が選択された時の絵',
    file_name: 'reinforcement_cage_inputs_coulomb.svg',
    skip: false
  },
  {
    name: '試行くさび法が選択された時の絵',
    file_name: 'reinforcement_cage_inputs_trial_wedge.svg',
    skip: false
  },
  {
    name: '基本情報入力画面(ベース)',
    file_name: 'lp_inputs_common.svg',
    skip: false
  },
  {
    name: '土質・土層条件(静止土圧・楕円化変化率を入力する場合)',
    file_name: 'static_elliptical_percent_input.svg',
    skip: false
  },
  {
    name: '土質・土層条件(静止土圧・楕円化変化量入力する場合)',
    file_name: 'static_elliptical_amount_input.svg',
    skip: false
  },
  {
    name: '土質・土層条件(ランキン土圧・楕円化変化率を入力する場合)',
    file_name: 'rankine_elliptical_percent_input.svg',
    skip: false
  },
  {
    name: '土質・土層条件(ランキン土圧・楕円化変化量入力する場合)',
    file_name: 'rankine_elliptical_amount_input.svg',
    skip: false
  },
  {
    name: '土質・土層条件(クーロン土圧・楕円化変化率を入力する場合)',
    file_name: 'coulomb_elliptical_percent_input.svg',
    skip: false
  },
  {
    name: '土質・土層条件(クーロン土圧・楕円化変化量入力する場合)',
    file_name: 'coulomb_elliptical_amount_input.svg',
    skip: false
  },
  {
    name: '土質・土層条件(テルツァギ土圧・楕円化変化率を入力する場合)',
    file_name: 'terzaghi_elliptical_percent_input.svg',
    skip: false
  },
  {
    name: '土質・土層条件(テルツァギ静止土圧・楕円化変化量入力する場合)',
    file_name: 'terzaghi_elliptical_amount_input.svg',
    skip: false
  },
  {
    name: '基本情報入力画面(円形)',
    file_name: 'lp_inputs_circle.svg',
    skip: false
  },
  {
    name: '基本情報入力画面(矩形)',
    file_name: 'lp_inputs_rectangle.svg',
    skip: false
  },
  {
    name: '基本情報入力画面(集水井)',
    file_name: 'lp_inputs_drainage.svg',
    skip: false
  },
  {
    name: '基本情報入力画面(小判形)',
    file_name: 'lp_inputs_oval.svg',
    skip: false
  },
  {
    name: '外枠・支保工設定画面(ベース)',
    file_name: 'outer_frame_shoring_inputs_common.svg',
    skip: false
  },
  {
    name: '外枠・支保工設定画面(円形立坑)',
    file_name: 'outer_frame_shoring_inputs_circle.svg',
    skip: false
  },
  {
    name: '外枠・支保工設定画面(小判形立坑)',
    file_name: 'outer_frame_shoring_inputs_oval.svg',
    skip: false
  },
  {
    name: '外枠・支保工設定画面(矩形立坑)',
    file_name: 'outer_frame_shoring_inputs_rectangle.svg',
    skip: false
  },
  {
    name: '外枠・支保工設定画面(集水井立坑)',
    file_name: 'outer_frame_shoring_inputs_drainage.svg',
    skip: false
  },
  {
    name: 'カゴ枠計算結果画面',
    file_name: 'reinforcement_cage_calc_result.svg',
    skip: false
  },
  {
    name: 'ライナープレート計算結果画面上部メニュー',
    file_name: 'lp_calc_result_top_menu.svg',
    skip: false
  },
  {
    name: 'ライナープレート計算結果画面(円形立坑)',
    file_name: 'lp_calc_result_circle.svg',
    skip: false
  },
  {
    name: 'ライナープレート計算結果画面(小判形立坑)',
    file_name: 'lp_calc_result_oval.svg',
    skip: false
  },
  {
    name: 'ライナープレート計算結果画面(矩形立坑)',
    file_name: 'lp_calc_result_rectangle.svg',
    skip: false
  },
  {
    name: 'ライナープレート計算結果画面(集水井立坑)',
    file_name: 'lp_calc_result_drainage.svg',
    skip: false
  },
  {
    name: '外枠の手動計算画面',
    file_name: 'calc_manual_outer_frame.svg',
    skip: false
  },
  {
    name: '支保工の手動計算画面',
    file_name: 'calc_manual_shoring.svg',
    skip: false
  },
  {
    name: '継手部の手動計算画面',
    file_name: 'calc_manual_splice_plate.svg',
    skip: false
  },
  {
    name: '継手部4',
    file_name: 'calc_manual_splice_plate_4.svg',
    skip: false
  },
  {
    name: '継手部6',
    file_name: 'calc_manual_splice_plate_6.svg',
    skip: false
  },
  {
    name: '継手部8',
    file_name: 'calc_manual_splice_plate_8.svg',
    skip: false
  },
  {
    name: '形状図表示画面',
    file_name: 'shape_diagram.svg',
    skip: false
   },
   {
    name: '別構成提案画面',
    file_name: 'lp_other_options.svg',
    skip: false
   },
  {
    name: '設計計算書情報画面',
    file_name: 'design_calculations.svg',
    skip: false
   },
   {
    name: '材料・図面情報入力画面',
    file_name: 'material_diagrams.svg',
    skip: false
   },
   {
    name: '見積書入力画面',
    file_name: 'estimates.svg',
    skip: false
   },
   {
    name: '材料マスタ編集画面',
    file_name: 'material_masters.svg',
    skip: false
   },
   {
    name: '見積マスタ編集画面',
    file_name: 'estimate_masters.svg',
    skip: false
   },
   {
    name: 'LP単重マスタ編集画面',
    file_name: 'lp_unit_mass_masters.svg',
    skip: false
   },
   {
    name: 'LP本体組み立てボルトマスタ編集画面',
    file_name: 'lp_bolt_masters.svg',
    skip: false
   },
   {
    name: 'LP製造可能範囲マスタ編集画面',
    file_name: 'lp_bending_process_scope_masters.svg',
    skip: false
   },
   {
    name: 'H形鋼単重マスタ編集画面',
    file_name: 'h_beam_unit_mass_masters.svg',
    skip: false
   },
   {
    name: 'H形鋼継手板マスタ編集画面',
    file_name: 'h_beam_splice_plate_unit_mass_masters.svg',
    skip: false
   },
   {
    name: 'H形鋼製造可能範囲マスタ編集画面',
    file_name: 'h_beam_bending_process_scope_masters.svg',
    skip: false
   },
   {
    name: 'H形鋼コーナーアングルマスタ編集画面',
    file_name: 'h_beam_corner_angle_masters.svg',
    skip: false
   },
   {
    name: 'LP単価マスタ編集画面',
    file_name: 'lp_unit_price_masters.svg',
    skip: false
   },
   {
    name: 'H形鋼単価マスタ編集画面',
    file_name: 'h_beam_unit_price_masters.svg',
    skip: false
   },
   {
    name: 'パッキング編集画面',
    file_name: 'packing_masters.svg',
    skip: false
   },
   {
    name: 'CSVアップロード確認画面',
    file_name: 'comfirm_upload_csv.svg',
    skip: false
   },
]

DRAWIO_BIN='/Applications/draw.io.app/Contents/MacOS/draw.io'
DRAWIO_FILE='./images/画面.drawio.svg'
OUTPUT_DIR='./images'
#OUTPUT_DIR='./output'

PAGES.each_with_index do |page, index|
  next if page[:skip]

  system ([DRAWIO_BIN, '-x', '-l 0,1,2', "-o #{OUTPUT_DIR}/#{page[:file_name]}", "-p #{index}", '-b 1', DRAWIO_FILE].join(" "))
end
