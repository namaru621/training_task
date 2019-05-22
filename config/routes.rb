Rails.application.routes.draw do
  #resource :search

  root 'courses_searcher#top'
  get 'courses_searcher/top', to: 'courses_searcher#top', as: 'courses_searcher_top'

  get 'courses_searcher/multiple_list/', to: 'courses_searcher#multiple_list', as: 'courses_searcher_multiple_list'

  get 'courses_searcher/single_course/', to: 'courses_searcher#single_course', as: 'courses_searcher_single_course'
  put 'courses_searcher/single_course/', to: 'courses_searcher#update', as: 'courses_searcher_update'

  get 'courses_searcher/create_course/', to: 'courses_searcher#create_course', as: 'courses_searcher_create_course'
  post 'courses_searcher/create_course/', to: 'courses_searcher#create', as: 'courses_searcher_create'

  get 'courses_searcher/delete_check/', to: 'courses_searcher#delete_check', as: 'courses_searcher_delete_check'
  delete 'courses_searcher/delete/', to: 'courses_searcher#delete', as: 'courses_searcher_delete'

  get 'courses_searcher/error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'courses_searcher#top'
end
