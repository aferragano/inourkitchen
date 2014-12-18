module ApplicationHelper

	def first_image(images)
		lib = []
		images.each do |img|
			lib << img.image_url
		end
		if lib[0]
			lib[0]
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
