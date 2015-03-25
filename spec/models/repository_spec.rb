require 'spec_helper'

describe Repository do
  it { should validate_presence_of(:link) }
  it { should validate_uniqueness_of(:link) }
  it { should allow_value('http://github.com/mariomainz/devcon3-teams.git').for(:link) }
  it { should allow_value('https://github.com/mariomainz/devcon3-teams.git').for(:link) }
  it { should_not allow_value('smtp://github.com/mariomainz/devcon3-teams.git').for(:link) }
end
