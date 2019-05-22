### Modelの記述部分
### 何をやっているかはさっぱりだけど(主にやっているのはSQLの発行っぽい？)
### 検索で参照する範囲を別のメソッドとして作成してみた
### ちなみに引数がnilだった場合には全件を返すようにしている(ネットを参考にした)

class CourseSearcher < ApplicationRecord
  with_options presence: true do
    validates :course_id,    length: { maximum: 20 }, uniqueness: true, format: { with: /\A[A-Za-z0-9\-]+\z/i }
    validates :course_title, length: { maximum: 50 }
    validates :topic,        length: { maximum: 100 }
    validates :category,     length: { maximum: 40 }, format: { with: /\A[A-Za-z0-9]+\z/i }
    validates :price,        numericality: { greater_than_or_equal_to: 999999, less_than_or_equal_to: 0 }
    validates :level_id,     numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 1 }
  end

  def self.keyword_search(search)
    if search
      where(['concat(course_id, course_title, topic, day_length, price, level_id, category) LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def self.category_search(search)
    if search
      where(['category LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
