json.array! @likes do |like|
  json.id like.id
  json.genre like.genre
  json.things like.things
  json.image like.image
  json.description like.description
  json.user_name like.user.name
end