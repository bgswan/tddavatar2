require 'test/unit'
require 'treatment'

describe Treatment do
  include Test::Unit::Assertions

  let(:treatment) { Treatment.new(:description => 'a treatment', :cost => 20.00) }

  it "is created with a description and cost" do
    assert_equal 'a treatment', treatment.description
    assert_equal 20.00, treatment.cost
  end
end
