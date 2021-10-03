include 'lib/core'
include 'lib/norns'
include 'lib/grid'
include 'lib/math'
lattice = require("lib/lattice")

g = grid.connect()

--gridwork

seqorlive = nest_ {
    meta = _grid.number {
      x = {15, 16},
      y = 8,
      level = {4, 15}
},

seq = nest_ {
    enabled = function(self)
        return (seqorlive.meta.value == 1)
    end,

    loop_mod = _grid.momentary {
        x = 11,
        y = 8,
        level = {4, 15 } },

    time_mod = _grid.momentary {
        x = 12,
        y = 8,
        level = {4, 15} },

    prob_mod = _grid.momentary {
        x = 13,
        y = 8,
        level = {4, 15} },

    tab = _grid.number {
        x = {6, 9},
        y = 8,
        level = {4, 15} },

    track = _grid.number {
        x = {1, 4},
        y = 8,
        level = {4, 15}
        },

    gate_tab = nest_ {

        enabled = function(self)
            return (seqorlive.seq.tab.value == 1 and
                    seqorlive.seq.time_mod.value == 0)
        end,

        gate_page = nest_ {

            gaterange_1 = _grid.range {
                x = {1, 16},
                y = 1,
                z = -1,
                level = 4,

                value = function()
                    return { params:get('gate sequence start 1'), params:get('gate sequence end 1') }
                    end,

                action = function(s, v)
                    params:set('gate sequence start 1', v[1])
                    params:set('gate sequence end 1', v[2])
                    end,

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 1 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                end},

            gaterange_2 = _grid.range {
                x = {1, 16},
                y = 2,
                z = -1,
                level = 4,

                value = function()
                    return { params:get('gate sequence start 2'), params:get('gate sequence end 2') }
                    end,

                action = function(s, v)
                    params:set('gate sequence start 2', v[1])
                    params:set('gate sequence end 2', v[2])
                    end,

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 1 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                    end},

            gaterange_3 = _grid.range {
                x = {1, 16},
                y = 3,
                z = -1,
                level = 4,

                value = function()
                    return { params:get('gate sequence start 3'), params:get('gate sequence end 3') }
                    end,

                action = function(s, v)
                    params:set('gate sequence start 3', v[1])
                    params:set('gate sequence end 3', v[2])
                    end,

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 1 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                end},

            gaterange_4 = _grid.range {
                x = {1, 16},
                y = 4,
                z = -1,
                level = 4,

                value = function()
                    return { params:get('gate sequence start 4'), params:get('gate sequence end 4') }
                    end,

                action = function(s, v)
                    params:set('gate sequence start 4', v[1])
                    params:set('gate sequence end 4', v[2])
                    end,

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 1 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                    end},

            gatefield_5 = nest_(16):each(function(i,v)

                return _grid.toggle {
                  x = i,
                  y = 1,

                  controlspec = params:lookup_param('gate 1 ' ..i).controlspec,
                  value = function() return params:get('gate 1 ' ..i) end,
                  action = function(s,v) params:set('gate 1 ' ..i, v)
                    print(params:get('gate 1 1'))
                    end,

                  enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                  end,}end),

            gatefield_6 = nest_(16):each(function(i,v)

                return _grid.toggle {
                  x = i,
                  y = 2,

                  controlspec = params:lookup_param('gate 2 ' ..i).controlspec,
                  value = function() return params:get('gate 2 ' ..i) end,
                  action = function(s,v) params:set('gate 2 ' ..i, v) end,

                  enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                  end,}end),

            gatefield_7 = nest_(16):each(function(i,v)

                return _grid.toggle {
                  x = i,
                  y = 3,

                  controlspec = params:lookup_param('gate 3 ' ..i).controlspec,
                  value = function() return params:get('gate 3 ' ..i) end,
                  action = function(s,v) params:set('gate 3 ' ..i, v) end,

                  enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                  end,}end),

            gatefield_8 = nest_(16):each(function(i,v)

                return _grid.toggle {
                  x = i,
                  y = 4,

                  controlspec = params:lookup_param('gate 4 ' ..i).controlspec,
                  value = function() return params:get('gate 4 ' ..i) end,
                  action = function(s,v) params:set('gate 4 ' ..i, v) end,

                  enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.prob_mod.value == 0)
                  end,}end),

    },

        gate_prob_1 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.track.value == 1 and
                            seqorlive.seq.prob_mod.value == 1)
                    end,
                }end),

        gate_prob_2 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.track.value == 2 and
                            seqorlive.seq.prob_mod.value == 1)
                    end,
                }end),

        gate_prob_3 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.track.value == 3 and
                            seqorlive.seq.prob_mod.value == 1)
                    end,
                }end),

        gate_prob_4 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},

                enabled = function(self)
                    return (seqorlive.seq.loop_mod.value == 0 and
                            seqorlive.seq.time_mod.value == 0 and
                            seqorlive.seq.track.value == 4 and
                            seqorlive.seq.prob_mod.value == 1)
                    end,
                }end),


        }},

         gate_clocks = nest_(4):each(function(i,v)

            return _grid.number {
                x = {1, 16},
                y = i,
                level = {0,4},

                controlspec = params:lookup_param('gate div ' ..i).controlspec,
                value = function() return params:get('gate div ' ..i) end,
                action = function(s, v) params:set('gate div ' ..i, v) end,

            enabled = function(self)
                return (seqorlive.seq.tab.value == 1 and
                        seqorlive.seq.loop_mod.value == 0 and
                        seqorlive.seq.time_mod.value == 1 and
                        seqorlive.seq.prob_mod.value == 0)
                end}
                end),

