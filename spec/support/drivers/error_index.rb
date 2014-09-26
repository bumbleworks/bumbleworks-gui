class ErrorIndex < WindowDriver
  def has_error?(error)
    page.has_text?(error.error_class_name) &&
      page.has_text?(error.message)
  end

  def has_errors?(errors)
    errors.all? do |error|
      has_error?(error)
    end
  end
end