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

# module Sass
#   module Tree
#     class ImportNode < RootNode
    	
#       def _dump(f)
#         Marshal.dump([@imported_filename, children])
#       end

#       def self._load(data)
#         filename, children = Marshal.load(data)
#         node = ImportNode.new(filename)
#         node.children = children
#         node
#       end

#     end
#   end
# end
