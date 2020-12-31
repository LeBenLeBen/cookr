module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def attachment_url(file, style = :original)
    "#{request.protocol}#{request.host_with_port}#{file.url(style)}"
  end
end
