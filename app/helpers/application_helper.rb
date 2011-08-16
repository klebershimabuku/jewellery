module ApplicationHelper
  def title
    base_title = "KT Jewellery"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def my_simple_format(value)
    if value.nil?
      '-'
    else
      value.gsub(/<br><br>/, "<br />").html_safe
    end
  end
    
  def display_current(quotation)
    if quotation.present?
      number_to_currency(quotation, :precision => 2, :unit => '', :delimiter => '').to_s
    else
      "--"
    end
  end
  
  def show_dashes_for_none(value)
    if value == "None"
      "--"
    else
      value
    end
  end
  
  def button_for(name, options={})
    return content_tag(:button, content_tag(:span, content_tag(:span, name)), :class => options[:class], :type => options[:button_type])
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) +  link_to_function(name, "remove_fields(this)" , :class => 'negative pill button')
  end
  
  def link_to_add_fields(name, f, association, options={})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')" , :class => options[:class])
  end  
  
  # for load devise form whatever you want without having to modify the original form code
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
