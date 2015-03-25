require 'spec_helper'

describe Team do

  describe 'validation' do
    it { should validate_uniqueness_of(:name) }
  end


end