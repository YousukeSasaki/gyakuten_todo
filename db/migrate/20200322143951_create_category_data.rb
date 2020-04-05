class CreateCategoryData < ActiveRecord::Migration[5.2]
  def up
    Category.create(name: "カテゴリー１", color_code: "#ff0000")
    Category.create(name: "カテゴリー２", color_code: "#ffa500")
    Category.create(name: "カテゴリー３", color_code: "#ffff00")
    Category.create(name: "カテゴリー４", color_code: "#90ee90")
    Category.create(name: "カテゴリー５", color_code: "#008000")
    Category.create(name: "カテゴリー６", color_code: "#87ceeb")
    Category.create(name: "カテゴリー７", color_code: "#0000ff")
    Category.create(name: "カテゴリー８", color_code: "#9400d3")
    Category.create(name: "カテゴリー９", color_code: "#ffc0cb")
    Category.create(name: "カテゴリー１０", color_code: "#a52a2a")
    Category.create(name: "カテゴリー１１", color_code: "#808080")
    Category.create(name: "カテゴリー１２", color_code: "#000000")
  end

  def down
    Category.delete_all
  end
end
