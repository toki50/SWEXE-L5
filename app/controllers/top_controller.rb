class TopController < ApplicationController
  def main
   render "login_form"
  end

  def login
        user=User.find_by(uid: params[:uid]) 

    # ユーザーが存在して、パスワードが一致する場合
    if user and user.autheticate(params[:pass]) and user.autheticate(params[:uid])
      session[:login_uid] = params[:uid]
      redirect_to tweets_path
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to tweets_path
  end
end
