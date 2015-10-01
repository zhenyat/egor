module ApplicationHelper
  ##############################################################################
  # Get Application name (used by page_title)
  #   Alternatives:
  #       Rails.application.class.to_s.split("::").first
  #       Rails.application.config.session_options[:key].sub(/^_/,'').sub(/_session/,'')
  #       Rails.application.engine_name.gsub(/_application/,'')
  #
  # 15.12.2013  Created
  ##############################################################################
  def app_name
    Rails.application.class.parent_name
  end

  ##############################################################################
  # Handles Error messages with Bootstrap 3 styles
  # Source: http://stackoverflow.com/questions/15155890/styling-form-error-message-bootstrap-rails
  #
  # 18.07.2015 ZT
  ##############################################################################
  def errors_for(object)
    if object.errors.any?
      content_tag(:div, :class => "panel panel-danger") do
        concat(content_tag(:div, :class => "panel-heading") do
          concat(content_tag(:h4, :class => "panel-title") do
            concat "Объект '#{t(object.class.name.camelcase.underscore)}' не может быть сохранен из-за ошибок:"
          end)
        end)
        concat(content_tag(:div, :class => "panel-body") do
          concat(content_tag(:ul) do
            object.errors.full_messages.each do |msg|
                concat content_tag(:li, msg)
            end
          end)
        end)
      end
    end
  end
end

  ##############################################################################
  # HTML element to switch language among available ones
  #
  # Source:  http://dhampik.ru/blog/rails-routes-tricks-with-locales
  #
  # 17.11.2013  The `alternative version` in the source is used
  ##############################################################################
  def language_switch
    content_tag(:ul, id: 'switch') do
      I18n.available_locales.each do |loc|
        locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc)
        concat content_tag(:li, (link_to I18n.t(:language, locale: loc), locale_param), class: (I18n.locale == loc ? "active" : ""))
      end
    end
  end

  ##############################################################################
  # Return a title on a per-page basis with localization
  # Source:  Michael Hartl (Chapter 4, Listing 4.2)
  #
  # 15.12.2013  Created
  # 29.09.2015  Last update
  ##############################################################################
  def page_title(provided_title = '')
    if provided_title.empty?
      if controller_name == 'pages'
#       title = @page_title || ("#{t action_name.capitalize}")
        title = @page_title || ("#{action_name.capitalize}")
      else
#       title = @page_title || "#{t controller_name.capitalize}-#{t action_name.capitalize}"
        title = @page_title || "#{controller_name.capitalize}-#{action_name.capitalize}"
      end
    else
      title = provided_title    # Title is set via provide method in a View
    end
    "#{app_name} | #{title}"
  end
