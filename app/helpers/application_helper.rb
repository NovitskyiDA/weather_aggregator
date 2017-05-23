module ApplicationHelper
  def current_class?(test_path)
    request.path == test_path ? 'active' : ''
  end

  def current_locale?(locale)
    I18n.locale == locale
  end
end
