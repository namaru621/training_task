Rails.application.routes.draw do
  #resource :search

  root 'course_searcher#top'
  get 'course_searcher/top', to: 'course_searcher#top', as: 'course_searcher_top'

  get 'course_searcher/multiple_list/', to: 'course_searcher#multiple_list', as: 'course_searcher_multiple_list'

  get 'course_searcher/single_course/', to: 'course_searcher#single_course', as: 'course_searcher_single_course'
  put 'course_searcher/single_course/', to: 'course_searcher#update', as: 'course_searcher_update'

  get 'course_searcher/create_course/', to: 'course_searcher#create_course', as: 'course_searcher_create_course'
  post 'course_searcher/create_course/', to: 'course_searcher#create', as: 'course_searcher_create'

  get 'course_searcher/delete_check/', to: 'course_searcher#delete_check', as: 'course_searcher_delete_check'
  delete 'course_searcher/delete/', to: 'course_searcher#delete', as: 'course_searcher_delete'

  get 'course_searcher/error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'course_searcher#top'
end
