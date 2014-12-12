module ApplicationHelper

	def first_image(images)
		lib = []
		images.each do |img|
			lib << img.image_url
		end
		lib[0]
	end 

	def created_at(item)
        item.created_at.strftime("%m/%d/%y")
   end
end