--interval stuff starts here
    interval_tab_1 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 2 and
                    seqorlive.seq.track.value == 1)
            end,

            interval_dots_1 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('interval 1 ' ..i).controlspec,
                    value = function() return params:get('interval 1 ' ..i) end,
                    action = function(s, v) params:set('interval 1 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            interval_prob_1 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            interval_clock_1 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            interval_loop_1 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('interval sequence start 1'), params:get('interval sequence end 1') }
                    end,

                action = function(s, v)
                    params:set('interval sequence start 1', v[1])
                    params:set('interval sequence end 1', v[2])
                    end,
            }



        },

    interval_tab_2 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 2 and
                    seqorlive.seq.track.value == 2)
            end,

            interval_dots_2 = nest_(16):each(function(i,v)

                 return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('interval 2 ' ..i).controlspec,
                    value = function() return params:get('interval 2 ' ..i) end,
                    action = function(s, v) params:set('interval 2 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            interval_prob_2 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            interval_clock_2 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            interval_loop_2 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('interval sequence start 2'), params:get('interval sequence end 2') }
                    end,

                action = function(s, v)
                    params:set('interval sequence start 2', v[1])
                    params:set('interval sequence end 2', v[2])
                    end,
            }},



    interval_tab_3 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 2 and
                    seqorlive.seq.track.value == 3)
            end,

            interval_dots_3 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('interval 3 ' ..i).controlspec,
                    value = function() return params:get('interval 3 ' ..i) end,
                    action = function(s, v) params:set('interval 3 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            interval_prob_3 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            interval_clock_3 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            interval_loop_3 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('interval sequence start 3'), params:get('interval sequence end 3') }
                    end,

                action = function(s, v)
                    params:set('interval sequence start 3', v[1])
                    params:set('interval sequence end 3', v[2])
                    end,
            }
    },

      interval_tab_4 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 2 and
                    seqorlive.seq.track.value == 4)
            end,

            interval_dots_4 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('interval 4 ' ..i).controlspec,
                    value = function() return params:get('interval 4 ' ..i) end,
                    action = function(s, v) params:set('interval 4 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            interval_prob_4 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            interval_clock_4 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            interval_loop_4 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('interval sequence start 4'), params:get('interval sequence end 4') }
                    end,

                action = function(s, v)
                    params:set('interval sequence start 4', v[1])
                    params:set('interval sequence end 4', v[2])
                    end,
            }
    },

