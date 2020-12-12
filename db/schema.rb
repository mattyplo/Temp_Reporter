# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Sensor_Readings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "sensor_id", null: false
    t.datetime "date_time", null: false
    t.decimal "temp", precision: 10, scale: 3, null: false
    t.index ["sensor_id"], name: "fk_sensor_id"
  end

  create_table "Sensors", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "owner", null: false
    t.string "location_city"
    t.date "date_created"
  end

  add_foreign_key "Sensor_Readings", "Sensors", column: "sensor_id", name: "fk_sensor_id"
end
