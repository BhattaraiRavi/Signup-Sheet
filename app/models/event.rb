# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  fromdate    :datetime
#  todate      :datetime
#  multiday    :string
#  description :string
#  created_by  :string
#

class Event < ApplicationRecord
	mount_uploader :image, ImageUploader

	has_many :participants

	def self.search(search)
 		where("title LIKE ? or description LIKE ? ", "%#{search}%", "%#{search}%")
  	end

	validates_processing_of :image
	validate :image_size_validation
	validates :title, presence: true
	validates :title, length: {maximum: 100}
	validates :fromdate, presence: true
	validates :description, length: {maximum: 250}, allow_blank: true
 
private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
 end

end

