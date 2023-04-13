class MoneyOrdersController < ApplicationController
  load_and_authorize_resource

  # default display all the existing money orders
  def index
    @money_order = MoneyOrder.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
  end

  # display the form to create a new money order
  def new
    @group = Group.find(params[:group_id])
    @money_order = MoneyOrder.new
    @money_order.author_id = current_user.id
  end

  # create a new money order
  def create
    @group = Group.find(params[:group_id])
    @money_order = @group.money_orders.build(money_order_params)
    if @money_order.save
      redirect_to group_money_orders_url(@group)
    else
      render 'new'
    end
  end

  private

  def money_order_params
    params.require(:money_order).permit(:name, :group_id, :author_id, :amount, :created_at)
  end
end
