require 'spec/test/unit'
require 'appointment'
require 'treatment'

describe Appointment do
  
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
  
  it "prints a receipt"
  
end