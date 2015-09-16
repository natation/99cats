class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :no_overlapping_approved_requests

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id


    def overlapping_requests
      CatRentalRequest.where(<<-SQL, { crr_id: id, cat_id: cat_id, sd: start_date, ed: end_date} )
            (:crr_id IS NULL OR id != :crr_id) AND cat_id = :cat_id AND (
             :sd BETWEEN start_date AND end_date
           OR
             :ed BETWEEN start_date AND end_date
           )
        SQL
    end

    def no_overlapping_approved_requests
      errors.add(:overlapping_requests, "Cat is unavailable in selected timeframe.") unless
        overlapping_requests.where("status = 'APPROVED'").empty?
    end
end
