class Role < EnumerateIt::Base
  associate_values admin: 1, manager: 2
end
