class AstrosController < ApplicationController

  before_action :get_astro, only: %w(show)

  def index
  end

  def show
  end

  private

  def get_astro
    @astro = Astro.find_by_slug(params[:sign])
  end
end
