class Mp
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  belongs_to :party
  belongs_to :constituency
  
  has 1, :mp_profile
  has 1, :mp_statistic
  
  def state_name
    self.constituency.state.name
  end
end