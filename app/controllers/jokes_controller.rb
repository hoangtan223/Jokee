class JokesController < ApplicationController
  def index
  	if (!cookies[:votedjokes].blank?)
  		voted_joke_id = cookies[:votedjokes].split(',')

  		@joke = Joke.where.not(id: voted_joke_id).take 
  	else
  		@joke = Joke.first
  	end
  end

  def like
  	voted_joke =Joke.find(params[:id])
  	voted_joke.likes += 1
  	voted_joke.save

  	joke_id = cookies[:votedjokes]
    if joke_id.blank?
      joke_id = cookies[:votedjokes] = voted_joke.id
    else
      cookies[:votedjokes] = joke_id + ',' + voted_joke.id.to_s
    end

  	respond_to do |format|
        format.js   {}
    end
  end

  def dislike
  	voted_joke =Joke.find(params[:id])
  	voted_joke.dislikes += 1
  	voted_joke.save

  	joke_id = cookies[:votedjokes]
    if joke_id.blank?
      joke_id = cookies[:votedjokes] = voted_joke.id
    else
      cookies[:votedjokes] = joke_id + ',' + voted_joke.id.to_s
    end

  	respond_to do |format|
        format.js   {}
    end
  end
  
end
