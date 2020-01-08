class Todo < ApplicationRecord
    # リレーション：Todoモデルーtodosテーブル(ActiveRecored)
    # todosテーブルに「titleカラム」がある → Todoモデルで「titleメソッド」としてcall
    
    # リレーション完了(category.rb->has_many :todos)
    # todo.category.nameなどができる => todoと関連付いたcategoryモデルのnameを取得
    belongs_to :category 
    
    # varidation
    validates :title, presence: true
    validates :detail, presence: true
    validates :priority, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }
end
