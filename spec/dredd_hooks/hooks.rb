include DreddHooks::Methods

skipped = [
  "Categories Collection > List Categories",
  "Categories Collection > Create a New Category",
  "Category > Edit a Category",
  "Category > Delete a Category",
]

skipped.each do |item|
  before item do |transaction|
    transaction['skip'] = true
  end
end
