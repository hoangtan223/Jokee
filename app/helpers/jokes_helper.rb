module JokesHelper
	def SaveJokeToCookie(id)
		joke_id = cookies[:voted_jokes]
		if joke_id.blank?
			joke_id = cookies[:voted_jokes] = id
		else
			cookies[:voted_jokes] = joke_id + ',' + id.to_s
		end
	end
end
