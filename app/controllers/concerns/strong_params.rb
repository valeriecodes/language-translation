module StrongParams
  protected
  def article_params
    params.require(:article).permit(:category_id, :english, :phonetic, :picture, :remove_picture, :language_id).tap do |whitelisted|
      whitelisted[:language_id] = Language.where(name: current_user.lang).first.try(:id) if current_user.has_role? :contributor, :any
      whitelisted[:state] = params[:article][:state] if can?(:delete, Article)
    end
  end
end
