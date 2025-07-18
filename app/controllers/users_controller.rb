class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end