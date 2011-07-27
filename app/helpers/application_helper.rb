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
    number_to_currency(quotation, :precision => 2, :unit => '').to_s
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
    
end
