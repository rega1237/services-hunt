module ServicesHelper
  def service_description(description)
    description.truncate(30)
  end
end
