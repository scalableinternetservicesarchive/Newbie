class Readcomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :replypost,class_name:"Post", foreign_key: "reply_toid"
  belongs_to :comment
  belongs_to :replycomment,class_name:"Comment", foreign_key: "reply_toid"
end
