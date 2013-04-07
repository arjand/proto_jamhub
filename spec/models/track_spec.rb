require 'spec_helper'

describe Track do
  it {should validate_presence_of :title}

  it {should allow_mass_assignment_of :title}
  it {should allow_mass_assignment_of :description}
  it {should allow_mass_assignment_of :user_id}
  it {should allow_mass_assignment_of :tag}
  it {should have_many :compilations}
  it {should have_many(:songs).through(:compilations)}
end
