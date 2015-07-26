class CommentsController < ApplicationController
	def create
		artcile = Article.find(params[:article_id])
		comment = artcile.comments.new(new_comment_param)
		if comment.save
			redirect_to article_path(artcile), notice: "Successfull"
		else
			redirect_to article_path(artcile), notice: "Fail"
		end
	end

	private
	def new_comment_param
		params.require(:comment).permit(:user_name, :message, :article_id)
	end
end


# flash = {
# 	notice: "Successfull",
# 	error: "success"
# }