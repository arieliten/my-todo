module ApplicationHelper

  def task_sort_link(field, link_options={})
    sort = (session[:sort].blank? || session[:sort].match(/desc/)) ? "#{field} asc" : "#{field} desc"
    link_to field.to_s.titleize, root_path(sort: sort), link_options.merge!(remote: true)
  end

  def sort_css_class(field)
    return '' if session[:sort].blank?
    ary = session[:sort].split(' ')
    if ary.first.eql?(field.to_s)
      "sorted #{ary.last}"
    end
  end

  def row_css_class(task)
    css = ''
    css += 'completed ' if task.completed?
    css += ' hide' if task.completed? && session[:hide].to_i == 1
    css
  end
end