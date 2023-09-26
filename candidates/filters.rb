# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  return @candidates.select{|x| x[:id]==id}
end

def experienced?(candidate)
  if candidate[:years_of_experience] >= 2) {
    return true
    }
  else
    return false
  end
end

def qualified_candidates(candidates)
  qualified = []
  @candidates.each do |x| 
    if more_than_100_points?(x)&&ruby_or_python?(x)&&applied_15_days?(x)&&older_than_17?(x)
      qualified << x
    end
  end
  return qualified
end

def ordered_by_qualifications(candidates)
  sorted = @candidates.sort {|a, b| [b[:years_of_experience], b[:github_points]] <=> [a[:years_of_experience], a[:years_of_experience]]}
  return sorted
end

# More methods will go below