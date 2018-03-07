class Event < ApplicationRecord
  validates_presence_of :name

  belongs_to :user,optional: true

  has_many :attendees

  belongs_to :category,optional: true

  delegate :name, :to => :category, :prefix => true, :allow_nil => true

  has_many :event_groupships
  has_many :group, :through => :event_groupships
end
