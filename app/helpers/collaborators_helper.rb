module CollaboratorsHelper
  # Default profile with first word of collaborator name
  def profile_picture(collaborator)
    profile_picture_size(collaborator)
  end

  # Default large profile with first word of collaborator name
  def profile_picture_large(collaborator)
    profile_picture_size(collaborator, class_size: "profile-picture profile-picture-lg")
  end

  # Default small profile with first word of collaborator name
  def profile_picture_small(collaborator)
    profile_picture_size(collaborator, class_size: "profile-picture profile-picture-sm")
  end

  private
    # Get first letter of collaborator name
    def first_letter(collaborator)
      collaborator.name[0]
    end

    # Return size of profile picture
    def profile_picture_size(collaborator, class_size: "profile-picture")
      if collaborator.profile_picture.attached?
        image_tag collaborator.profile_picture, class: class_size
      else
        content_tag(:figure, first_letter(collaborator), class: class_size, style: "background-color: #{collaborator.profile}")
      end
    end
end
