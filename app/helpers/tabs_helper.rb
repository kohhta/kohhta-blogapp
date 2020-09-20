module TabsHelper
  def add_active_class(path)
    path = path.split('?').first #？移行のpathをremoveしてます
    'active'  if current_page?(path)
  end
end