class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

   def update

    if @user.update(user_params)
      flash[:notice] = "you have updated user successfully."
    redirect_to user_path(@user)
    else
      render "edit"
    end
   end

  def index
    @users = User.all
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
