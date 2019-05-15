Rails.application.routes.draw do
  resource :search

  get 'course_searcher/top'

  get 'course_searcher/multiple_list/', to: 'course_searcher#multiple_list', as: 'course_searcher_multiple_list'

  get 'course_searcher/error'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'course_searcher#top'
end
