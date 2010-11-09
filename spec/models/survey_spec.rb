require 'spec_helper'

describe Survey do

  before(:all) do 
    Survey.create(:title => "test1")
    Survey.create(:title => "test2")
  end

  before(:each) do
    @count_before = Survey.all.size
  end

  it "adding a survey should add a survey :)" do
    Survey.create(:title => "testing")
    Survey.all.size.should == @count_before + 1
  end

  it "deleting a survey should delete a survey" do 
    if @count_before > 0
      Survey.first.destroy
      Survey.all.size.should == @count_before - 1
    end
  end


  # this test shows that some code has to be changed
  it "layout have to be chosen" do
    Survey.first.layout_id.should_not == nil
  end

end
