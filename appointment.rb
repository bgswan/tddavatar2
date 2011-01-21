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
    total_charges - total_payments
  end
  
  def make_cash_payment
    @payment = total_due
  end
  
  def print_receipt
"""
Customer: #{@owner}

Services:
#{treatment_lines}
  ---
  Total: #{formatted(total_charges)}

Paid cash #{formatted(total_payments)}

Received with thanks.

"""
  end
  
private 

  def total_charges
    @treatments.inject(0) { |total, treatment| total += treatment.cost }
  end
  
  def total_payments
    @payment
  end
    
  def formatted(amount)
    "$%d" % amount
  end
  
  def treatment_lines
    @treatments.map { |treatment| "  #{treatment.description} (#{@patient}): #{formatted(treatment.cost)}" }.join("\n")
  end
end