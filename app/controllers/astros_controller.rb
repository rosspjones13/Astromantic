class AstrosController < ApplicationController
  def index
    @astros = Astro.all
  end

  def show
    @astro = Astro.find_by_slug(params[:sign])
  end
end
