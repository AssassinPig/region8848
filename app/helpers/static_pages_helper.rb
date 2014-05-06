module StaticPagesHelper
  def gravatar_for(email, size=128)
    gravatar_id = Digest::MD5::hexdigest(email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: "", class: "gravatar")
  end
end
