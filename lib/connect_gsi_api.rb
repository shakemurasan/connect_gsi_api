require "connect_gsi_api/version"
require 'json'
require 'open-uri'

API_URL = "http://vldb.gsi.go.jp/sokuchi/surveycalc/"
BL2ST_CALC = "surveycalc/bl2st_calc.pl?"

module ConnectGsiApi
  def self.distance2p(lat1, lng1, lat2, lng2, ellipsoid = "bessel")
    req_params = {
        outputType: 'json',    # 出力タイプ
        ellipsoid:  ellipsoid, # 楕円体
        latitude1:  lat1.to_s, # 出発点緯度
        longitude1: lng1.to_s, # 出発点経度
        latitude2:  lat2.to_s, # 到着点緯度
        longitude2: lng2.to_s  # 到着点経度
    }
    result = connect_gsi_api(API_URL + BL2ST_CALC, req_params)
    result["OutputData"]["geoLength"].to_f
  rescue
    nil
  end

  private

  def self.join_params(params)
    params.map { |k, v| "#{k}=#{v}" }.join("&")
  end

  def self.connect_gsi_api(api_path, params)
    JSON.parse(open(api_path + join_params(params)).read)
  end
end
