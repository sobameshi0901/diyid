class StepsController < ApplicationController
  before_action :set_recipe
  def new
    @step = Step.new
  end

  def create
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
end
