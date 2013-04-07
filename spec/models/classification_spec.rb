require 'spec_helper'

describe Classification do

  # it {should validate_presence_of :user}
  # it {should validate_presence_of :song}

  it {should allow_mass_assignment_of :song_id}
  it {should allow_mass_assignment_of :genre_id}

  it {should belong_to :song}
  it {should belong_to :genre}
  

end