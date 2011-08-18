class SearchController < ApplicationController
  respond_to :html
  
  def index
    @base = params[:base]
    @q = params[:q]
    if @base == 'items'
      @results = Item.search(@q).page params[:page]
    elsif @base == 'parts'
      @results = Part.search(@q).page params[:page]
    else
      @results = Customer.search(@q).page params[:page]
    end
    respond_with(@results)
  end

end
