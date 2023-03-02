class SearchesController < ApplicationController

  def seach
    @range = params[:range]

    if @range == "User"
      @user = User.looks(params[:search], params[:word])
    else
      @looks = Book.looks(params[:search], params[:word])
    end
  end
end
