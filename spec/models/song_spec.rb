require 'spec_helper'

describe Song do
  it {should validate_presence_of :title}
  # it {should validate_presence_of :text}
  #it {should validate_presence_of :genre_id}

  it {should allow_mass_assignment_of :title}
  it {should allow_mass_assignment_of :description}
  # it {should allow_mass_assignment_of :genre_id}

  it {should have_many(:contributions)}
  it {should have_many(:users).through(:contributions)}
  it {should have_many(:classifications)}
  it {should have_many(:genres).through(:classifications)}
  
end