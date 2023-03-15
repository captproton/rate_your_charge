class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :location, dependent: :destroy
  #   has_many :votes, as: :votable

  #   validates :user, presence: true
  validates :location, presence: true
  validates :comment, presence: true

  acts_as_votable

  #    # upvote or remove vote
  #   def upvote!(user)
  #     if user.voted_up_on? self, vote_scope: 'like'
  #       unvote_by user, vote_scope: 'like'
  #     else
  #       upvote_by user, vote_scope: 'like'
  #     end
  #   end

  #   # downvote or remove vote
  #   def downvote!(user)
  #     if user.voted_down_on? self, vote_scope: 'like'
  #       unvote_by user, vote_scope: 'like'
  #     else
  #       downvote_by user, vote_scope: 'like'
  #     end
  #   end

  #   def vote!(vote_type, user)
  #     case vote_type
  #       when 'upvote'
  #         self.upvote! user
  #       when 'downvote'
  #         self.downvote! user
  #     end
  #   end
end
