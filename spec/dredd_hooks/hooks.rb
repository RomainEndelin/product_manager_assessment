include DreddHooks::Methods

skipped = [
  "Product > Delete a Product",
  "Categories Collection > List Categories",
  "Categories Collection > Create a New Category",
  "All Categories Collection > List All Categories",
  "Category > Show a Category",
  "Category > Edit a Category",
  "Category > Delete a Category",
]

skipped.each do |item|
  before item do |transaction|
    transaction['skip'] = true
  end
end
