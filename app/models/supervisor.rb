# == Schema Information
#
# Table name: supervisors
#
#  id                :integer          not null, primary key
#  conference_number :string
#  email             :string
#  first_name        :string
#  last_name         :string
#  phone             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  sup_id            :integer
#
class Supervisor < ApplicationRecord
end
