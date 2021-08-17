module PropertiesHelper
  def property_thumbnail property
    img = property.photo
    image_tag img, class: "img-thub"
  end
end
