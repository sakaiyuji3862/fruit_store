class CommentsController < ApplicationController
    def create
        comment = Comment.create(comment_params)
        redirect_to "/tweets/#{comment.tweet.id}"
    end

    def destroy
        comment = Comment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
        redirect_to tweet_path(comment.tweet.id)
    end

    private

    def comment_params
        params.require(:comment).permit(:text).merge(user_id: current_user.id,
                                                     tweet_id: params[:tweet_id])
    end
end
