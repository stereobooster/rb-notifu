require 'rb-notifu'
require 'rspec'

describe Notifu do

  @result
  
  it "should work" do
    Notifu.show :time => 1 do |status|
      @result = status
    end
    sleep 1.5
    Notifu::ERRORS.include?(@result).should be_false
  end

  it "can be interupted by another instance" do
    @result = -1
    Notifu.show :time => 2 do |status|
      @result = status
    end
    sleep 0.5
    Notifu.show :time => 1
    sleep 0.5
    @result.should == Notifu::SUCCESS_NEW_INSTANCE
  end
  
end
