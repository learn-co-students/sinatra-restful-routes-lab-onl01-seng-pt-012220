#Placeholder for a model
class Recipe <ActiveRecord::Base
  attr_accessor :name, :ingredients, :cook_time

  @@all = []

  def initialize
    @@all << self
  end
  def self.all
    @@all
  end
end
