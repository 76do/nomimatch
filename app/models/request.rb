class Request < ApplicationRecord
  belongs_to :user
  validates :sender_name, presence: true
  enum dismissal_time: {unspecified: 0, seventeen: 1, eighteen: 2, nineteen: 3, twenty: 4, twenty_one: 5, twenty_two: 6, twenty_three: 7, twenty_four: 8}, _prefix: true
  enum number_of_people: {unspecified: 0, small: 1, medium: 2, large: 3}, _prefix: true
  enum budget: {unspecified: 0, three_thousand: 1, five_thousand: 2, ten_thousand: 3, fifteen_thousand: 4, more: 5 }, _prefix: true
end
