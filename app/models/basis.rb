# == Schema Information
#
# Table name: bases
#
#  id         :integer          not null, primary key
#  base       :string
#  cobase     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Basis < ApplicationRecord
end
