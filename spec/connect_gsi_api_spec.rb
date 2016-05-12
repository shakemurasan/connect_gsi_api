require 'spec_helper'

describe ConnectGsiApi do
  it 'has a version number' do
    expect(ConnectGsiApi::VERSION).not_to be nil
  end

  describe '.distance2p' do
    let(:lat1) { 35.689166 }
    let(:lng1) { 139.704444 }
    let(:lat2) { 35.654444 }
    let(:lng2) { 139.706666 }
    let(:exp)  { false }
    subject { ConnectGsiApi.distance2p(lat1, lng2, lat2, lng2, exp) }

    context 'valid parameter' do
      it 'return a distance' do
        expect(subject).to eq 3852.099
      end
    end

    context 'invalid parameter' do
      let(:lng2) { 'hogehoge' }
      context 'expect return nil' do
        it { expect(subject).to be_nil }
      end

      context 'expect raise exception' do
        let(:exp) { true }
        it { expect{subject}.to raise_error(ConnectGsiApiException) }
      end
    end
  end
end
