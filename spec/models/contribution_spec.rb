require 'spec_helper'

describe Contribution do

  # it {should validate_presence_of :user}
  # it {should validate_presence_of :song}

  it {should allow_mass_assignment_of :user_id}
  it {should allow_mass_assignment_of :song_id}

  it {should belong_to :user}
  it {should belong_to :song}
  

end