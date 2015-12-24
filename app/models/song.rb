# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  artist     :string
#  track_name :string
#  preview    :string
#  art_work   :string
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ActiveRecord::Base
  belongs_to :playlist
end
