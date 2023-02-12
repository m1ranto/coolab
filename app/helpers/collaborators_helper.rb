module CollaboratorsHelper
  # Default profile with first word of collaborator name
  def default_profile(collaborator)
    collaborator.name[0]
    content_tag(:div, collaborator.name[0], class: "default-profile", style: "background-color: #{collaborator.profile}")
  end

  # Default large profile with first word of collaborator name
  def default_large_profile(collaborator)
    collaborator.name[0]
    content_tag(:div, collaborator.name[0], class: "default-profile-lg fs-1", style: "background-color: #{collaborator.profile}")
  end
end
