class CommentsController < ApplicationController
  before_filter :correct_user

  def create
  	@micropost = Micropost.find(params[:comment][:micropost_id])
  	@content = params[:comment][:content]
  	begin
	  	current_user.create_comment!(@micropost, @content)
	rescue
		flash[:error] = "Content of the comment can't be blank"
	end
		redirect_to request.referer
  end

  private

    def correct_user
      @user = User.find(params[:comment][:user_id])
      redirect_to(root_path, notice: "Sorry! That was an unauthorized action") unless current_user?(@user)
    end
end
