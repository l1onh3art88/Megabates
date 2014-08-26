class WelcomeController < ApplicationController
	def new
		@fact = Fact.new
		authorize @fact
	end

	def show
		@fact = Fact.new
		@facts = Fact.all
	end
	
end
