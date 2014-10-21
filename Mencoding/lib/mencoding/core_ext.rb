String.class_eval do
	def to_squawk
		"squawk! #{self}".strip
	end

	def to_utf8
		str = "#{self}"
		str = str.force_encoding('UTF-8')
		return str if str.valid_encoding?
		str.encode("UTF-8", 'binary', invalid: :replace, undef: :replace, replace: '')
	end

end