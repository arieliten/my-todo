module ApplicationHelper

  def task_sort_link(field, params, link_options={})
    sort = (params[:sort].blank? || params[:sort].match(/desc/)) ? "#{field} asc" : "#{field} desc"
    link_to field.to_s.titleize, root_path(sort: sort, hide_completed: params[:hide_completed]||0), link_options.merge!(remote: true)
  end

  def sort_css_class(field, sorted_params)
    return '' if sorted_params.blank?
    ary = sorted_params.split(' ')
    if ary.first.eql?(field.to_s)
      "sorted #{ary.last}"
    end
  end

  def row_css_class(task,hide_params)
    css = ''
    css += 'completed ' if task.completed?
    css += ' hide' if task.completed? && hide_params.to_s == '1'
    css
  end
end