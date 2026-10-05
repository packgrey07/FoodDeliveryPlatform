import ballerina/http;
import ballerina/io;

type Restaurant record {|
    int id;
    string name;
    string status;
|};

Restaurant[] restaurants = [{id: 1, name: "Pizza Hut", status: "ACTIVE"}, {id: 2, name: "KFC", status: "ACTIVE"}];

service / on new http:Listener(8087) {
    resource function get restaurants() returns Restaurant[] {
        return restaurants;
    }
    resource function post restaurants(@http:Payload Restaurant r) returns Restaurant {
        restaurants.push(r);
        io:println("EVENT: ADMIN - New restaurant added: " + r.name);
        return r;
    }
    resource function get stats() returns json {
        return {totalRestaurants: restaurants.length(), totalOrders: 0, status: "UP"};
    }
}
