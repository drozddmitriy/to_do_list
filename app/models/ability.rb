class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_a?(User) && user.persisted?
      can %i[create read update destroy], Project, user_id: user.id
      can %i[create read update destroy], Task, project: { user_id: user.id }
      can %i[create read update destroy], Comment, task: { project: { user_id: user.id } }
    end
  end
end
