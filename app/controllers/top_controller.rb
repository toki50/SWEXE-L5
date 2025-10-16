class TopController < ApplicationController
  def main
   render "login_form"
  end

  def login
        user = User.find_by(uid: params[:uid])

    # ユーザーが存在して、パスワードが一致する場合
    if user && user.pass == params[:pass]
      session[:login_uid] = user.uid
      redirect_to tweets_path
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to tweets_path
  end
end
