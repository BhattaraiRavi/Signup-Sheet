# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  day        :string
#  date       :integer
#  month      :string
#  year       :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
