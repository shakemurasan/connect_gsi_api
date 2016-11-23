require 'spec_helper'

describe ConnectGsiApi do
  it 'has a version number' do
    expect(ConnectGsiApi::VERSION).not_to be nil
  end

  describe '.distance2p' do
    before do
      allow(ConnectGsiApi).to receive(:connect_gsi_api).with(api_path, valid_params).and_return(result)
      allow(ConnectGsiApi).to receive(:connect_gsi_api).with(api_path, invalid_params).and_return(nil)
    end

    let(:api_path) { "http://vldb.gsi.go.jp/sokuchi/surveycalc/surveycalc/bl2st_calc.pl?" }
    let(:valid_params) {
      {
          outputType: "json",
          ellipsoid:  "bessel",
          latitude1:  lat1.to_s,
          longitude1: lng1.to_s,
          latitude2:  lat2.to_s,
          longitude2: "139.706666"
      }
    }
    let(:invalid_params) {
      {
          outputType: "json",
          ellipsoid:  "bessel",
          latitude1:  lat1.to_s,
          longitude1: lng1.to_s,
          latitude2:  lat2.to_s,
          longitude2: "hogehoge"
      }
    }
    let(:result) { { "OutputData" => { "geoLength" => 3852.099 } } }

    let(:lat1) { 35.689166 }
    let(:lng1) { 139.704444 }
    let(:lat2) { 35.654444 }
    let(:lng2) { 139.706666 }
    subject { ConnectGsiApi.distance2p(lat1, lng1, lat2, lng2) }

    context 'valid parameter' do

      it 'return a distance' do
        is_expected.to eq 3852.099
      end
    end

    context 'invalid parameter' do
      let(:lng2) { 'hogehoge' }
      context 'expect return nil' do
        it { is_expected.to be_nil }
      end
    end
  end
end
