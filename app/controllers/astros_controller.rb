class AstrosController < ApplicationController
  def index
    @astros = Astro.all
  end

  def show
    # raise ActiveRecord::RecordNotFound
    @astro = Astro.find_by_slug(params[:sign]) or not_found
  end
end
