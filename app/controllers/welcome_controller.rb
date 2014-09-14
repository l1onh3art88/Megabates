class WelcomeController < ApplicationController
	def new
		@fact = Fact.new
		authorize @fact
	end

	def show
    @topic = Topic.first
		@fact = Fact.first
    @facts = Fact.all
	end
	
end
