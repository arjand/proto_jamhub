require 'spec_helper'

describe Compilation do

  it {should validate_presence_of :track_id}
  it {should validate_presence_of :song_id}

  it {should allow_mass_assignment_of :track_id}
  it {should allow_mass_assignment_of :song_id}

  it {should belong_to :track}
  it {should belong_to :song}
  
end