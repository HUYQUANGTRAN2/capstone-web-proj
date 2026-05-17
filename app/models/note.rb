# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  body       :text
#  pinned     :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
  has_rich_text :body
  
  validates :title, presence: true
  validates :body, presence: true
end
