require 'test/unit'
require 'appointment'
require 'treatment'

EXPECTED_RECEIPT = """
Customer: Dave Atkins

Services:
  Routine check-up (fluffy): £5
  Rabies vaccination (fluffy): £10
  ---
  Total: £15

Paid cash £15

Received with thanks.

"""

describe Appointment do
  include Test::Unit::Assertions
  
  let(:appointment) { Appointment.new(:owner => 'Dave Atkins', :patient => 'fluffy') }
  let(:a_treatment) { Treatment.new(:description => 'a treatment', :cost => 10.00) }
  
  it "is created with owner and patient" do
    assert_equal 'Dave Atkins', appointment.owner
    assert_equal 'fluffy', appointment.patient
  end
  
  it "charges for treatments" do
    appointment.charge_for(a_treatment)
    
    assert_equal 10.00, appointment.total_due
  end
  
  it "settles charges with cash" do
    appointment.charge_for(a_treatment)
    
    appointment.make_cash_payment
    
    assert_equal 0, appointment.total_due
  end
  
  it "prints a receipt" do
    a_checkup = Treatment.new(:description => "Routine check-up", :cost => 5.00)
    a_rabies_vaccination = Treatment.new(:description => "Rabies vaccination", :cost => 10.00)
    
    appointment.charge_for(a_checkup)
    appointment.charge_for(a_rabies_vaccination)
    
    appointment.make_cash_payment
    
    assert_equal EXPECTED_RECEIPT, appointment.print_receipt
  end
  
end
