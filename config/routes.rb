Rails.application.routes.draw do
  # ! 管理者関連の認証
  devise_for :admins

  # ! ユーザ関連の認証
  devise_for :users

  # ! SNS画面のルーティング
  root to: "sns/posts#list"
  get "sns/show/:id", to: "sns/posts#show"
  get "sns/new", to: "sns/posts#new"
  post "sns/create", to: "sns/posts#create"
  get "sns/edit/:id", to: "sns/posts#edit"
  patch "sns/update/:id", to: "sns/posts#update"
  delete "sns/delete/:id", to: "sns/posts#delete"
  get "/sns/search", to: "sns/searchs#search"
  post "sns/create_like/:id", to:"sns/likes#create_like"
  delete "sns/delete_like/:id", to:"sns/likes#delete_like"
  get "sns/like_ranking", to: "sns/likes#like_ranking"

  # ! クローゼット画面のルーティング
  get "closet/list", to: "coordinates/posts#list"
  get "closet/new", to: "coordinates/posts#new"
  post "closet/create", to: "coordinates/posts#create"
  get  "closet/show/:id", to: "coordinates/posts#show"
  delete "closet/delete/:id", to: "coordinates/posts#delete"
  get "closet/edit/:id", to: "coordinates/posts#edit"
  patch "closet/update/:id", to: "coordinates/posts#update"
  get "closet/search", to: "coordinates/searchs#search"
  post "/realtime_selected_value", to: "coordinates/posts#realtime_selected_value"

  # ! コーディネートQ&A画面のルーティング
  get "faq/question/new", to: "faq/questions#new"
  post "faq/question/create", to: "faq/questions#create"
  get "faq/question/list", to: "faq/questions#list"
  get "faq/question/show/:id", to: "faq/questions#show"
  get "faq/question/edit/:id", to: "faq/questions#edit"
  patch "faq/question/update/:id", to: "faq/questions#update"
  delete "faq/question/delete/:id", to: "faq/questions#delete"
  get "faq/question/search", to: "faq/searchs#search"
  get "faq/answer/new/:id", to: "faq/answers#new"
  post "faq/answer/create/:id", to: "faq/answers#create"
  delete "faq/answer/delete/:id", to: "faq/answers#delete"
  get "faq/answer/edit/:id", to: "faq/answers#edit"
  patch "faq/answer/update/:id", to: "faq/answers#update"
  post "faq/create_like/:id", to: "faq/likes#create_like"
  delete "faq/create_delete/:id", to: "faq/likes#delete_like"

  # ! 提案画面のルーティング
  get "induction", to: "suggestion/suggestions#induction"
  get "suggestion", to: "suggestion/suggestions#suggestion"
  post "suggest_create", to: "suggestion/suggestions#suggest_create"

  # ! プロフィール画面のルーティング
  get "profile/show/:id", to: "profile/profiles#show"
  get "profile/edit/:id", to: "profile/profiles#edit"
  patch "profile/update/:id", to: "profile/profiles#update"
  post "profile/follow/:id", to: "profile/follows#create_follow"
  delete "profile/follow/:id", to: "profile/follows#delete_follow"
  get "follow/:id", to: "profile/follows#follow"
  get "alert/list", to: "profile/alerts#list"
  get "alert/show/:id", to: "profile/alerts#show"
  
  # ! お問い合わせフォーム
  get "contact/new" , to: "contact/contacts#new"
  post "contact/create" , to: "contact/contacts#create"
  get "contact/complete" , to: "contact/contacts#complete"

  # ! 管理者画面のルーティング
  get "admin/alert/new", to: "admin/alerts#new"
  post "admin/alert/create", to: "admin/alerts#create"
  get "admin/alert/list", to: "admin/alerts#list"
  get "admin/alert/show/:id", to: "admin/alerts#show"
  get "admin/alert/edit/:id", to: "admin/alerts#edit"
  patch "admin/alert/update/:id", to: "admin/alerts#update"
  delete "admin/alert/delete/:id", to: "admin/alerts#delete"
  get "admin/contact/list", to: "admin/contacts#list"
  get "admin/contact/show/:id", to: "admin/contacts#show"
  post "admin/contact/create_handle/:id", to: "admin/contacts#create_handle"
  post "admin/contact/delete_handle/:id", to: "admin/contacts#delete_handle"

  # ! 特設ページのルーティング
  get "sns/special", to: "sns/posts#special"
end

