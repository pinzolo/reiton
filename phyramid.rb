#!/usr/bin/env ruby
# coding: utf-8

def create_nums(n)
  if n == 1
    [1]
  else
    x = create_nums(n-1)
    n.times do
      x << x.last + 1
    end
    x
  end
end

def sigma(n)
  n == 1 ? 1 : sigma(n-1) + n
end

def f(arr, list, level)
  new_list = []
  level_up = false
  list.each do |line|
    x = arr - line
    x.each do |n|
      new_line = line.dup
      new_line << n
      ok = true
      if new_line.length == sigma(level)
        level_up = true
        len = new_line.length
        1.upto(level - 1) do |i|
          ok &= (new_line[len - i] - new_line[len - i - 1]).abs == new_line[len - level - i]
        end
      end
      new_list << new_line if ok
    end
  end
  level += 1 if level_up

  if new_list.first.length == arr.length
    new_list
  else
    f(arr, new_list, level)
  end
end

level = 5
nums = create_nums(level)
list = f(nums, [[]], 2)
list.each do |line|
  puts line.inspect if line[11] == 14
end
