class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/new
  def new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    create_new_item

    respond_to do |format|
      if @item.save
        format.html { redirect_to products_url, notice: 'Item added to your shopping list.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { redirect_to products_url, notice: 'Item not added. Its already on the list!' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      @item.update(item_params)
      format.html { redirect_to items_url, notice: 'Item was successfully updated.' }
      format.json { render :show, status: :ok, location: @item }
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def create_new_item
    @item = Item.new(new_item_params)
    @item.user_id = session[:user_id]
    @item.product_id = params[:product_id]
  end

  # Only allow a list of trusted parameters through.
  def new_item_params
    params.permit(:user_id, :product_id, :quantity)
  end

  def item_params
    params.require(:item).permit(:user_id, :product_id, :quantity)
  end
end
