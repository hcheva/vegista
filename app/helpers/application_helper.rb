module ApplicationHelper
 
    def avatar_url(user)
      if user.avatar.present?
          user.avatar.url
    else
      'default_image.png'
     end
    end
  
  #add referal to game external link
  def self.ref_link(url)
    "#{url}?ref=submitgame"
  end
  
end


