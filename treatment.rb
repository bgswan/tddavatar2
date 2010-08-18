class Treatment
  
  attr_reader :description, :cost
  
  def initialize(details={})
    @description = details[:description]
    @cost = details[:cost]
  end
end