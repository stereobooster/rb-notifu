require 'rb-notifu'
require 'rspec'

describe RbNotifu do

  @result
  
  it "should work" do
    @result = RbNotifu.show :display => 1000
    @result.should_not == 1
    @result.should_not == 5
    @result.should_not == 256
  end

  it "can be intrupted by another instance" do
    @result = -1
    Thread.new { @result = RbNotifu.show :display => 2000 }
    sleep 0.5
    RbNotifu.show :display => 1000
    @result.should == 8
  end
  
end
