// To parse this JSON data, do
//
//     final drivingResponse = drivingResponseFromJson(jsonString);

import 'dart:convert';

DrivingResponse drivingResponseFromJson(String str) => DrivingResponse.fromJson(json.decode(str));

String drivingResponseToJson(DrivingResponse data) => json.encode(data.toJson());

class DrivingResponse {
    DrivingResponse({
        this.routes,
        this.waypoints,
        this.code,
        this.uuid,
    });

    List<Route> routes;
    List<Waypoint> waypoints;
    String code;
    String uuid;

    factory DrivingResponse.fromJson(Map<String, dynamic> json) => DrivingResponse(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        waypoints: List<Waypoint>.from(json["waypoints"].map((x) => Waypoint.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
    };
}

class Route {
    Route({
        this.weightName,
        this.legs,
        this.geometry,
        this.distance,
        this.duration,
        this.weight,
    });

    String weightName;
    List<Leg> legs;
    String geometry;
    double distance;
    double duration;
    double weight;

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        weightName: json["weight_name"],
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        geometry: json["geometry"],
        distance: json["distance"].toDouble(),
        duration: json["duration"].toDouble(),
        weight: json["weight"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "geometry": geometry,
        "distance": distance,
        "duration": duration,
        "weight": weight,
    };
}

class Leg {
    Leg({
        this.summary,
        this.steps,
        this.distance,
        this.duration,
        this.weight,
    });

    String summary;
    List<dynamic> steps;
    double distance;
    double duration;
    double weight;

    factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        summary: json["summary"],
        steps: List<dynamic>.from(json["steps"].map((x) => x)),
        distance: json["distance"].toDouble(),
        duration: json["duration"].toDouble(),
        weight: json["weight"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "summary": summary,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "distance": distance,
        "duration": duration,
        "weight": weight,
    };
}

class Waypoint {
    Waypoint({
        this.distance,
        this.name,
        this.location,
    });

    double distance;
    String name;
    List<double> location;

    factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"].toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
    };
}
