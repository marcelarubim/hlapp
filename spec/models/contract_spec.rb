require 'rails_helper'

RSpec.describe Contract, type: :model do
  describe 'validations' do
    subject { create(:contract) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :client }
    xit { is_expected.to have_many(:comments) }
    xit { is_expected.to have_many(:services) }
    xit { is_expected.to have_many(:productions) }
    xit { is_expected.to have_many(:ops) }
    xit { is_expected.to have_many(:spots) }
    xit { is_expected.to belong_to(:creator).class_name('User') }
    xit { is_expected.to validate_presence_of(:date) }
    xit { is_expected.to validate_presence_of(:status) }
    xit { is_expected.to validate_presence_of(:archiving_status) }
    xit { is_expected.to validate_presence_of(:renewal_date) }
    xit { is_expected.to validate_presence_of(:language) }

    # it { should define_enum_for(:status).with(valid_contract_statuses) }
    # it { should define_enum_for(:category).with(valid_contract_categories) }
    # it { should define_enum_for(:archiving_status).with(valid_contract_arch_statuses) }
    # it { should define_enum_for(:narrator_type).with(valid_contract_narrator_types) }

    # it 'has #5 comments' do
    #   expect(subject.comments.count).to eq 5
    # end
    # it 'has tt_prod_contracted services' do
    #   expect(subject.services.count).to eq subject.tt_prod_contracted
    # end
    # it 'has tt_prod_contracted ops' do
    #   expect(subject.ops.count).to eq subject.tt_prod_contracted
    # end
    # it 'has tt_points_contracted spots' do
    #   expect(subject.spots.count).to eq subject.tt_points_contracted
    # end

    # context 'for cancellation date' do
    #   it 'it has to be greater than date' do
    #     expect(
    #       build(:contract, date: Date.today, cancellation_date: Date.yesterday,
    #                        cancellation_reason: 'reason')
    #     ).to_not be_valid
    #   end
    #   it 'only can be saved if has also a cancellation reason' do
    #     expect(
    #       build(:contract, cancellation_date: Date.tomorrow, cancellation_reason: nil)
    #     ).to_not be_valid
    #   end
    #   context 'for cancellation reason' do
    #     it 'cannot be blank' do
    #       expect(
    #         build(:contract, cancellation_date: Date.tomorrow, cancellation_reason: '')
    #       ).to_not be_valid
    #     end
    #   end
    # end
  end
end
