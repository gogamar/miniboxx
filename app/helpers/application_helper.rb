module ApplicationHelper

  def tailwind_classes_for(flash_type)
    {
      notice: "rounded-md bg-green-50 p-4 m-1",
      alert: "rounded-md bg-red-50 p-4 m-1",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def language_dropdown(current_locale)
    content_tag(:li, class: 'nav-item dropdown language-dropdown') do
      flag_code = set_flag(current_locale)
      concat(link_to("#", class: 'nav-link dropdown-toggle', id: 'languageDropdown', data: { bs_toggle: 'dropdown' }, 'aria-haspopup': true, 'aria-expanded': false) do
        content_tag(:small) do
          concat(content_tag(:span, nil, class: "flag-icon flag-icon-#{flag_code}"))
          concat(" #{t(current_locale)}")
        end
      end)

      concat(content_tag(:ul, class: 'dropdown-menu dropdown-menu-end', 'aria-labelledby': 'languageDropdown') do
        (I18n.available_locales - [current_locale]).each do |locale|
          flag_code = set_flag(locale)
          query_params = params.except(:locale).permit!.to_h
          locale_path = url_for(locale: locale.to_s, **query_params)

          concat(content_tag(:li) do
            concat(link_to(locale_path, class: 'dropdown-item') do
              concat(content_tag(:span, nil, class: "flag-icon flag-icon-#{flag_code}"))
              concat(" #{t(locale)}")
            end)
          end)
        end
      end)
    end
  end

  def set_flag(locale)
    if locale == :en
      flag_code = 'gb'
    elsif locale == :ca
      flag_code = 'es-ca'
    else
      flag_code = locale
    end
    return flag_code
  end
end
