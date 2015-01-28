# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150128145008) do

  create_table "airlines", force: true do |t|
    t.string   "name"
    t.string   "iata"
    t.string   "icao"
    t.string   "flight_radar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "airplanes_count"
  end

  create_table "airplanes", force: true do |t|
    t.integer  "airline_id"
    t.string   "registration_code"
    t.string   "mode_s"
    t.string   "plane_type_code"
    t.string   "plane_type"
    t.string   "s_n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "annual_income_statements", force: true do |t|
    t.integer  "company_id"
    t.string   "currency"
    t.datetime "period"
    t.decimal  "xiao_shou_shou_ru"
    t.decimal  "she_kou_ji_kou_jian"
    t.decimal  "zhu_yao_ye_wu_de_jing_shou_ru"
    t.decimal  "shou_chu_huo_wu_cheng_ben"
    t.decimal  "xiao_shou_shui_ji_qi_ta_fei_yong"
    t.decimal  "zhu_yao_ye_wu_li_run"
    t.decimal  "qi_ta_ye_wu_shou_ru"
    t.decimal  "cun_huo_die_jia_sun_shi"
    t.decimal  "ye_wu_kai_zhi"
    t.decimal  "hang_zheng_kai_zhi"
    t.decimal  "cai_wu_kai_zhi"
    t.decimal  "qi_jian_kai_zhi"
    t.decimal  "gou_huo_kai_zhi"
    t.decimal  "hui_dui_shou_yi_huo_sun_shi"
    t.decimal  "jing_ying_li_run"
    t.decimal  "tou_zi_shou_ru"
    t.decimal  "qi_huo_shou_yi_ji_sun_shi"
    t.decimal  "bu_tie_shou_ru"
    t.decimal  "fei_ying_yun_shou_ru"
    t.decimal  "guo_wang_nian_du_de_shou_ru_diao_zheng"
    t.decimal  "fei_ying_yun_kai_zhi"
    t.decimal  "fei_ying_yun_jing_shou_ru"
    t.decimal  "fen_pei_yu_qi_ta_gong_si_de_li_run"
    t.decimal  "shang_nian_li_de_shui_diao_zheng"
    t.decimal  "zong_li_run"
    t.decimal  "li_de_shui"
    t.decimal  "shao_shu_li_yi"
    t.decimal  "fu_shu_gong_si_kui_sun"
    t.decimal  "ying_fu_zhuan_xiang_ji_jin"
    t.decimal  "hua_hong_ji_fu_li_ji_jin"
    t.decimal  "he_bing_li_run"
    t.decimal  "bu_ming_tou_zi_sun_shi"
    t.decimal  "li_de_shui_tui_hai"
    t.decimal  "bu_ying_you_mu_gong_si_cheng_dan_de_fu_shu_gong_si_sun_shi"
    t.decimal  "fu_shu_gong_si_shou_ru_di_xiao_chao_e_chi_zi"
    t.decimal  "jing_li_run"
    t.decimal  "qi_chu_wei_fen_pei_li_run"
    t.decimal  "qi_ta_zhuan_ru"
    t.decimal  "zhuan_zi_ying_yu_chu_bei"
    t.decimal  "qi_chu_wei_fen_pei_li_run_diao_zheng"
    t.decimal  "jian_shao_zhu_ce_zi_ben_jian_di_wei_fen_pei_li_run"
    t.decimal  "hui_dui_chu_bei"
    t.decimal  "te_bie_xiang_mu_diao_zheng"
    t.decimal  "gong_si_cheng_li_qian_de_li_run_fen_pei"
    t.decimal  "xun_huan_fang_wu_ji_jin"
    t.decimal  "ke_zuo_gu_xi_de_li_run"
    t.decimal  "fen_pei_fa_ding_ying_yu_chu_bei"
    t.decimal  "fen_pei_fa_ding_fu_li_ji_jin"
    t.decimal  "ti_qu_yuan_gong_jiang_li_ji_fu_li_ji_jin"
    t.decimal  "fen_pei_chu_bei_ji_jin"
    t.decimal  "fen_pei_qi_ye_kuo_zhan_ji_jin"
    t.decimal  "ke_gong_fen_pei_yu_gu_dong_de_li_run"
    t.decimal  "you_xian_gu_ying_fu_gu_xi"
    t.decimal  "fen_pei_qi_ta_ying_yu_chu_bei"
    t.decimal  "fen_pei_pu_tong_gu_gu_xi"
    t.decimal  "jiang_pu_tong_gu_gu_xi_zhuan_huan_cheng_gu_piao"
    t.decimal  "wei_fen_pei_li_run"
    t.decimal  "qi_zhi_bu_men_huo_tou_zi_qi_ye"
    t.decimal  "zi_ran_zai_hai_zao_cheng_de_kui_sun"
    t.decimal  "hui_ji_zheng_ce_bian_geng_dao_zhi_zeng_jia_zong_li_run"
    t.decimal  "hui_ji_gu_ji_bian_geng_dao_zhi_zeng_jia_zong_li_run"
    t.decimal  "zhai_wu_zhong_zu_kui_sun"
    t.decimal  "qi_ta"
    t.decimal  "ying_yun_kai_zhi"
    t.decimal  "zi_chan_jian_zhi_kui_sun"
    t.decimal  "gong_yun_jia_zhi_bian_dong_jing_shou_yi"
    t.decimal  "guan_lian_shi_ti_de_tou_zi_shou_ru"
    t.decimal  "qi_ta_ying_xiang_li_run_de_xiang_mu"
    t.decimal  "qi_zhi_fei_liu_dong_zi_chan_de_jing_sun_shi"
    t.decimal  "qi_ta_ying_xiang_zong_li_run_de_xiang_mu"
    t.decimal  "qi_ta_ying_xiang_jing_li_run_de_xiang_mu"
    t.decimal  "gui_shu_yu_mu_gong_si_de_jing_ying_li"
    t.decimal  "mei_gu_ji_ben_ying_li"
    t.decimal  "mei_gu_tan_bao_ying_li"
    t.decimal  "kan_tan_kai_zhi"
    t.decimal  "qi_ta_ying_xiang_xiao_shou_shou_ru_de_xiang_mu"
    t.decimal  "qi_ta_ying_xiang_shou_chu_huo_wu_cheng_ben_de_xiang_mu"
    t.decimal  "gui_shu_yu_shao_shu_gu_dong_quan_yi_de_zong_li_run"
    t.decimal  "he_bing_qian_bei_shou_gou_gong_si_de_li_run"
    t.decimal  "qi_ta_liu_cun_li_run_xiang_mu"
    t.decimal  "zong_xiao_shou_shou_ru"
    t.decimal  "zong_shou_chu_huo_wu_cheng_ben"
    t.decimal  "lei_ji_qi_ta_zong_he_shou_ru"
    t.decimal  "zong_he_shou_ru_zong_e"
    t.decimal  "gui_shu_yu_mu_gong_si_de_zong_li_run"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "annual_income_statements", ["company_id", "period"], name: "index_annual_income_statements_on_company_id_and_period"
  add_index "annual_income_statements", ["company_id"], name: "index_annual_income_statements_on_company_id"
  add_index "annual_income_statements", ["period"], name: "index_annual_income_statements_on_period"

  create_table "companies", force: true do |t|
    t.integer  "exchange_id"
    t.string   "symbol"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "daily_quotes", force: true do |t|
    t.datetime "date"
    t.decimal  "open"
    t.decimal  "high"
    t.decimal  "low"
    t.decimal  "close"
    t.integer  "volume"
    t.decimal  "adj_close"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "daily_quotes", ["company_id", "date"], name: "index_daily_quotes_on_company_id_and_date"
  add_index "daily_quotes", ["company_id"], name: "index_daily_quotes_on_company_id"
  add_index "daily_quotes", ["date"], name: "index_daily_quotes_on_date"

  create_table "employers", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "employer_id"
    t.string   "jobsdb_id"
    t.text     "position_about"
    t.string   "position_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "title"
    t.text     "address"
    t.string   "phonenumber"
    t.string   "pricerange"
    t.text     "tags"
    t.text     "acceptedpayment"
    t.integer  "seating"
    t.text     "intro"
    t.text     "description"
    t.string   "district_id"
    t.string   "cuisine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["cuisine_id"], name: "index_restaurants_on_cuisine_id"
  add_index "restaurants", ["district_id", "cuisine_id"], name: "index_restaurants_on_district_id_and_cuisine_id"
  add_index "restaurants", ["district_id"], name: "index_restaurants_on_district_id"

  create_table "tickers", force: true do |t|
    t.decimal  "mid"
    t.decimal  "bid"
    t.decimal  "ask"
    t.decimal  "last_price"
    t.decimal  "low"
    t.decimal  "high"
    t.decimal  "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "youtube_urls", force: true do |t|
    t.string   "title"
    t.string   "youtube_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "youtube_urls", ["youtube_code"], name: "index_youtube_urls_on_youtube_code"

end
