require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    subject { create(:client) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:business_name) }
    it { is_expected.to validate_presence_of(:legal_name) }
    it { is_expected.to validate_presence_of(:cnpj) }
    it { is_expected.to have_many(:contracts) }
    xit { is_expected.to belong_to :category }
    xit { is_expected.to belong_to(:seller).class_name('User') }
    xit { is_expected.to belong_to(:captured_by).class_name('User') }
    xit { is_expected.to belong_to(:telemarketing).class_name('User') }
    xit { is_expected.to belong_to(:creator).class_name('User') }
    xit { is_expected.to have_many(:addresses).dependent(:destroy) }
    xit { is_expected.to have_many(:contacts) }
    xit { is_expected.to have_many(:spots).through(:contracts) }
    xit { is_expected.to have_many(:ops).through(:contracts) }
    xit { is_expected.to have_many(:productions).through(:ops) }

    it 'has #5 contracts' do
      expect(subject.contracts.count).to eq 5
    end

  #   it 'has #3 contacts' do
  #     expect(subject.contacts.count).to eq 3
  #   end

  #   context 'cnpj' do
  #     it { is_expected.to validate_presence_of(:cnpj) }
  #     invalid_cnpjs.each do |invalid_cnpj|
  #       it { is_expected.to_not allow_value(invalid_cnpj).for(:cnpj) }
  #     end
  #     it { is_expected.to allow_value('10010010010011').for(:cnpj) }
  #     it 'doesnt allow duplicated values' do
  #       client = create(:client)
  #       expect(build(:client, cnpj: client.cnpj)).to_not be_valid
  #     end
  #   end
  #   context 'telephone and fax numbers' do
  #     it { is_expected.to validate_presence_of(:telephone) }
  #     invalid_phones.each do |invalid_phone|
  #       it { is_expected.to_not allow_value(invalid_phone).for(:telephone) }
  #       it { is_expected.to_not allow_value(invalid_phone).for(:fax) }
  #     end
  #     valid_phones.each do |valid_phone|
  #       it { is_expected.to allow_value(valid_phone).for(:telephone) }
  #       it { is_expected.to allow_value(valid_phone).for(:fax) }
  #     end
  #   end

  #   context 'month of anniversary' do
  #     [0, -1, 13, 'test', 0.5].each do |invalid_month|
  #       it { is_expected.to_not allow_value(invalid_month).for(:month_anniversary) }
  #     end
  #     [1, 12, ''].each do |valid_month|
  #       it { is_expected.to allow_value(valid_month).for(:month_anniversary) }
  #     end
  #   end

  #   context 'referrer' do
  #     ['T_adas', '###00', 'Name@'].each do |invalid_referrer|
  #       it { is_expected.to_not allow_value(invalid_referrer).for(:referrer) }
  #     end
  #     ['Name', 'Commposed-Name', 'Two Names', ''].each do |valid_referrer|
  #       it { is_expected.to allow_value(valid_referrer).for(:referrer) }
  #     end
  #   end

  #   context 'website' do
  #     ['www.n@me.com', 'http://www.na_me.co.br', 'https://www.n@me.com.br/teste/teste',
  #      'https://www.name.com.br//', 'name.com/a/', 'name.com .%br', 'n@me',
  #      'n.com', 'www.n@.co.br'].each do |invalid_website|
  #       it { is_expected.to_not allow_value(invalid_website).for(:website) }
  #     end
  #     ['www.name.com.br', 'www.name.com/br', 'https://www.domina422io.com.br/tes.te',
  #      'na.co/a', 'na.com.br.edu.oer/gtr/asd', 'name.com', '',
  #      'http://ko.co/rox_ane'].each do |valid_website|
  #       it { is_expected.to allow_value(valid_website).for(:website) }
  #     end
  #   end
  # end

  # describe '#search' do
  #   let(:client) { create(:client) }
  #   let(:user_match) { Client.where(id: client.id) }
  #   context 'should find client' do
  #     it 'by business_name' do
  #       expect(Client.search(client.business_name)).to match_array(user_match)
  #     end
  #     it 'by cnpj' do
  #       expect(Client.search("cnpj:#{client.cnpj}")).to match_array(user_match)
  #     end
  #   end
  end
end
