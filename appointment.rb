class Appointment
  
  attr_reader :owner, :patient
  
  def initialize(details={})
    @patient = details[:patient]
    @owner = details[:owner]
  end
  
  def charge_for(treatment)
  end
  
  def total_due
  end
end