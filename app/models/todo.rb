class Todo < ApplicationRecord
    # リレーション：Todoモデルーtodosテーブル(ActiveRecored)
    # todosテーブルに「titleカラム」がある → Todoモデルで「titleメソッド」としてcall
    
    # varidation
    validates :title, presence: true
    validates :detail, presence: true
end
