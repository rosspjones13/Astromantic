class AstrosController < ApplicationController
  def index
    @astros = Astro.all
  end

  def show
    @astro = Astro.find(params[:id])
  end
end
