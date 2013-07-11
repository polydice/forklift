# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client::Gd do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
  end

  describe ".new", :vcr do
    it "is a Forklift::Client::Gd" do
      gd = Forklift::Client::Gd.new(@client, {"gd_id"=>"4464716", "zone_name"=>"", "substation_name"=>"鍵盤、滑鼠、喇叭", "cat_name"=>"強打活動", "catitem_name"=>"福利品專區", "gd_image"=>"http://rp1.monday.vip.tw1.yahoo.net/res/gdsale/st_pic/4464/st-4464716-s100.jpg", "gd_name"=>"【福利品出清】Wacom Intuos5 Touch繪圖板(8x13)-L", "gd_sdesc"=>"專用筆座•10 支替換筆尖（5 支標準筆尖、1 支彈性筆尖、1 支柔軟筆尖，與 3 支用力筆尖）•筆尖更換夾•彩色辨識環•2 公尺（6.6 英尺） USB 線", "gd_spechead"=>"數量有限，要買要快唷!!", "gd_price"=>"15100", "gd_brand"=>"", "gd_model"=>"", "gd_url"=>"http://buy.yahoo.com.tw/gdsale/gdsale.asp?gdid=4464716&act=gdsearch", "subcat_no"=>"83693", "cat_no"=>"9024", "sub_no"=>"408", "zone_no"=>"0"})
      expect(gd).to be_a Forklift::Client::Gd
    end
  end
end
