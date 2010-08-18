class Appointment
  
  attr_reader :owner, :patient
  
  def initialize(details={})
    @patient = details[:patient]
    @owner = details[:owner]
    @treatments = []
  end
  
  def charge_for(treatment)
    @treatments << treatment
  end
  
  def total_due
    @treatments.inject(0) { |total, treatment| total += treatment.cost }
  end
end