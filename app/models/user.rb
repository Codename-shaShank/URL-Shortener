# TODO(deps): Review usages of 'timeout' in this file for version-specific changes.
# TODO(deps): Review usages of 'rack' in this file for version-specific changes.
# TODO(deps): Review usages of 'devise' in this file for version-specific changes.
# TODO(deps): Review usages of 'pp' in this file for version-specific changes.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :links, dependent: :destroy
end
