# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :string           not null
#  lyrics     :text
#  bonus?     :boolean          not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base

  validates :name, :album_id, :bonus?, presence: true

  belongs_to :album
  
end
