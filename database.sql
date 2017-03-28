CREATE TABLE brands (
  id SERIAL PRIMARY KEY,
  name  varchar(40) NOT NULL
);

CREATE TABLE price_levels (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  name VARCHAR(40) NOT NULL,
  CONSTRAINT price_levels_brand_fk FOREIGN KEY (brand_id) REFERENCES brands(id) ON UPDATE CASCADE
);

CREATE TABLE order_types (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  name VARCHAR(40) NOT NULL,
  CONSTRAINT order_types_brand_fk FOREIGN KEY (brand_id) REFERENCES brands(id) ON UPDATE CASCADE
);

CREATE TABLE menu_items (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  name VARCHAR(40) NOT NULL,
  CONSTRAINT menu_items_brand_fk FOREIGN KEY (brand_id) REFERENCES brands(id) ON UPDATE CASCADE
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

CREATE TABLE prices (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  menu_item_id BIGINT NOT NULL,
  price_level_id BIGINT NOT NULL,
  price NUMERIC NOT NULL,
  CONSTRAINT prices_menu_items_fk FOREIGN KEY (brand_id, menu_type_id) REFERENCES menu_items(brand_id, id) ON UPDATE CASCADE,
  CONSTRAINT prices_price_levels_fk FOREIGN KEY (brand_id, price_level_id) REFERENCES price_levels(brand_id, id) ON UPDATE CASCADE,
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  brand_id BIGINT NOT NULL,
  price_id BIGINT NOT NULL,
  order_type_id BIGINT NOT NULL,
  location_id BIGINT NOT NULL,
  day_part_id BIGINT REFERENCES day_parts,
  CONSTRAINT product_prices_fk FOREIGN KEY (brand_id, price_id) REFERENCES prices(brand_id, id) ON UPDATE CASCADE,
  CONSTRAINT product_order_types_fk FOREIGN KEY (brand_id, order_type_id) REFERENCES order_types(brand_id, id) ON UPDATE CASCADE,
  CONSTRAINT product_locations_fk FOREIGN KEY (brand_id, location_id) REFERENCES locations(brand_id, id) ON UPDATE CASCADE
);
