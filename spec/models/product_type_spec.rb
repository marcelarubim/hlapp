require 'rails_helper'

RSpec.describe ProductType, type: :model do
  subject { create(:product_type) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
end
