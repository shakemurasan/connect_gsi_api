require "connect_gsi_api/version"
require 'json'
require 'open-uri'

API_URL = "http://vldb.gsi.go.jp/sokuchi/surveycalc/"
BL2ST_CALC = "surveycalc/bl2st_calc.pl?"

class ConnectGsiApiException < StandardError; end

module ConnectGsiApi
  def self.distance2p(lat1, lng1, lat2, lng2, exp = false, ellipsoid = "bessel")
    req_params = {
        outputType: 'json',    # 出力タイプ
        ellipsoid:  ellipsoid, # 楕円体
        latitude1:  lat1.to_s, # 出発点緯度
        longitude1: lng1.to_s, # 出発点経度
        latitude2:  lat2.to_s, # 到着点緯度
        longitude2: lng2.to_s  # 到着点経度
    }
    result = JSON.parse(open(API_URL + BL2ST_CALC + join_params(req_params)).read)
    result["OutputData"]["geoLength"].to_f
  rescue => e
    raise ConnectGsiApiException, "#{e}" if exp
    nil
  end

  private
  def self.join_params(params)
    params.map { |k, v| "#{k}=#{v}" }.join("&")
  end
end
