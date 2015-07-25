class CataloguesController < ApplicationController
  def new
    @catalogue = Catalogue.new
  end

  def create
    @catalogue = Catalogue.new( catalogue_params )
    binding.pry
    if @catalogue.save
      Spawnling.new do
        PdfConverter.convert(@catalogue.id)
      end
      render json: {id: @catalogue.id}, status: 201
    else
      render nothing: true, status: 400
    end
  end

  def show
    @catalogue = Catalogue.find params[:id]
  end

  def processed
    @catalogue = Catalogue.find params[:id]
    if(@catalogue.image_count.present?)
      render nothing: true, status: :ok
    else
      render nothing: true, status: 400
    end
  end

  private 
  def catalogue_params
    params.require(:catalogue).permit(:pdf, :url, :email)
  end
end