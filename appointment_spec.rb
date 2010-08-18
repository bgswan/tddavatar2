require 'spec/test/unit'
require 'appointment'

describe Appointment do
  
  let(:appointment) { Appointment.new(:owner => 'Dave Atkins', :patient => 'fluffy') }
  
  it "is created with owner and patient" do
    assert_equal 'Dave Atkins', appointment.owner
    assert_equal 'fluffy', appointment.patient
  end
  
  it "charges for treatments"
  
  it "settles charges with cash"
  
  it "prints a receipt"
  
end