class SearchController < ApplicationController
  respond_to :html
  
  def index
    @base = params[:base]
    @q = params[:q]
    if @base == 'items'
      @results = Item.search(@q)
    else
      @results = Part.search(@q)
    end
    respond_with(@results)
  end

end
