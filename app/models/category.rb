class Category < ApplicationRecord
    # リレーション完了(todo.rb->belongs_to: categories)
    has_many :todos
    
    validates :name, presence: true
end
