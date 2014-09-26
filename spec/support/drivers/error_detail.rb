class ErrorDetail < WindowDriver
  def has_error?(error)
    page.has_text?(error.error_class_name) &&
      page.has_text?(error.message)
  end
end