class ImagesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :cors_preflight_check
	after_filter :cors_set_access_control_headers

	# For all responses in this controller, return the CORS access control headers.
	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
		headers['Access-Control-Max-Age'] = "1728000"
	end

	# If this is a preflight OPTIONS request, then short-circuit the
	# request, return only the necessary headers and return an empty
	# text/plain.

	def cors_preflight_check
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
		headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
		headers['Access-Control-Max-Age'] = '1728000'
	end

  def index
	  #@body = HTTP.get("https://olkpeace.org/cannapedia/PolnyjjSpisokSortov.html").body.to_s.to_utf8
  end

	def getlist
		#b = HTTP.get("https://olkpeace.org/cannapedia/PolnyjjSpisokSortov.html").body.to_s.to_utf8.gsub!("&nbsp;", " ")
		b = HTTP.get("http://0s.n5wgw4dfmfrwkltpojtq.nblk.ru/cannapedia/PolnyjjSpisokSortov.html").body.to_s.to_utf8.gsub!("&nbsp;", " ")
		@body = b.scan(/<a name=".+?" href="(\/cannapedia\/SpisokSortov\/(.+?)\/.+?\.html)" class="" title=".+?">(.+?)<\/a>/i)
		@b1 = @body[0]
		@b1 = ["/cannapedia/SpisokSortov/MedicalSeeds/1024.html", "MedicalSeeds", "1024"]
		@user = current_user
		@list_id = Digest::MD5.hexdigest(@user.id.to_s)
		@list = List.new
	end

	def createlist
		@p = params[:assignment]
	end
end