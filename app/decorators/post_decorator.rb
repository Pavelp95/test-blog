class PostDecorator < Draper::Decorator
  delegate_all

  def time_set
    created_at.to_date.strftime("%d %B, %Y")
  end


end
