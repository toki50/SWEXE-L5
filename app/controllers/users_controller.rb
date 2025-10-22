class UsersController < ApplicationController
  
  def main
    render "index"
  end
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 登録後にログイン状態にしてツイート一覧へ
      session[:login_uid] = @user.uid
      redirect_to tweets_path, notice: "登録完了しました！"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:uid, :password, :password_confirmation)
  end


 

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザーを削除しました"
  end

  

 
end 