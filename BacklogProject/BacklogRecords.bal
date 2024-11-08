import ballerina/time;

// Records for BacklogAPI

type ErrorDetails record {|
    string code;
    string message;
    string details;
    time:Utc currentyTime;
|};

type DatabaseConfig record {|
    string host;
    string user;
    string password;
    string database;
    int port;
|};

type Games record {|
    readonly int id;
    string name;
    string description;
    string hoursPlayed;
    decimal grade;
    string commment;
    string status;
|};
