# array map and calling partition with block value el index less than array index (in float)
def halvsies(array)
  array.partition.with_index {|el, i| el if i < array.size / 2.0}
end

#solution

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end