let Map =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/Map/package.dhall

let DispatchPayload {- https://www.nomadproject.io/api/json-jobs.html#dispatchpayload -} =
      { File : Text }

let Affinity {- https://www.nomadproject.io/api/json-jobs.html#affinity -} = {}

let Spread {- https://www.nomadproject.io/api/json-jobs.html#spread -} = {}

let Constraint {- https://www.nomadproject.io/api/json-jobs.html#constraint -} =
      {}

let Update {- https://www.nomadproject.io/api/json-jobs.html#update-2 -} =
      { MaxParallel : Natural
      , MinHealthyTime : Natural
      , HealthyDeadline : Natural
      , ProgressDeadLine : Natural
      , AutoRevert : Bool
      , Canary : Natural
      }

let Migrate {- https://www.nomadproject.io/api/json-jobs.html#migrate -} =
      { HealthCheck : Text
      , HealthyDeadline : Natural
      , MaxParallel : Natural
      , MinHealthyTime : Natural
      }

let RestartPolicy {- https://www.nomadproject.io/api/json-jobs.html#restart-policy -} =
      { Attempts : Natural, Interval : Natural, Delay : Natural, Mode : Text }

let EphemeralDisk {- https://www.nomadproject.io/api/json-jobs.html#ephemeral-disk -} =
      { Migrate : Bool, SizeMB : Natural, Sitcky : Bool }

let ReschedulePolicy {- https://www.nomadproject.io/api/json-jobs.html#restart-policy -} =
      { Attempts : Natural
      , Interval : Natural
      , Delay : Natural
      , DelayFunction : Text
      , MaxDelay : Natural
      , Unlimited : Bool
      }

let Device =
      { Name : Text
      , Count : Natural
      , Constraints : List Constraint
      , Affinities : List Affinity
      }

let DynamicPort = { Label : Text, Value : Natural }

let Network = { MBits : Natural, DynamicPorts : List DynamicPort }

let Resources {- https://www.nomadproject.io/api/json-jobs.html#resources-1 -} =
      { CPU : Natural
      , MemoryMB : Natural
      , Networks : List Network
      , Devices : List Device
      }

let ParametrizedJob {- https://www.nomadproject.io/api/json-jobs.html#parameterizedjob -} =
      {}

let Periodic {- https://www.nomadproject.io/api/json-jobs.html#periodic -} = {}

let Artifact {- https://www.nomadproject.io/api/json-jobs.html#artifact -} = {}

let LogConfig {- https://www.nomadproject.io/api/json-jobs.html#log-rotation -} =
      { MaxFiles : Natural, MaxFilesSizeMB : Natural }

let CheckRestart = { Limit : Natural, Grace : Natural, IgnoreWarnings : Bool }

let Check =
      { AddressMode : Text
      , Args : List Text
      , CheckRestart : Optional CheckRestart
      , Command : Text
      , Header : Map.Type Text (List Text)
      , Interval : Natural
      , Method : Text
      , Name : Text
      , Path : Text
      , PortLabel : Text
      , Protocol : Text
      , InitialStatus : Text
      , Timeout : Natural
      , TLSSkipVerify : Bool
      , Type : Text
      }

let Template {- https://www.nomadproject.io/api/json-jobs.html#template -} = {}

let Service {- https://www.nomadproject.io/api/json-jobs.html#services -} =
      { Name : Text
      , Tags : List Text
      , Meta : Map.Type Text Text
      , CanaryTags : List Text
      , PortLabel : Text
      , AddressMode : Text
      , Checks : List Check
      }

let DockerConfig = { image : Text, port_map : List (Map.Type Text Natural) }

let Task {- https://www.nomadproject.io/api/json-jobs.html#task -} =
      { Artifact : List Artifact
      , Config : DockerConfig
      , Constraints : List Constraint
      , Affinities : List Affinity
      , Spreads : List Spread
      , DispatchPayload : Optional DispatchPayload
      , Driver : Text
      , Env : Map.Type Text Text
      , KillSignal : Text
      , KillTimeout : Natural
      , Leader : Bool
      , LogConfig : Optional LogConfig
      , Meta : Map.Type Text Text
      , Name : Text
      , Services : List Service
      , ShutdownDelay : Optional Natural
      , Templates : List Template
      , User : Text
      , Resources : Resources
      }

let TaskGroup {- https://www.nomadproject.io/api/json-jobs.html#task-group -} =
      { Affinities : List Affinity
      , Constraints : List Constraint
      , Count : Natural
      , EphemeralDisk : EphemeralDisk
      , Migrate : Optional Migrate
      , Name : Text
      , RestartPolicy : RestartPolicy
      , ReschedulePolicy : Optional ReschedulePolicy
      , Spreads : List Spread
      , Tasks : List Task
      , Update : Optional Update
      }

let Job {- https://www.nomadproject.io/api/json-jobs.html#job -} =
      { Affinities : List Affinity
      , AllAtOnce : Bool
      , Constraints : List Constraint
      , Datacenters : List Text
      , ID : Text
      , Meta : List Text
      , Migrate : Migrate
      , Namespace : List Text
      , ParametrizedJob : Optional ParametrizedJob
      , Periodic : Optional Periodic
      , Priority : Natural
      , Region : Text
      , ReschedulePolicy : Optional ReschedulePolicy
      , Spreads : List Spread
      , TaskGroups : List TaskGroup
      , Type : Text
      , Update : Update
      }

in  { Affinity = Affinity
    , Artifact = Artifact
    , Check = Check
    , CheckRestart = CheckRestart
    , Constraint = Constraint
    , Device = Device
    , DispatchPayload = DispatchPayload
    , DockerConfig = DockerConfig
    , DynamicPort = DynamicPort
    , Job = Job
    , LogConfig = LogConfig
    , Map = Map
    , Migrate = Migrate
    , Network = Network
    , ParametrizedJob = ParametrizedJob
    , Periodic = Periodic
    , ReschedulePolicy = ReschedulePolicy
    , Resources = Resources
    , RestartPolicy = RestartPolicy
    , Service = Service
    , Spread = Spread
    , TaskGroup = TaskGroup
    , Task = Task
    , Template = Template
    , Update = Update
    }
