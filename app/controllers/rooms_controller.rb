class RoomsController < ApplicationController
   before_action :logged_in_user, only: [:new, :create, :index, :destroy]
  def new
    @room = Room.new
  end
  def show
    @room = Room.find(params[:id])
  end
  def create
    @room = Room.new(room_params)    # 不是最终的实现方式
    if @room.save
      flash[:success] = "The room has been created"
      redirect_to @room
    else
      render 'new'
    end
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find_by_id(params[:id])
      if @room.update_attributes(room_params)
       if @room.status==true
          flash[:success] = "have booked"
          redirect_to @room
        else
          flash[:success] = "not booked "
          redirect_to @room
       end
    else
      render 'edit'
    end
  end
  
  def index
    @rooms = Room.paginate(page: params[:page])
  end
  
  
  def destroy
    Room.find(params[:id]).destroy
    flash[:success] = "Room deleted"
    redirect_to rooms_url
  end
  
  
  
  
  
  
  
  
  private

    def room_params
      params.require(:room).permit(:rommid, :build, :size, :status)
    end
    
    
    # 事前过滤器

    # 确保用户已登录
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
     # 确保是正确的用户
  def correct_user
      @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
  end
  
  # 确保是管理员
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
   
end
