# == Schema Information
#
# Table name: airports
#
#  id         :integer          not null, primary key
#  airport    :string
#  base       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Airport < ApplicationRecord
end
