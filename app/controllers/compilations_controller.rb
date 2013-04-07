class CompilationsController < ApplicationController
  def create
    Compilation.create(params[:compilation])
  end
end