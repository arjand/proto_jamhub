class ContributionsController < ApplicationController
  def create
    Contribution.create(params[:contribution])
  end
end