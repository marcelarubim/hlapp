# .nodoc. #
module FormHelper
  def setup_productions(service)
    service.productions.new
    service.productions
  end
end
