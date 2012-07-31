class CommentsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:comment][:micropost_id])
  	@content = params[:comment][:content]
    @user = User.find(@micropost.user_id)
    @comments = @micropost.comments.paginate(page: params[:page], per_page: 10)
  	begin
	  	current_user.create_comment!(@micropost, @content)
  	rescue
  		flash[:error] = "Content of the comment can't be blank"
  	end
    redirect_to request.referer
  end

end
