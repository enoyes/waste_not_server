class User < ActiveRecord::Base
  has_many :food_items
  belongs_to :group

  before_create :generate_auth_token!

  def generate_auth_token!
    begin
      self.token = SecureRandom.base64
    end
  end

  def set_last_sync!
    self.last_sync = DateTime.now
  end


end