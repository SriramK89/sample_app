def full_title(page_title)
  base_title = "Rails sample application"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end