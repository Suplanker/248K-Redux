--local functions
local function config(name)
  return settings.startup['el_ki_memory_' .. name].value
end

local function sprite(name)
  return '__248k-Redux__/ressources/electronic/el_ki/el_ki_memory/el_ki_memory_' .. name
end

--item
data:extend({
  {
    name = 'el_ki_memory_item',
    type = 'item',
    icon = sprite('item.png'),
    icon_size = 64,
    place_result = 'el_ki_memory_entity',
    stack_size = 20,
    subgroup = 'el_item_subgroup_f',
    order = 'a-b',
  },

})

--entity
data:extend({
  --prototype
  {
    name = 'el_ki_memory_entity',
    type = 'assembling-machine',
    icon = sprite('entity_icon.png'),
    icon_size = 64,
    flags = { "player-creation", "placeable-neutral" },
    max_health = 300,
    corpse = 'big-remnants',
    collision_box = { { -1.4, -1.4 }, { 1.4, 1.4 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    map_color = { r = 0, g = 0, b = 1, a = 1 },
    minable = {
      mining_time = 1,
      result = 'el_ki_memory_item',
    },
    crafting_categories = { 'el_ki_memory_category' },
    crafting_speed = 1,
    ingredient_count = 2,
    --fixed_recipe = 'el_ki_memory_fluid_recipe',
    energy_source = {
      type = 'electric',
      usage_priority = 'secondary-input',
      input_flow_limit = '5000kW',
    },
    energy_usage = '4000kW',
    fluid_boxes = {
      {
        filter = 'el_ki_memory_fluid',
        base_area = 1,
        height = 2,
        base_level = 1,
        volume = 100,
        pipe_covers = pipecoverspictures(),
        pipe_picture = grey_south_pipe_picture,
        pipe_connections =
        {
          { flow_direction = "output", position = { 0, 1 }, direction = 8 },
        },
        production_type = "output"
      },
    },

    --animation
    graphics_set = {
      animation = {
        north = {
          filename = sprite('entity_animation.png'),
          size = { 480, 484 },
          scale = 0.22,
          line_length = 8,
          frame_count = 4,
          animation_speed = 0.5,
        },
        east = {
          filename = sprite('entity_animation.png'),
          size = { 480, 484 },
          scale = 0.22,
          line_length = 8,
          frame_count = 4,
          animation_speed = 0.5,
        },
        south = {
          filename = sprite('entity_animation.png'),
          size = { 480, 484 },
          scale = 0.22,
          line_length = 8,
          frame_count = 4,
          animation_speed = 0.5,
        },
        west = {
          filename = sprite('entity_animation.png'),
          size = { 480, 484 },
          scale = 0.22,
          line_length = 8,
          frame_count = 4,
          animation_speed = 0.5,
        },
      },
    },
    working_sound = {
      sound = { filename = '__base__/sound/accumulator-idle.ogg' },
      apparent_volume = 1.5,
    },
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(
      universal_connector_template,
      {
        { variation = 2,  main_offset = util.by_pixel(39.875, -11.625),  shadow_offset = util.by_pixel(39.875, -11.625),  show_shadow = true },
        { variation = 2,  main_offset = util.by_pixel(39.875, -11.625),  shadow_offset = util.by_pixel(39.875, -11.625),  show_shadow = true },
        { variation = 2,  main_offset = util.by_pixel(39.875, -11.625),  shadow_offset = util.by_pixel(39.875, -11.625),  show_shadow = true },
        { variation = 2,  main_offset = util.by_pixel(39.875, -11.625),  shadow_offset = util.by_pixel(39.875, -11.625),  show_shadow = true },
      }
    )
  },
})
