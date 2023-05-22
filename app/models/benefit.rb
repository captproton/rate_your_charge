class Benefit < ApplicationRecord
    # scope :published, -> { where("publication_status == ?", true) }
    scope :visible, -> { where(publication_status: true) }

    has_one_attached    :product_image
    has_rich_text       :description

end
