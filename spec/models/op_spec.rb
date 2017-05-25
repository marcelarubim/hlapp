require 'rails_helper'

RSpec.describe Op, type: :model do
  describe 'validations' do
    subject { create(:op) }
    it { is_expected.to be_valid }
    it { is_expected.to belong_to :contract }
    it { is_expected.to belong_to(:solicitant).class_name('Contact') }
    it { is_expected.to have_many(:productions) }
    it { is_expected.to have_many(:op_flows).dependent(:destroy) }
    it { is_expected.to belong_to(:text_approver).class_name('User') }
    it { is_expected.to belong_to(:comun_executor).class_name('User') }
    it { is_expected.to belong_to(:studio_executor).class_name('User') }
    it { is_expected.to belong_to(:editor).class_name('User') }
    # it { is_expected.to belong_to(:creator).class_name('User') }
    # it { is_expected.to validate_presence_of(:narrator) }
    # it { is_expected.to validate_presence_of(:language) }
    # it { is_expected.to validate_presence_of(:track) }

    # xit { should define_enum_for(:type).with(valid_op_types) }
    # xit { should define_enum_for(:process_phase).with(valid_op_process_phases) }
    # xit { should define_enum_for(:status).with(valid_op_statuses) }
    # xit { should define_enum_for(:priority).with(valid_op_priorities) }

    # it_behaves_like 'date validation', 'briefing_date', 'text_delivery_date'
    # it_behaves_like 'date validation', 'text_delivery_date', 'text_approving_date'
    # it_behaves_like 'date validation', 'text_approving_date', 'recording_date'
    # it_behaves_like 'date validation', 'recording_date', 'demo_delivery_date'
    # it_behaves_like 'date validation', 'demo_delivery_date', 'demo_approving_date'
    # it_behaves_like 'date validation', 'demo_approving_date', 'studio_release_date'
  end
end
