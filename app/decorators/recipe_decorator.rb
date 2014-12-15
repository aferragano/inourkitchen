class RecipeDecorator < Draper::Decorator
	decorates :recipe 

  delegate_all

	def recipe_thumb_single(recipe_images)
		image_tag(recipe_images.first.image_url)
	end

  def created_at(item)
      item.created_at.strftime("%a %m/%d/%y")
  end

end
