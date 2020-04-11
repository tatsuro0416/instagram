module ApplicationHelper
  def avatar_url(user)
    if user.profile_photo.file.nil?
      gravatar_id = Digest::MD5.hexdigest(user.email).downcase
      return "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
      'unknown.png'
    else
      user.profile_photo.url
    end
  end

  def full_title(page_title = '')
    base_title = 'InstaClone'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
