class Appointment
  
  attr_reader :owner, :patient
  
  def initialize(details={})
    @patient = details[:patient]
    @owner = details[:owner]
    @treatments = []
    @payment = 0
  end
  
  def charge_for(treatment)
    @treatments << treatment
  end
  
  def total_due
    @treatments.inject(0) { |total, treatment| total += treatment.cost } - @payment
  end
  
  def make_cash_payment
    @payment = total_due
  end
end