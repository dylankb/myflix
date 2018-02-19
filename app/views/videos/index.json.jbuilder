json.categories @categories do |category|
  json.name category.name
  json.videos category.videos do |video|
    json.id video.id
    json.title video.title
    json.thumbnail_image_url video.thumbnail_image_url
    json.cover_image_url video.cover_image_url
  end
end
