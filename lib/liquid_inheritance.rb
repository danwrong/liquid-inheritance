require 'liquid'

module LiquidInheritance
  autoload :Extends, 'tags/extends'
  autoload :Block, 'tags/block'
end

Liquid::Template.register_tag(:extends, LiquidInheritance::Extends)
Liquid::Template.register_tag(:block, LiquidInheritance::Block)