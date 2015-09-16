# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  birth_date  :date             not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#

class Cat < ActiveRecord::Base
  COLORS = %w(black white orange blue brown)
  validates :name, :birth_date, :color, :sex, :description, presence: true
  validates :sex, length: {is: 1}, inclusion: { in: %w(M F) }

  has_many :requests,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id,
    primary_key: :id

  def age
    Date.today.year - birth_date.year
  end
end
