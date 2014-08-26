class FactsController < ApplicationController
	respond_to :html, :js
	before_filter :authenticate_user!
	def create
		@fact = current_user.facts.build(fact_params)	
		@new_fact = Fact.new
		authorize @fact
		if @fact.save
			flash[:notice] = "Your opinion has been added."
		else
			flash[:error] = "Error creating your opinion. Please Try Again."
			
		end
		respond_with(@fact) do |format|
			format.html {redirect_to root_url}
		end
	end


	def destroy

	end
	private

	def fact_params
		params.require(:fact).permit(:opinion, :citation)
	end
end
