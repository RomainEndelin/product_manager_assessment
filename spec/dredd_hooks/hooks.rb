include DreddHooks::Methods

skipped = [
]

skipped.each do |item|
  before item do |transaction|
    transaction['skip'] = true
  end
end
