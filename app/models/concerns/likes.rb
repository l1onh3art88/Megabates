class Likes

  attr_accessor :user, :fact

  def initialize(user, fact)
    @user = user
    @fact = fact
  end

  def like!
    REDIS.multi do
      REDIS.sadd fact_key, user.id
      REDIS.sadd user_key, fact.id
    end
    
    return true
  end

  def unlike!
    REDIS.multi do
      REDIS.srem fact_key, user.id
      REDIS.srem user_key, fact.id
    end
    return true
  end

  def liked_facts
    REDIS.smembers user_key
  end

  def liked_facts_count
    REDIS.scard user_key
  end

  def fact_user_likes
    REDIS.smembers fact_key
  end

  def fact_likes_count
    REDIS.scard fact_key
  end

  def user_liked_fact?
    REDIS.sismember fact_key, user.id
  end

  protected

  def user_key
    "users:#{user.id}:liked_facts"
  end

  def fact_key
    "facts:#{fact.id}:liking_users"
  end
end