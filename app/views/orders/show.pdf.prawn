pdf.text "#{APP_CONFIG['company_name']}", :size => 20, :style => :bold, :align => :center
pdf.text "#{APP_CONFIG['company_address']}", :size => 10, :style => :bold, :align => :center
pdf.text "#{APP_CONFIG['company_details']}", :size => 10, :style => :bold, :align => :center

pdf.move_down(30)

pdf.text "<u>INVOICE</u>", :size => 14, :style => :bold, :align => :center, :inline_format => true

pdf.move_down(50)

pdf.text "Invoice# #{@order.id}", :size => 12
pdf.text "Date: #{Date.today.strftime('%B %d, %Y')}", :size => 12
pdf.text "Date of Sale: #{@order.created_at.strftime('%B %d, %Y')}", :size => 12


pdf.move_down(10)

pdf.text "<b>INVOICE</b> of <u>#{@order.items.map(&:title).join(", ")}</u>", :inline_format => true

pdf.move_down(5)
pdf.text "Consigned to <u>#{@order.customer.name}</u>", :inline_format => true
pdf.move_down(5)
pdf.text "<u>#{@order.customer.address}</u>" , :inline_format => true

pdf.move_down(30)

items = [ ["Name", "Qty", "Unit Price", "Amount"] ]
items += @order.item_orders.map do |oitem|
   [
     oitem.item.title,
     oitem.quantity.to_s,
     number_to_currency(oitem.item.price,:unit => 'HK$ '),
     number_to_currency(oitem.full_price,:unit => 'HK$ ')
   ]
end

pdf.table items, :header => true,
                 :column_widths => [200,100,150,150],
				 :row_colors => ["FFFFFF","DDDDDD"]

pdf.move_down(10)

pdf.text "Total Price: #{number_to_currency(@order.total_price, :unit => 'HK$')}", :size => 14, :style => :bold, :align => :right

pdf.move_down(30)

pdf.text "#{APP_CONFIG['company_name']}", :style => :bold, :align => :right
pdf.move_down(20)
pdf.text "_______________________", :align => :right
pdf.move_down(10)
pdf.text "Employee's Name: #{current_user.name}", :size => 12, :align => :right