# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/Defining-Abilities.md

    if user.present?
      # Super admin ability
      if user.super_admin?
        can :manage, :all
      end

      # Admin daerah ability
      if user.daerah?
        can :read, :all
        can :manage, User # Bisa CRUD akun
        can :manage, Desa
        can :manage, Kelompok
        can :manage, Person
      end

      # Admin desa ability
      if user.desa?
        kelompok_ids = user.desa.kelompoks.ids

        can :manage, Kelompok, desa_id: user.desa_id
        can :manage, Person, kelompok_id: kelompok_ids
      end

      # Admin kelompok ability
      if user.kelompok?
        can :manage, Person, desa_id: user.kelompok_id
      end
    end
  end
end
