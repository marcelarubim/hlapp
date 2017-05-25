require 'rails_helper'

RSpec.describe VariationType, type: :model do
  subject { create(:variation_type) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
end
