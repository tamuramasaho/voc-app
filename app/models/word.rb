class Word < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :translation, presence: true
  validate :validate_name_not_including_comma

  belongs_to :user

  scope :alphabetical, -> { order('name ASC') }

  def self.csv_attributes
    %w[name translation example created_at updated_at]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.find_each do |word|
        csv << csv_attributes.map { |attr| word.send(attr) }
      end
    end
  end

  def self.import(file)
    if file
      CSV.foreach(file.path, headers: true) do |row|
         word = new
         word.attributes = row.to_hash.slice(*csv_attributes)
         word.save!
      end
    else
      return
    end
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
