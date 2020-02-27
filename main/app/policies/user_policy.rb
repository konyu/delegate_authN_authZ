class UserPolicy < ApplicationPolicy
  def edit?
    # UserIDが1以外の人がスーパーユーザーとする
    if record.id == 2
      true
    else
      false
    end
  end
end