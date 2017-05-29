require 'rails_helper'

RSpec.describe ClientCategory, type: :model do
  describe 'validations' do
    subject { create(:client_category) }

    it { is_expected.to be_valid }
    it { is_expected.to have_many(:clients) }
    # it { is_expected.to accept_nested_attributes_for(:clients) }
    # it { is_expected.to belong_to(:creator).class_name('User') }

    # context 'name' do
    #   it { is_expected.to validate_presence_of(:name) }
    #   it do
    #     is_expected.to validate_uniqueness_of(:name).case_insensitive
    #       .scoped_to(:sector)
    #   end
    #   it { is_expected.to allow_value('Two Names').for(:name) }
    #   ['T#ste', '@', '!,', ';', ':', 'a' * 256, 0.5, '0,5', '-a'].each do |invalid_name|
    #     it { is_expected.to_not allow_value(invalid_name).for(:name) }
    #   end
    #   it 'requires downcase an name before saving' do
    #     category = create(:category)
    #     category.name = 'NAME'
    #     expect(category.save).to be true
    #     expect(category.name).to eq('name')
    #   end
    # end

    # context 'sector' do
    #   it { is_expected.to validate_presence_of(:sector) }
    #   it { is_expected.to allow_value('Two sectors').for(:sector) }
    #   ['T#ste', '@', '!,', ';', ':', 'a' * 256, 0.5, '0,5', '-a'].each do |invalid_sector|
    #     it { is_expected.to_not allow_value(invalid_sector).for(:sector) }
    #   end
    #   it 'requires downcase an sector before saving' do
    #     category = create(:category)
    #     category.sector = 'SECTOR'
    #     expect(category.save).to be true
    #     expect(category.sector).to eq('sector')
    #   end
    # end
  end

  # describe '#display' do
  #   let(:category) { create(:category, name: 'name', sector: 'sector') }
  #   it 'should show Name - Sector for a category titleize' do
  #     expect(category.display).to eq 'Name - Sector'
  #   end
  # end
end
