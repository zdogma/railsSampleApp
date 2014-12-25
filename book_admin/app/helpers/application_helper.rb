module ApplicationHelper

  def convert2hankaku(str)
    str.tr('Ａ-Ｚａ-ｚ', 'A-Za-z')
  end

end
