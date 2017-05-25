require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    subject { create(:comment) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :commentable }
    # it { is_expected.to validate_presence_of(:text) }
    # it { is_expected.to validate_presence_of(:status) }
    # it { is_expected.to belong_to(:creator).class_name('User') }

    # it { should define_enum_for(:status).with(valid_comment_statuses) }
  end
end
