# == Schema Information
#
# Table name: disciplines
#
#  id           :integer          not null, primary key
#  effective    :date
#  expectations :string
#  expires      :date
#  level        :string
#  reason       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  emp_id       :integer
#  sup_id       :integer
#
class Discipline < ApplicationRecord
end
