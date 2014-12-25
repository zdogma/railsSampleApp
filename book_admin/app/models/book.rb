class Book < ActiveRecord::Base

  enum status: {reservation: 0, now_on_sale: 1, end_of_print: 2}

  scope :costly, -> { where("price > ?", 2000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }

  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validate do |book|
    if book.name.include?('java')
      book.errors[:name] << "I don't like Java."
    end
  end

  def high_price?
    price >= 5000
  end

  after_destroy :if => :high_price? do |book|
    Rails.logger.warn "Book with high price is deleted: #{book.attributes.inspect}"
    Rails.logger.warn "Please check!!"
  end

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors
end
