require 'rb-notifu'
require 'rspec'

describe RbNotifu do

  @result
  
  it "should work" do
    RbNotifu.show :display => 1000 do |status|
      @result = status
    end
    sleep 1.5
    RbNotifu::ERRORS.include?(@result).should be_false
  end

  it "can be interupted by another instance" do
    @result = -1
    RbNotifu.show :display => 2000 do |status|
      @result = status
    end
    sleep 0.5
    RbNotifu.show :display => 1000
    sleep 0.5
    @result.should == RbNotifu::SUCCESS_NEW_INSTANCE
  end
  
end
