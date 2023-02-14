module CollaboratorsHelper
  # Default profile with first word of collaborator name
  def default_profile(collaborator)
    collaborator.name[0]
    content_tag(:figure, collaborator.name[0], class: "default-profile mb-0", style: "background-color: #{collaborator.profile}")
  end

  # Default large profile with first word of collaborator name
  def default_large_profile(collaborator)
    collaborator.name[0]
    content_tag(:figure, collaborator.name[0], class: "default-profile-lg fs-1 mb-0", style: "background-color: #{collaborator.profile}")
  end
end
