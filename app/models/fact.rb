class Fact < ActiveRecord::Base
  has_many :likes
	belongs_to :user
  belongs_to :topic

  scope :pro, -> { where(lean: true)}
  scope :con, -> {where(lean: false)}

  default_scope {order('updated_at DESC')}


  def points
    @likes = Likes.new(nil, self)
    @likes.fact_likes_count * 7
  end

    def update_rank
      age = (self.created_at - Time.new(1970,1,1)) / 86400
      new_rank = points + age

      self.update_attribute(:rank, new_rank)
    end
    

    def create_like(liker)
      @fact = Likes.new(liker, self)
      @fact.like!
    end
    def count_likes
      @likes = Likes.new(nil, self)
      @likes.fact_likes_count
    end

    def unlike(liker)
      @fact = Likes.new(liker, self)
      @fact.unlike!
    end
    
    private

    def update_fact
    self.fact.update_rank
    end
end
