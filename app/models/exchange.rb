class Exchange < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path "config"

  has_many :companies
end