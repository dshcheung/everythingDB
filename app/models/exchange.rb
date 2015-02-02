class Exchange < ActiveYaml::Base
  include ActiveHash::Associations

  set_root_path "config"

  has_many :chinese_companies
  has_many :american_companies
end