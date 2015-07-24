class CataloguesController < ApplicationController
  def new
    @catalogue = Catalogue.new
  end

  def create
    @catalogue = Catalogue.create( catalogue_params )
    Spawnling.new do
      PdfConverter.convert(@catalogue.id)
    end
    redirect_to new_catalogues_path
  end

  def show
    @catalogue = Catalogue.find params[:id]
  end

  private 
  def catalogue_params
    params.require(:catalogue).permit(:pdf)
  end
end