require 'spec_helper'

describe Status do

  describe 'validation' do
    it 'should accept status with less or equal to 255 characters' do
      Status.new(content: "a").should be_valid
      s = ""
      255.times{ |i| s += "a" }
      Status.new(content: s).should be_valid
    end

    it 'should not accept status with more than 255 characters' do
      s = ""
      256.times{ |i| s += "a" }
      Status.new(content: s).should_not be_valid
    end

  end

end
