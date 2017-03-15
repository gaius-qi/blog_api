module SoftDelete
  extend ActiveSupport::Concern

  include do
    default_scope -> { where(delete_at: nil) }

    alias_method :destory!, :destory
  end

  def destory
    run_callbacks(:destory) do
      if persisted?
        t = Time.now
        update_columns(delete_at: t, updated_at: t)
      end
      @destoryed = true
    end
    freeze
  end

  def deleted?
    delete_at.present?
  end

end