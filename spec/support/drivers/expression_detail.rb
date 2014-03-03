class ExpressionDetail < WindowDriver
  def has_expression?(expression)
    page.has_text?(expression.expid) &&
      page.has_text?(expression.process.wfid)
  end

  def has_error?(error)
    page.has_text?(error.class.name) &&
      page.has_text?(error.message)
  end
end