$:.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'redgreen' rescue nil

require 'liquid_inheritance'

class TestFileSystem
  
  def read_template_file(path)
    if path == 'simple'
      'test'
    elsif path == 'complex'
      %{
        beginning
        
        {% block thing %}
        rarrgh
        {% endblock %}
        
        {% block another %}
        bum
        {% endblock %}
        
      end
      }
    elsif 'nested'
      %{
        {% extends 'complex' %}
        
        {% block thing %}
        from nested
        {% endblock %}
        
        {% block another %}
        from nested (another)
        {% endblock %}
      }
    else
      %{
        {% extends 'complex' %}
        
        {% block thing %}
        from nested
        {% endblock %}
      }
    end
  end
  
end

class LiquidInheritanceTest < Test::Unit::TestCase
  context 'given a template with an extends tag' do
    setup do
      Liquid::Template.file_system = TestFileSystem.new
    end
    
    should 'output the contents of the extended template' do
      template = Liquid::Template.parse %{
        {% extends 'simple' %}
        
        {% block thing %}
        yeah
        {% endblock %}
      }
      
      assert_contains(template.render, /test/)
    end
    
    should 'render original content of block if no child block given' do
      template = Liquid::Template.parse %{
        {% extends 'complex' %}
      }
      
      assert_contains(template.render, /rarrgh/)
      assert_contains(template.render, /bum/)
    end
    
    should 'render child content of block if child block given' do
      template = Liquid::Template.parse %{
        {% extends 'complex' %}
        
        {% block thing %}
        booyeah
        {% endblock %}
      }
      
      assert_contains(template.render, /booyeah/)
      assert_contains(template.render, /bum/)
    end
    
    should 'render child content of blocks if multiple child blocks given' do
      template = Liquid::Template.parse %{
        {% extends 'complex' %}
        
        {% block thing %}
        booyeah
        {% endblock %}
        
        {% block another %}
        blurb
        {% endblock %}
      }
      
      assert_contains(template.render, /booyeah/)
      assert_contains(template.render, /blurb/)
    end
    
    should 'should remember context of child template' do
      template = Liquid::Template.parse %{
        {% extends 'complex' %}
        
        {% block thing %}
        booyeah
        {% endblock %}
        
        {% block another %}
        {{ a }}
        {% endblock %}
      }
      
      res = template.render 'a' => 1234
      
      assert_contains(res, /booyeah/)
      assert_contains(res, /1234/)
    end
    
    should 'should work with nested templates' do
      template = Liquid::Template.parse %{
        {% extends 'nested' %}
        
        {% block thing %}
        booyeah
        {% endblock %}
      }
      
      res = template.render 'a' => 1234
      
      assert_contains(res, /booyeah/)
      assert_contains(res, /from nested/)
    end
    
    should 'should work with nested templates if middle template skips a block' do
      template = Liquid::Template.parse %{
        {% extends 'nested2' %}
        
        {% block another %}
        win
        {% endblock %}
      }
      
      res = template.render
      
      assert_contains(res, /win/)
    end
    
    should 'should render parent for block.super' do
      template = Liquid::Template.parse %{
        {% extends 'complex' %}
        
        {% block thing %}
        {{ block.super }}
        {% endblock %}
      }
      
      res = template.render 'a' => 1234
      
      assert_contains(res, /rarrgh/)
    end
  end
end