class Appointment
  
  attr_reader :owner, :patient
  
  def initialize(details={})
    @patient = details[:patient]
    @owner = details[:owner]
  end
end