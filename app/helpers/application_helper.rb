module ApplicationHelper

	def last_image(images)
		lib = []
		images.each do |img|
			lib << img.image_url.url
		end
		if lib[-1]
			lib[-1]
		end
	end 

	def rand_image(images)
		lib = []
		images.each do |img|
			lib << img.image_url
		end
		lib.sample
	end 

	def created_at(item)
        item.created_at.strftime("%m/%d/%y")
   end
end
