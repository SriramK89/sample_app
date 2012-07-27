module UsersHelper
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def pagination_subset_items_display(page_number, fixed_item_count, page_item_count, total_items, item_name)
  	start_item = (( page_number - 1 ) * fixed_item_count ) + 1
  	end_item = start_item + ( page_item_count - 1 )
  	"Showing #{start_item} to #{end_item} of #{total_items} #{item_name}"
  end
end
