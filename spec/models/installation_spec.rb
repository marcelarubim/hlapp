require 'rails_helper'

RSpec.describe Installation, type: :model do
  describe 'validations' do
    subject { create(:installation) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :service }
    it { is_expected.to belong_to(:responsible).class_name('Contact') }
    it { is_expected.to have_one(:contract).through(:service) }
    it { is_expected.to have_many(:osts).dependent(:destroy) }
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }

    # it { is_expected.to have_one(:client) }
    # it { expect(subject.address).to_not be nil }
    # it { expect(subject.comments.count).to eq 3 }
    # it { is_expected.to belong_to(:creator).class_name('User') }
    # it { is_expected.to validate_presence_of(:code) }
    # it { is_expected.to validate_presence_of(:install_phone) }

    # xit { should define_enum_for(:status).with(valid_spot_statuses) }
    # xit { should define_enum_for(:equipment).with(valid_spot_equipments) }
    # xit { should define_enum_for(:guarantee_type).with(valid_spot_guarantee_types) }

    # it 'registered spots = active + inactive' do
    #   expect(subject.registered).to eq subject.inactive + subject.active
    # end
    # it_behaves_like 'date validation', 'briefing_date', 'text_delivery_date'
    # it_behaves_like 'date validation', 'text_delivery_date', 'text_approving_date'
  end
end
