class UserPolicy < ApplicationPolicy
  def edit?
    url = "http://main.dev.local:3000/users/#{user.id}/edit"
    # TODO 401が来たらJSON::ParserError
    json = Net::HTTP.get(URI.parse(url))
    hash = JSON.parse(json)
    return true if hash["result"] == 'OK'
    false
  rescue JSON::ParserError => e
    false
  end
end