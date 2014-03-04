module PathHelpers
  def scoped_path(path)
    "/bw/#{path.gsub(/^\//, '')}"
  end

  # Visit the path after adding the mounted scope.
  def visit_scoped(path)
    visit(scoped_path(path))
  end
end