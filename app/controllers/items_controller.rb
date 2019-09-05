class ItemsController < ApplicationController
  def index
  end

  def show 
    @item = Item.new
  end


  def confirmation
    @personal_info = PersonalInfo.new
  end

  def new
    @image= Image.new
    @category = ["---"]#データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
         @category << parent.name
      end
    @item = Item.new
    @item.build_image
    @item.build_size
    @item.build_brand
    @item.build_delivery
    render layout: 'compact'
  end

  def create
    @item = current_user.items.build(item_params)
    @item.save
  end

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition,:price,image_attributes: [:image1,:image2,:id],size_attributes: [:id,:name],brand_attributes: [:id,:name],delivery_attributes: [:id,:fee,:area,:delivery_days])
  end
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
 end
 def get_category_grandchildren#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end
