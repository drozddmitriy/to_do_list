class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    user ||= User.new
    return unless user.is_a?(User) && user.persisted?

    can :crud, Project, user_id: user.id
    can :crud, Task, project: { user_id: user.id }
    can :crud, Comment, task: { project: { user_id: user.id } }
  end
end
