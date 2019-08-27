class ItemsController < ApplicationController
  def index
  end
  def new
    render layout: 'compact'
    @item = Item.new
  end
end
