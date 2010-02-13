require 'test/unit'

require 'rubygems'
gem 'activerecord', '>= 1.15.4.7794'
require 'active_record'

require "#{File.dirname(__FILE__)}/../lib/acts_as_list"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

def setup_db
  ActiveRecord::Schema.define(:version => 1) do
    create_table :mixins do |t|
      t.column :pos, :integer
      t.column :parent_id, :integer
      t.column :created_at, :datetime      
      t.column :updated_at, :datetime
    end

    create_table :sti_mixins do |t|
      t.column :position, :integer
      t.column :type, :string
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class Mixin < ActiveRecord::Base
end

class ListMixin < Mixin
  acts_as_list :column => "pos", :scope => :parent

  def self.table_name() "mixins" end

  attr_accessor :before_save_triggered
  before_save :log_before_save

  def log_before_save
    self.before_save_triggered = true
  end
end

class ListMixinSub1 < ListMixin
end

class ListMixinSub2 < ListMixin
end

class ListWithStringScopeMixin < ActiveRecord::Base
  acts_as_list :column => "pos", :scope => 'parent_id = #{parent_id}'

  def self.table_name
    "mixins"
  end
end

class StiMixin < ActiveRecord::Base
  acts_as_list
end

class StiMixinSub1 < StiMixin
end

class StiMixinSub2 < StiMixin
end
