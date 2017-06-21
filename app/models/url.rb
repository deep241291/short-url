class Url < ActiveRecord::Base
	  before_create :set_short_url
	def set_short_url
		self.short_url = 'url.ul/'+ SecureRandom.hex(5)
	end
end
