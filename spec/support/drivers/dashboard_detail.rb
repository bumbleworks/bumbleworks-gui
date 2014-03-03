class DashboardDetail < WindowDriver
  def has_count_of?(collection)
    page.has_text?(collection.count)
  end
end