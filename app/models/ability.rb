class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.owner?
      can :read, Book
      can :create, Book
      can :update, Book 
      can :destroy, Book
      
    else
      can :read, Book
    end
  end
end