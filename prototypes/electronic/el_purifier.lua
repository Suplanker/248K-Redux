--local functions
local function config(name)
    return settings.startup['el_purifier_'..name].value
end

local function sprite(name)
    return '__248k-Redux__/ressources/electronic/el_purifier/el_purifier_'..name
end

--item
data:extend({
    {
        name = 'el_purifier_item',
        type = 'item',
        icon = sprite('icon.png'),
        icon_size = 64,
        place_result = 'el_purifier_entity',
        stack_size = 20,
        subgroup = 'el_item_subgroup_c',
        order = 'a-b',
    },

})

--entity
data:extend({
  --prototype
  {
      name = 'el_purifier_entity',
      type = 'assembling-machine',
      icon = sprite('icon.png'),
      icon_size = 64,
      flags = {"player-creation","placeable-neutral"},
      max_health = 300,
      corpse = 'big-remnants',
      collision_box = {{-3.4,-3.4},{3.4,3.4}},
      selection_box = {{-3.5,-3.5},{3.5,3.5}},
      map_color = {r=0, g=0, b=1, a=1},
      minable = {
          mining_time = 1,
          result = 'el_purifier_item',
      },
      crafting_categories = {'el_purifier_category'},
      crafting_speed = 1,
      ingredient_count = 2,
      --fixed_recipe = 'el_water_pressure_recipe',
      energy_source = {
          type = 'electric',
          usage_priority = 'secondary-input',
      },
      allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_info_icon_shift = {
              0,
              0.8
            },
            module_slots = 2
        }, 
      energy_usage = '40kW',
      fluid_boxes = {
          {
            filter = 'water',
            base_area = 1,
            height = 2,
            base_level = -1,
            volume = 100,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {flow_direction = "input", position = {0, -3}, direction = 0},
            },
            production_type = "input"
          },
          { 
            filter = 'water',
            base_area = 1,
            height = 2,
            base_level = -1,
            volume = 100,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {flow_direction = "input", position = {-3, 0}, direction = 12},
            },
            production_type = "input"
          },
          { 
            filter = 'el_dirty_water',
            base_area = 1,
            height = 2,
            base_level = 1,
            volume = 100,
            pipe_covers = pipecoverspictures(),
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {flow_direction = "output", position = {3, 0}, direction = 4},
              --{type = "output", position = {2, -2.5}}
            },
            production_type = "output"
          },
          {
            filter = 'el_dirty_water',
            base_area = 1,
            height = 2,
            base_level = 1,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_picture = grey_south_pipe_picture,
            pipe_connections =
            {
              {flow_direction = "output", position = {0, 3}, direction = 8},
            },
            production_type = "output"
          },
      },
      --animation
      graphics_set = {
        animation = {
          filename = sprite('entity_base.png'),
          size = {512,512},
          scale = 0.54,
          line_length = 1,
          --lines_per_file = 2,
          frame_count = 1,
          --animation_speed = 0.2,
          shift = {0,-0.3} 
        },
        working_visualisations = {
          {
            animation = 
            {
              filename = sprite('entity_overlay.png'),
              size = {512,512},
              scale = 0.54,
              line_length = 3,
              lines_per_file = 3,
              frame_count = 9,
              animation_speed = 0.2,
              shift = {0,-0.3} 
            }
          }
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
        { variation =  0, main_offset = util.by_pixel( 58.75, -129.25), shadow_offset = util.by_pixel( 58.75, -129.25), show_shadow = true },
        { variation =  0, main_offset = util.by_pixel( 58.75, -129.25), shadow_offset = util.by_pixel( 58.75, -129.25), show_shadow = true },
        { variation =  0, main_offset = util.by_pixel( 58.75, -129.25), shadow_offset = util.by_pixel( 58.75, -129.25), show_shadow = true },
        { variation =  0, main_offset = util.by_pixel( 58.75, -129.25), shadow_offset = util.by_pixel( 58.75, -129.25), show_shadow = true },
      }
    )
  },
})

--{
--    production_type = "input",
    --pipe_picture = assembler2pipepictures(),
    --pipe_covers = pipecoverspictures(),
--    base_area = 10,
--    base_level = -1,
--    pipe_connections = {
--        { type="input", position = {-2, -2,5} },
--        { type="input", position = {2, -2.5} },
--    },
--  },
--  {
--    production_type = "output",
    --pipe_picture = assembler2pipepictures(),
    --pipe_covers = pipecoverspictures(),
--    base_area = 10,
--    base_level = 1,
--    pipe_connections = {{ type="output", position = {2, 2.5} }},
--  },
--  off_when_no_fluid_recipe = true