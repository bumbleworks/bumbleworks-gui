class EntityTypeIndex < WindowDriver
  def has_entities?(entities)
    entities.all? { |entity|
      page.has_text? entity.to_s
    }
  end

  def has_registered_process?(process_name)
    page.has_text? process_name
  end
end