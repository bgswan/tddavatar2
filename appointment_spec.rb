require 'spec/test/unit'

describe Appointment do
  
  let(:appointment) { Appointment.new(:owner => 'Dave Atkins', :patient => 'fluffy') }
  
  it "is created with owner and patient" do
    assert_equal 'Dave Atkins', appointment.patient
    assert_equal 'fluffy', appointment.owner
  end
  
  it "charges for treatments"
  
  it "settles charges with cash"
  
  it "prints a receipt"
  
end