class Article < ApplicationRecord
    belongs_to :author
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings, dependent: :destroy
    has_attached_file :image, styles: { standard: "600x480>", mobile: "400x280" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    def tag_list
        tags.map { |tag| tag.name }.join(", ")
    end

    def tag_list=(tag_string)
        tag_names = tag_string.split(",").map { |tag| tag.strip.downcase }.uniq
        new_or_found_tags = tag_names.map { |tname| Tag.find_or_create_by(name: tname) }
        self.tags = new_or_found_tags
    end
end