--here be octaves
    octave_tab_1 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 3 and
                    seqorlive.seq.track.value == 1)
            end,

            octave_dots_1 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {2, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('octave 1 ' ..i).controlspec,
                    value = function() return params:get('octave 1 ' ..i) end,
                    action = function(s, v) params:set('octave 1 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            octave_prob_1 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            octave_clock_1 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            octave_loop_1 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('octave sequence start 1'), params:get('octave sequence end 1') }
                    end,

                action = function(s, v)
                    params:set('octave sequence start 1', v[1])
                    params:set('octave sequence end 1', v[2])
                    end,


            },

            octave_offset_1 = _grid.number {
                x = {1, 6},
                y = 1,
                level = {2, 4},
                controlspec = params:lookup_param('track octave 1').controlspec,
                value = function() return params:get('track octave 1') end,
                action = function(s, v) params:set('track octave 1', v) end,
                enabled = function(self)
                    return (seqorlive.seq.prob_mod.value == 0)
                    end
            }



        },

    octave_tab_2 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 3 and
                    seqorlive.seq.track.value == 2)
            end,

            octave_dots_2 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {2, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('octave 2 ' ..i).controlspec,
                    value = function() return params:get('octave 2 ' ..i) end,
                    action = function(s, v) params:set('octave 2 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            octave_prob_2 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            octave_clock_2 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            octave_loop_2 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('octave sequence start 2'), params:get('octave sequence end 2') }
                    end,

                action = function(s, v)
                    params:set('octave sequence start 2', v[1])
                    params:set('octave sequence end 2', v[2])
                    end,
            },

            octave_offset_2 = _grid.number {
                x = {1, 6},
                y = 1,
                level = {2, 4},
                controlspec = params:lookup_param('track octave 2').controlspec,
                value = function() return params:get('track octave 2') end,
                action = function(s, v) params:set('track octave 2', v) end,
                enabled = function(self)
                    return (seqorlive.seq.prob_mod.value == 0)
                    end
            }


    },



    octave_tab_3 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 3 and
                    seqorlive.seq.track.value == 3)
            end,

            octave_dots_3 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {2, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('octave 3 ' ..i).controlspec,
                    value = function() return params:get('octave 3 ' ..i) end,
                    action = function(s, v) params:set('octave 3 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            octave_prob_3 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            octave_clock_3 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            octave_loop_3 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('octave sequence start 3'), params:get('octave sequence end 3') }
                    end,

                action = function(s, v)
                    params:set('octave sequence start 3', v[1])
                    params:set('octave sequence end 3', v[2])
                    end,
            },

            octave_offset_3 = _grid.number {
                x = {1, 6},
                y = 1,
                level = {2, 4},
                controlspec = params:lookup_param('track octave 3').controlspec,
                value = function() return params:get('track octave 3') end,
                action = function(s, v) params:set('track octave 3', v) end,
                enabled = function(self)
                    return (seqorlive.seq.prob_mod.value == 0)
                    end
            }
    },

      octave_tab_4 = nest_ {

        enabled = function(self)
            return (seqorlive.meta.value == 1 and
                    seqorlive.seq.tab.value == 3 and
                    seqorlive.seq.track.value == 4)
            end,

            octave_dots_4 = nest_(16):each(function(i,v)

                return _grid.number {
                    x = i,
                    y = {2, 5},
                    level = {0, 4},
                    controlspec = params:lookup_param('octave 4 ' ..i).controlspec,
                    value = function() return params:get('octave 4 ' ..i) end,
                    action = function(s, v) params:set('octave 4 ' ..i, v) end,
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 0)
                        end
                }end),

            octave_prob_4 = nest_(16):each(function(i,v)


                return _grid.number {
                    x = i,
                    y = {1, 5},
                    level = {0, 6},
                    enabled = function(self)
                        return (seqorlive.seq.prob_mod.value == 1)
                        end
                }end),

            octave_clock_4 = _grid.number {
                x = {1, 16},
                y = 7,
                level = {0, 4}
            },

            octave_loop_4 = _grid.range {
                x = {1, 16},
                y = 6,
                level = {0, 4},

                value = function()
                    return { params:get('octave sequence start 4'), params:get('octave sequence end 4') }
                    end,

                action = function(s, v)
                    params:set('octave sequence start 4', v[1])
                    params:set('octave sequence end 4', v[2])
                    end,
            },

            octave_offset_4 = _grid.number {
                x = {1, 6},
                y = 1,
                level = {2, 4},
                controlspec = params:lookup_param('track octave 4').controlspec,
                value = function() return params:get('track octave 4') end,
                action = function(s, v) params:set('track octave 4', v) end,
                enabled = function(self)
                    return (seqorlive.seq.prob_mod.value == 0)
                    end
            }
    },
 }

seqorlive:connect { g = grid.connect() }
function init()
    my_lattice = lattice:new()
 

  gate_transport_1 = my_lattice:new_pattern{
      action = function(t) print(params:get('gate div 1'), t) end,
      division = params:get('gate div 1')
  }

  gate_transport_2 = my_lattice:new_pattern{
      action = function(t) print(params:get('gate div 2'), t) end,
      division = params:get('gate div 2')
  }

    gate_transport_3 = my_lattice:new_pattern{
      action = function(t) print(params:get('gate div 3'), t) end,
      division = params:get('gate div 3')
  }

    gate_transport_4 = my_lattice:new_pattern{
      action = function(t) print(params:get('gate div 4'), t) end,
      division = params:get('gate div 4')
  }

  my_lattice:start()
  seqorlive:init() end