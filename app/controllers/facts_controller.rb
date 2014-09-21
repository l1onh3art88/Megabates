
class FactsController < ApplicationController
	respond_to :html, :js
	before_filter :authenticate_user!, only: [:create]
	
	def create

		current_user = User.first
		@fact = current_user.facts.build(fact_params)	
		@new_fact = Fact.new
		authorize @fact
		if current_user.already_posted?(@fact.topic)
			 flash.keep[:error] = "You have already posted today, come back tomorrow to express your opinion"
		else
			if @fact.save
				flash.keep[:notice] = "Your opinion has been added."
			else
				flash.keep[:error] = "Error creating your opinion. Please Try Again."
			end
		end
		redirect_to root_url

	end


	def destroy
		@fact = Fact.find(params[:post_id])
		authorize @fact
		if @fact.destroy
			flash[:notice] = "Fact was removed."
		else
			flash[:error] = "Fact couldn't be removed. Please Try Again."
		end
		respond_with(@fact) do |format|
			format.html {redirect_to [@fact]}
		end
	end

	
	private

	def fact_params
		params.require(:fact).permit(:opinion, :citation, :lean, :topic_id)
	end
end
