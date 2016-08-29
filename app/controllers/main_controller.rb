class MainController < ApplicationController

  def index
    @vacancy_all = Vacancy.all
    @partners = Partner.where(published: 't').order(position: :asc)
    @personals = OurRepresentative.published
  end

  def about_company
    @vacancy_all = Vacancy.all
    @partners = Partner.where(published: 't').order(position: :asc)
    @cereteficates = OurCertificate.with_public
  end
  def vacancy
    @vacancy = Vacancy.find_by_slug(params[:title])
  end

  def publications
    @featured = Publication.featured
    # @publications = Publication.published
    @publications = Publication.all.to_a * 4 + [Publication.first]

    @tags = Publication.tag_counts
  end
  def publication
    @publication = Publication.find_by_slug(params[:title])
  end

  def contacts
    @personals = OurRepresentative.published
  end

  def become_a_dealer
    data = params.permit(:name, :phone, :email, :company)
    Subscribe.become_a_dealer(data).deliver
    head :ok
  end

  def contact_us
    data = params.permit(:name, :email, :message)
    Subscribe.contact_us(data).deliver
    head :ok
  end

  def dev

  end
end
