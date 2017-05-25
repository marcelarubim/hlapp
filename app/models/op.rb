# .nodoc. #
class Op < ApplicationRecord
  belongs_to :contract
  belongs_to :solicitant, class_name: 'Contact'
  belongs_to :text_approver, class_name: 'User'
  belongs_to :comun_executor, class_name: 'User'
  belongs_to :studio_executor, class_name: 'User'
  belongs_to :editor, class_name: 'User'
  has_many :productions
  has_many :op_flows, dependent: :destroy
end
