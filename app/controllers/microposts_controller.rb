class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :show]
  before_filter :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path
  end

  def show
    @micropost = Micropost.find(params[:id])
    @user = User.find(@micropost.user_id)
    @comments = @micropost.comments.paginate(page: params[:page], per_page: 10)
    if @micropost.content.length > 10
      @title = @micropost.content[0...10] + "..."
    else
      @title = @micropost.content
    end
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end