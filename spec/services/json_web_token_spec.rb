require 'rails_helper'

describe JsonWebToken do
  describe '::issuer' do
    it { expect(JsonWebToken.issuer).to eql('iMusics') }
  end

  describe '::algorithm' do
    it { expect(JsonWebToken.algorithm).to eql('HS256') }
  end

  describe '::secret' do
    it { expect(JsonWebToken.password).to eql(Rails.application.secrets.secret_key_base) }
  end

  describe '::encode' do
    it { expect(JsonWebToken.encode(user_id: 1).count('.')).to eql(2) }
    it { expect(JsonWebToken.encode({ user_id: 1 }).count('.')).to eql(2) }
  end

  describe '::decode' do
    context "when token is valid" do
      let(:time) { JsonWebToken.issued_at }
      let(:token) { JsonWebToken.encode(user_id: 1) }

      it { expect(JsonWebToken.decode(token)).to eql({ "user_id" => 1, "iat" => time, "iss" => JsonWebToken.issuer }) }
    end
  end
end
