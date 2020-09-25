# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  category   :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  enum category: { trackmaker: 0, singer: 1, memberswanted: 2, other: 3}
  # 楽曲提供がtrackmaker、歌い手はsinger、メンバー募集はmemberswanted、その他other
  has_one_attached :eyecatch
  has_rich_text :content
  
  
  validates :title,presence: true
  validates :title,length: {minimum:2}
  validates :title, format:{with: /\A(?!\＠)/ }

  validates :content,presence: true
 

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  

  
end
