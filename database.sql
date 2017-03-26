CREATE TABLE brands (
  id SERIAL PRIMARY KEY,
  name  varchar(40) NOT NULL
);

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  name VARCHAR(40) NOT NULL,
  CONSTRAINT location_brand_fk FOREIGN KEY (brand_id) REFERENCES brands(id) ON UPDATE CASCADE
);

CREATE TABLE day_parts (
  id SERIAL PRIMARY KEY,
  location_id BIGINT NOT NULL,
  name VARCHAR(40) NOT NULL,
  CONSTRAINT day_parts_location_fk FOREIGN KEY (location_id) REFERENCES locations(id) ON UPDATE CASCADE
);

CREATE TABLE day_part_schedule (
  id SERIAL PRIMARY KEY,
  day_part_id BIGINT NOT NULL,
  hour_of_week INTEGER NOT NULL,
  location_id BIGINT NOT NULL,
  CONSTRAINT day_part_schedule_day_part_fk FOREIGN KEY (day_part_id) REFERENCES day_part(id) ON UPDATE CASCADE,
  CONSTRAINT no_schedult_conflicts UNIQUE(location, hour_of_week)
)

CREATE TABLE order_types (
  id SERIAL PRIMARY KEY,
  location_id BIGINT NOT NULL,
  name VARCHAR(40) NOT NULL,
  CONSTRAINT order_types_location_fk FOREIGN KEY (location_id) REFERENCES locations(id) ON UPDATE CASCADE
);

CREATE TABLE menu_items (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  name VARCHAR(40) NOT NULL,
  CONSTRAINT menu_items_brand_fk FOREIGN KEY (brand_id) REFERENCES brands(id) ON UPDATE CASCADE
);

CREATE TABLE prices (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  location_id BIGINT NOT NULL,
  menu_item_id BIGINT NOT NULL,
  order_type_id BIGINT NOT NULL,
  day_part_id BIGINT NULL,
  price NUMERIC NOT NULL,
  CONSTRAINT prices_day_parts_fk FOREIGN KEY (location_id, day_part_id) REFERENCES day_parts(location_id, id) ON UPDATE CASCADE,
  CONSTRAINT prices_order_types_fk FOREIGN KEY (location_id, order_type_id) REFERENCES order_types(location_id, id) ON UPDATE CASCADE,
  CONSTRAINT prices_menu_items_fk FOREIGN KEY (brand_id, menu_type_id) REFERENCES menu_items(brand_id, id) ON UPDATE CASCADE,
  CONSTRAINT prices_locations FOREIGN KEY (brand_id, location_id) REFERENCES locations(brand_id, id) ON UPDATE_CASCADE
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  location_id BIGINT NOT NULL,

);
