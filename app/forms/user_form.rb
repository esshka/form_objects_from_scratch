class UserForm
  include ActiveModel::Model


  def self.model_name
    ActiveModel::Name.new(self, nil, "User")
  end

  delegate :name, :password, to: :user
  delegate :desc, :phone, to: :profile

  def user
    @user ||= User.new
  end
  
  def profile
    @profile ||= user.build_profile
  end

  def submit(params)
    user.attributes = params.slice(:name, :password)
    profile.attributes = params.slice(:desc, :phone)
    user.save!
    profile.save!
  end


end