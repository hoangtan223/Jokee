class JokesController < ApplicationController
	include JokesHelper

	def index
		if (!cookies[:voted_jokes].blank?)
			voted_joke_id = cookies[:voted_jokes].split(',')

			@joke = Joke.where.not(id: voted_joke_id).take 
		else
			@joke = Joke.first
		end
	end

	def like
		voted_joke =Joke.find(params[:id])
		voted_joke.likes += 1
		voted_joke.save

		SaveJokeToCookie(voted_joke.id)

		if (!cookies[:voted_jokes].blank?)
			voted_joke_id = cookies[:voted_jokes].to_s.split(',')
			@joke = Joke.where.not(id: voted_joke_id).take 
		end

		respond_to do |format|
			format.json {render json: @joke }
		end
	end

	def dislike
		voted_joke =Joke.find(params[:id])
		voted_joke.dislikes += 1
		voted_joke.save

		SaveJokeToCookie(voted_joke.id)

		if (!cookies[:voted_jokes].blank?)
			voted_joke_id = cookies[:voted_jokes].to_s.split(',')
			@joke = Joke.where.not(id: voted_joke_id).take 
		end

		respond_to do |format|
			format.json {render json: @joke }
		end
	end

end
