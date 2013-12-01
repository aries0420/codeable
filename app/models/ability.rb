class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :view, :evening if user.has_role? :evening
      can :view, :silver if user.has_role? :silver
      can :view, :gold if user.has_role? :gold
    end
  end
end
