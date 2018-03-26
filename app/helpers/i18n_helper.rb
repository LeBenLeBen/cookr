module I18nHelper

  def possessive(owner, thing)
    t(owner.last == 's' ? :'i18n_helper.possessive_s' : :'i18n_helper.possessive',
      :owner => owner,
      :thing => thing,
      :default => :'i18n_helper.possessive') if owner.present?
  end

end
