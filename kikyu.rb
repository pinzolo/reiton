#!/usr/bin/env ruby
# coding: utf-8

all = [1,2,3,4,5,6,7,8,9]
fix = [5,8]
available = all - fix

available.each do |a1|
  x1 = available - [a1]
  x1.each do |a2|
    if a1 < a2
      x2 = x1 - [a2]
      x2.each do |a3|
        if a1 < a3
          x3 = x2 - [a3]
          x3.each do |a4|
            if a3 < a4
              if a1 + a2 + fix[0] == a3 + a4 + fix[1]
                x4 = available - [a1, a2, a3, a4]
                x5 = [[x4[0], x4[1]], [x4[0], x4[2]], [x4[1], x4[0]], [x4[1], x4[2]], [x4[2], x4[0]], [x4[2], x4[1]]]
                x5.each do |c1, c2|
                  if a1 + a3 + c1 == a2 + a4 + c2
                    if fix[0] + a1 + a2 == a1 + a3 + c1
                      puts "[#{a1}, #{a2}], [#{a3}, #{a4}], [#{c1}, #{c2}]"
                    end
                  elsif a1 + a4 + c1 == a2 + a3 + c2
                    if fix[0] + a1 + a2 == a1 + a4 + c1
                      puts "[#{a1}, #{a2}], [#{a3}, #{a4}], [#{c1}, #{c2}]"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

