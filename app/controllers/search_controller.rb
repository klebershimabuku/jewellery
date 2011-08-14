class SearchController < ApplicationController
  respond_to :html
  
  def index
    @base = params[:base]
    @q = params[:q]
    if @base == 'items'
      @results = Item.search(@q).page params[:page]
    else
      @results = Part.search(@q).page params[:page]
    end
    respond_with(@results)
  end

end
