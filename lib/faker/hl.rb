require 'faker'
module Faker
  # .nodoc. #
  class HL < Base
    class << self
      def service
        fetch('hl.service')
      end

      def product
        fetch('hl.product')
      end

      def variation
        fetch('hl.variation')
      end
    end
  end
end
