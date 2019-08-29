class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
    
    render layout: 'compact'
  end
end
