--local functions
local function config(name)
  return settings.startup['el_grower_'..name].value
end

local function sprite(name)
  return '__248k-Redux__/ressources/electronic/el_grower/el_grower_'..name
end

--item
data:extend({
  {
      name = 'el_grower_item',
      type = 'item',
      icon = sprite('icon.png'),
      icon_size = 64,
      place_result = 'el_grower_entity',
      stack_size = 20,
      subgroup = 'el_item_subgroup_c',
      order = 'a-b',
  },

})

--entity
data:extend({
--prototype
{
    name = 'el_grower_entity',
    type = 'assembling-machine',
    icon = sprite('icon.png'),
    icon_size = 64,
    flags = {"player-creation","placeable-neutral"},
    max_health = 300,
    corpse = 'big-remnants',
    collision_box = {{-2.4,-2.4},{2.4,2.4}},
    selection_box = {{-2.5,-2.5},{2.5,2.5}},
    map_color = {r=0, g=0, b=1, a=1},
    minable = {
        mining_time = 1,
        result = 'el_grower_item',
    },
    crafting_categories = {'el_grower_category'},
    crafting_speed = 1,
    ingredient_count = 3,
    --fixed_recipe = 'el_water_pressure_recipe',
    energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
    },
    allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 4
        }, 
    energy_usage = '200kW',
    fluid_boxes = {
        {
          base_area = 1,
          height = 2,
          base_level = -1,
          volume = 100,
          pipe_covers = pipecoverspictures(),
          pipe_picture = south_basic_pipe_picture,
          pipe_connections =
          {
            {flow_direction = "input", position = {0, -2}, direction = 0},
          },
          production_type = "input"
        },
        { 
          base_area = 1,
          height = 2,
          base_level = -1,
          volume = 100,
          pipe_covers = pipecoverspictures(),
          pipe_picture = south_basic_pipe_picture,
          pipe_connections =
          {
            {flow_direction = "input", position = {-2, 0}, direction = 12},
          },
          production_type = "input"
        },
        { 
          base_area = 1,
          height = 2,
          base_level = -1,
          volume = 100,
          pipe_covers = pipecoverspictures(),
          pipe_picture = south_basic_pipe_picture,
          pipe_connections =
          {
            {flow_direction = "input", position = {2, 0}, direction = 4},
            --{type = "output", position = {2, -2.5}}
          },
          production_type = "input"
        },
        {
          base_area = 1,
          height = 2,
          base_level = -1,
          volume = 100,
          pipe_covers = pipecoverspictures(),
          pipe_picture = south_basic_pipe_picture,
          pipe_connections =
          {
            {flow_direction = "input", position = {0, 2}, direction = 8},
          },
          production_type = "input"
        },
    },
    --animation
    graphics_set = {
      animation = {
          north = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.32,
              line_length = 3,
              frame_count = 3,
              animation_speed = 0.2,
              shift = {0, -0.2}
          },
          east = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.32,
              line_length = 3,
              frame_count = 3,
              animation_speed = 0.2,
              shift = {0, -0.2}
          },
          south = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.32,
              line_length = 3,
              frame_count = 3,
              animation_speed = 0.2,
              shift = {0, -0.2}
          },
          west = {
              filename = sprite('entity_animation.png'),
              size = {512,512},
              scale = 0.32,
              line_length = 3,
              frame_count = 3,
              animation_speed = 0.2,
              shift = {0, -0.2}
          },
      },
    },
    working_sound =
    {
      sound = {filename = "__base__/sound/chemical-plant-3.ogg" },
      apparent_volume = 0.1,
    },
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(
      universal_connector_template, 
      {
        { variation =  4, main_offset = util.by_pixel(-8.625, -62.875), shadow_offset = util.by_pixel(-8.625, -62.875), show_shadow = true },
        { variation =  4, main_offset = util.by_pixel(-8.625, -62.875), shadow_offset = util.by_pixel(-8.625, -62.875), show_shadow = true },
        { variation =  4, main_offset = util.by_pixel(-8.625, -62.875), shadow_offset = util.by_pixel(-8.625, -62.875), show_shadow = true },
        { variation =  4, main_offset = util.by_pixel(-8.625, -62.875), shadow_offset = util.by_pixel(-8.625, -62.875), show_shadow = true },
      }
    )
},
})