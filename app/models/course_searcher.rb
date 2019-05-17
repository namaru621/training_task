### Modelの記述部分
### 何をやっているかはさっぱりだけど(主にやっているのはSQLの発行っぽい？)
### 検索で参照する範囲を別のメソッドとして作成してみた
### ちなみに引数がnilだった場合には全件を返すようにしている(ネットを参考にした)

class CourseSearcher < ApplicationRecord
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
