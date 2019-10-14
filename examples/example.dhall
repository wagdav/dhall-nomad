{- Dhall representation of the job outputted by `$ nomad init` -}

let types = ../types.dhall

let defaults = ../defaults.dhall

let job =
        defaults.Job
      ⫽ { ID = "example"
        , Datacenters = [ "dc1" ]
        , Type = "service"
        , TaskGroups =
            [   defaults.TaskGroup
              ⫽ { Name = "cache"
                , Tasks =
                    [   defaults.Task
                      ⫽ { Driver = "docker"
                        , Name = "redis"
                        , Config =
                            { image = "redis:3.2"
                            , port_map = [ toMap { db = 6379 } ]
                            }
                        , Services =
                            [   defaults.Service
                              ⫽ { Name = "redis-cache"
                                , PortLabel = "db"
                                , Tags = [ "global", "cache" ]
                                }
                            ]
                        , Resources =
                              defaults.Resources
                            ⫽ { Networks =
                                  [   defaults.Network
                                    ⫽ { DynamicPorts =
                                          [ { Label = "db", Value = 0 } ]
                                      }
                                  ]
                              }
                        }
                    ]
                }
            ]
        }

in  ../render.dhall job
