#!/usr/bin/env ruby

require_relative 'lib/controller'

controller = Controller.new
prompt = '> '

print prompt

while command = STDIN.gets do
  controller.execute command
  print prompt
end
