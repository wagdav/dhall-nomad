let types = ./types.dhall

let ReschedulePolicy =
        { Attempts = 10
        , Interval = 0
        , Delay = 30000000000
        , DelayFunction = "exponential"
        , MaxDelay = 3600000000000
        , Unlimited = True
        }
      : types.ReschedulePolicy

let Update =
        { MaxParallel = 1
        , MinHealthyTime = 10000000000
        , HealthyDeadline = 180000000000
        , ProgressDeadLine = 600000000000
        , AutoRevert = False
        , Canary = 0
        }
      : types.Update

let RestartPolicy =
        { Interval = 1800000000000
        , Attempts = 2
        , Delay = 15000000000
        , Mode = "fail"
        }
      : types.RestartPolicy

let Migrate =
        { HealthCheck = "checks"
        , HealthyDeadline = 300000000000
        , MaxParallel = 1
        , MinHealthyTime = 10000000000
        }
      : types.Migrate

let Check =
        { AddressMode = ""
        , Args = [] : List Text
        , Command = ""
        , Header = types.Map.empty Text (List Text)
        , Name = "alive"
        , Path = ""
        , Method = ""
        , PortLabel = ""
        , Interval = 10000000000
        , Protocol = ""
        , Timeout = 2000000000
        , TLSSkipVerify = False
        , InitialStatus = ""
        , Type = "tcp"
        , CheckRestart = None types.CheckRestart
        }
      : types.Check

let Service =
        { Name = "redis-cache"
        , Tags = [ "global", "cache" ]
        , Meta = toMap { meta = "for my service" }
        , CanaryTags = [] : List Text
        , PortLabel = "db"
        , AddressMode = ""
        , Checks = [ Check ]
        }
      : types.Service

let Resources =
      { CPU = 500
      , MemoryMB = 256
      , Networks =
          [ { MBits = 10, DynamicPorts = [ { Label = "db", Value = 0 } ] } ]
      , Devices = [] : List types.Device
      }

let Task =
        { Artifact = [] : List types.Artifact
        , Config = { image = "redis:3.2", port_map = [ toMap { db = 6379 } ] }
        , Constraints = [] : List types.Constraint
        , Affinities = [] : List types.Affinity
        , Spreads = [] : List types.Spread
        , DispatchPayload = None types.DispatchPayload
        , Driver = "docker"
        , Env = types.Map.empty Text Text
        , KillSignal = "SIGINT"
        , KillTimeout = 5000000000
        , Leader = False
        , LogConfig = None types.LogConfig
        , Meta = types.Map.empty Text Text
        , Name = "redis"
        , Services = [ Service ]
        , ShutdownDelay = None Natural
        , Templates = [] : List types.Template
        , User = ""
        , Resources = Resources
        }
      : types.Task

let EphemeralDisk = { Migrate = False, SizeMB = 300, Sitcky = False }

let TaskGroup =
        { Constraints = [] : List types.Constraint
        , Affinities = [] : List types.Affinity
        , Spreads = [] : List types.Spread
        , Count = 1
        , Migrate = Migrate
        , Name = "cache"
        , RestartPolicy = RestartPolicy
        , ReschedulePolicy = None types.ReschedulePolicy
        , Tasks = [ Task ]
        , Update = Update
        , EphemeralDisk = EphemeralDisk
        }
      : types.TaskGroup

let Job =
        { AllAtOnce = False
        , Constraints = [] : List types.Constraint
        , Affinities = [] : List types.Affinity
        , Spreads = [] : List types.Spread
        , Datacenters = [ "dc1" ]
        , TaskGroups = [ TaskGroup ]
        , Meta = [] : List Text
        , Namespace = [] : List Text
        , ParametrizedJob = None types.ParametrizedJob
        , Priority = 50
        , Region = "global"
        , Type = "service"
        , Update = None types.Update
        , Periodic = None types.Periodic
        , ReschedulePolicy = None types.ReschedulePolicy
        , ID = "example"
        }
      : types.Job

in  { Job = Job }
