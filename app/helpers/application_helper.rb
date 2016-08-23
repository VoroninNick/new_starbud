module ApplicationHelper

  def cp(path)
    "current-page" if current_page?(path)
  end

  def self.self_embedded_svg_from_absolute_path(filename, options = {})
    return nil if filename.blank?
    filename = filename.to_s
    filename = filename.to_s + ".svg" if filename.scan(/\.svg\Z/).empty?
    file = File.read(filename.to_s)
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def embedded_svg_from_absolute_path(filename, options = {})
    ApplicationHelper.self_embedded_svg_from_absolute_path(filename, options)
  end
end
