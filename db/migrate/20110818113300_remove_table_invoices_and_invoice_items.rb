class RemoveTableInvoicesAndInvoiceItems < ActiveRecord::Migration
  def self.up
    drop_table :invoices
    drop_table :invoice_items
  end

  def self.down
  end
end
