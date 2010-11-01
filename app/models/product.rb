class Product < ActiveRecord::Base
  validates_presence_of :name, :description, :image_url
  validates_numericality_of :price, :greater_than => 0, :only_integer => true
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)\Z}i,
                      :message => "はGIF,JPEG,PNG画像のURLでなければなりません"

  scope :for_sale, :order => "created_at DESC"
  scope :name_like, lambda {|q| {:conditions => ['name like ?', "%#{q}%"]}}
  scope :recent, lambda {|num| {:limit => num, :order => "created_at DESC" }}
  scope :recommended, :conditions => { :recommended => true }

  belongs_to :shop
  has_many :line_items
end
