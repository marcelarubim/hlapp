require 'rails_helper'

RSpec.describe ServiceProductVariation, type: :model do
  describe 'validations' do
    subject { create(:service_product_variation) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :service_type }
    it { is_expected.to belong_to :product_type }
    it { is_expected.to belong_to :variation_type }
  end
end
