module StaticPagesHelper
  def gravatar_for
    gravatar_id = Digest::MD5::hexdigest("assassinpig@gmail.com")
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: "assassinpig", class: "gravatar")
  end
end
