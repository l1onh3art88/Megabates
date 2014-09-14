class LikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :setup
  
  def create
    @like_manager.like!
    redirect_to :back
  end


  def destroy
    @like_manager.unlike!
    redirect_to :back
  end

  private

  def setup
    
    @fact = Fact.find(params[:fact_id])
    @like_manager = Likes.new(current_user, @fact)
  end

end