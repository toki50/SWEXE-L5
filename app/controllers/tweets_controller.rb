class TweetsController < ApplicationController
def index
    @tweets = Tweet.all
    # ログイン中のユーザーを取得
    @user = User.find_by(uid: session[:login_uid]) if session[:login_uid]
  end



  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(
      message: params[:tweet][:message],
      user_id: 1
    )
    redirect_to tweets_path
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
end