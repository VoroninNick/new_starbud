# t.string :title
# t.string :slug
# t.string :country
# t.integer :brandable_id
# t.string :brandable_type
class Brand < ActiveRecord::Base

  attr_accessible *attribute_names
  belongs_to :brandable, polymorphic: true

  def to_slug
    "#{title.parameterize}"
  end
  def save_slug
    self.slug = to_slug
  end
  before_save :save_slug

  rails_admin do
    visible false
    navigation_label 'Каталог'

    label 'Виробник'
    label_plural 'Виробники'
    # visible false

    edit do
      field :title do
        label 'Назва:'
      end
      field :country do
        label 'Країна походження:'
      end

    end
  end
  # scope :with_public, -> { where(:published => true).order('created_at asc')}

end
