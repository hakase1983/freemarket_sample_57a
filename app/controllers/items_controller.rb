class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render 'errors/error_404', status: :not_found
  end

  before_action :set_item,except:[:index,:edit,:update,:new,:show,:comfirmation,:create,:sellingitem]
  def index
    @items = Item.includes(:user)
  end

  def edit
  end
  
  def update
  end

  def show 
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
  end

  end

  def confirmation
    @personal_info = PersonalInfo.new
    render layout: 'compact'
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
    if @item.save
      redirect_to "/items/complete"
    else
      render :new
    end
  end
  def destroy
    @item.destroy if @item.user_id== current_user.id
    redirect_to user_path(current_user)
  end
  def complete
  end
  
  def detail
  end

  def sellingitem
    @items = Item.where(user_id: current_user.id)
  end
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition,:price,image_attributes: [:image1,:image2,:id],size_attributes: [:id,:name],brand_attributes: [:id,:name],delivery_attributes: [:id,:fee,:area,:delivery_days]).merge(seller_id: current_user.id)
  end
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  def get_category_grandchildren#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  def get_category_grandchildren#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  private
    def set_item
      @item = Item.find(params[:id])
    end

    
end
