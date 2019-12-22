module I18nHelper
  def possessive(owner, thing)
    if owner.present?
      t(
        if owner.last == 's'
          :'i18n_helper.possessive_s'
        else
          :'i18n_helper.possessive'
        end,
        owner: owner, thing: thing, default: :'i18n_helper.possessive'
      )
    end
  end
end
