require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    subject { create(:address) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :addressable }

    # it { is_expected.to validate_presence_of(:address) }
    # it { is_expected.to validate_presence_of(:num) }
    # it { is_expected.to validate_presence_of(:district) }
    # it { is_expected.to validate_presence_of(:city) }
    # it { is_expected.to validate_presence_of(:country) }
    # it { is_expected.to allow_value(nil).for(:complement) }
  end
end
