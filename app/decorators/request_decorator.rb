class RequestDecorator < Draper::Decorator
  delegate_all

  def shop_url
    if (object.shop_url.blank?)
      "希望なし"
    end
  end

  def atmosphere_string
    if (object.atmosphere < 50)
      "しっぽり会話を楽しみながら飲みたい!"
    elsif (object.atmosphere > 50)
      "ワイワイ騒ぎながら飲みたい！"
    else
      "静かすぎず、騒ぎすぎず、程よく飲みたい！"
    end 
  end

end
