class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render 'errors/error_404', status: :not_found
  end

  before_action :set_item,except:[:index,:new,:show,:comfirmation,:create,:sellingitem,:complete,:get_category_children,:get_category_grandchildren,:edit_get_category_children,:edit_get_category_grandchildren]
  def index
    @items = Item.includes(:user)
  end

  def edit
    @category = ["---"]#データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).pluck(:name).each do |parent|
         @category << parent
      end
    render layout: 'compact'
  end
  
  def update
    if @item.user_id==current_user.id
      @item.update(item_params)
      redirect_to detail_item_path(@item.id)
    end
  end

  def show 
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
  end
  
  def confirmation
    @personal_info = PersonalInfo.new
    render layout: 'compact'
  end

  def new
    @category = ["---"]#データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).pluck(:name).each do |parent|
         @category << parent
      end
    @item = Item.new
    @item.images.build
    @item.build_size
    @item.build_brand
    @item.build_delivery
    render layout: 'compact'
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
        params[:images][:name].each do |image|
          @item.images.create(name: image, item_id: @item.id)
        end
      redirect_to "/items/complete"
    else
      @item.images.build
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
  def edit_get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  def edit_get_category_grandchildren#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  private
    def set_item
      @item = Item.find(params[:id])
    end  
end
