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
      number_to_currency(quotation, :precision => 2, :unit => '').to_s
    else
      "--"
    end
  end
  
  def flash_message
      messages = ""
      [:notice, :info, :warning, :error, :alert].each {|type|
          if flash[type]
              messages += "#{flash[type]}"
          end
      }
      messages
  end
  
  def show_dashes_for_none(value)
    if value == "None"
      "--"
    else
      value
    end
  end
    
end
