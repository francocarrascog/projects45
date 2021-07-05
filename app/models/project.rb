class Project < ApplicationRecord
    validates :name, :description, :start_date, :end_date, :state, presence: true  
end
