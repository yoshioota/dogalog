class UserStatus < Inum::Base
  define :ACTIVE,   1
  define :LOCK,     2
  # define :WITHDRAW, 3 # [TODO] 現在退会時は物理削除にしているため
end
