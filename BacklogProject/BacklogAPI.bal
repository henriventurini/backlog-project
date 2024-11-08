import ballerina/http;
// import ballerina/time;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

listener http:Listener httpListener = new (8080);

configurable DatabaseConfig databaseConfig = ?;

mysql:Client gamesBacklogDB = check new(...databaseConfig);

service /backlog on httpListener{
    resource function get games() returns Games[]|ErrorDetails|error{
        stream<Games, sql:Error?> gamesStream = gamesBacklogDB->query(`SELECT id, name, description FROM games;`);
        // ErrorDetails errorDetails = {code: "500", message: "Erro ao buscar informações", details: "GET /backlog/games", currentyTime: time:utcNow()};
        return from var game in gamesStream select game;
    }
}

