class EntityIndex < WindowDriver
  def entity_count(type)
    entity_counts[type].to_i
  end

  def entity_counts
    page.all('#classes tbody.list tr').inject({}) { |memo, row|
      type = row.find('.class').text
      memo[type] = row.find('.count').text
      memo
    }
  end
end