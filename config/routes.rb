Rails.application.routes.draw do
  # routes => 通信(GET,POST,etc..)をどのコントローラのどのアクションで処理するか分配
  # [参考]https://railsguides.jp/routing.html#%E3%83%AA%E3%82%BD%E3%83%BC%E3%82%B9%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0-rails%E3%81%AE%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88
  resources :todos  # 「todosコントローラ」をcall（7つのアクション(上記URL参照)）
  root :to => 'todos#index'
end
