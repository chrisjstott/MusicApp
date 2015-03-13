# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  live      :boolean          not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base

  validates :title, :band_id, :live, presence: true

  has_many :tracks, dependent: :destroy
  belongs_to :band

end
