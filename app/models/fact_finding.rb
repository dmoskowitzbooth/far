# == Schema Information
#
# Table name: fact_findings
#
#  id         :integer          not null, primary key
#  date       :date
#  subject    :string
#  supervisor :string
#  time       :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  emp_id     :integer
#  sup_id     :integer
#
class FactFinding < ApplicationRecord
end
