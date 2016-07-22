include DreddHooks::Methods

skipped = [
  "Category > Edit a Category",
  "Category > Delete a Category",
]

skipped.each do |item|
  before item do |transaction|
    transaction['skip'] = true
  end
end
