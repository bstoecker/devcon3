require 'spec_helper'

describe Topic do

  it {
    should ensure_inclusion_of(
      :post_type
    ).in_array(Topic.post_types)
  }

  specify do 
    Topic.post_types.each do |t|
      %w[Info Discussion Question].should include(t)
    end
  end

end
