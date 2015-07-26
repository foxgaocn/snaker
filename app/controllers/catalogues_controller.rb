class CataloguesController < ApplicationController
  def new
    @catalogue = Catalogue.new
  end

  def create
    @catalogue = Catalogue.new( catalogue_params )
    if @catalogue.save
      Spawnling.new do
        PdfConverter.convert(@catalogue.id)
      end
      redirect_to processing_catalogue_path(@catalogue.id)
    else
      render plain: "出错了"
    end
  end

  def show
    @catalogue = Catalogue.find params[:id]
  end

  def processing
    @id = params[:id]
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