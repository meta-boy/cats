// To parse this JSON data, do
//
//     final randomCats = randomCatsFromJson(jsonString);

import 'dart:convert';

List<RandomCats> randomCatsFromJson(String str) => List<RandomCats>.from(json.decode(str).map((x) => RandomCats.fromJson(x)));

String randomCatsToJson(List<RandomCats> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RandomCats {
    RandomCats({
        this.breeds,
        this.categories,
        this.id,
        this.url,
        this.width,
        this.height,
    });

    List<Breed> breeds;
    List<Category> categories;
    String id;
    String url;
    int width;
    int height;

    factory RandomCats.fromJson(Map<String, dynamic> json) => RandomCats(
        breeds: List<Breed>.from(json["breeds"].map((x) => Breed.fromJson(x))),
        categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
        "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "width": width,
        "height": height,
    };
}

class Breed {
    Breed({
        this.weight,
        this.id,
        this.name,
        this.cfaUrl,
        this.vetstreetUrl,
        this.vcahospitalsUrl,
        this.temperament,
        this.origin,
        this.countryCodes,
        this.countryCode,
        this.description,
        this.lifeSpan,
        this.indoor,
        this.altNames,
        this.adaptability,
        this.affectionLevel,
        this.childFriendly,
        this.dogFriendly,
        this.energyLevel,
        this.grooming,
        this.healthIssues,
        this.intelligence,
        this.sheddingLevel,
        this.socialNeeds,
        this.strangerFriendly,
        this.vocalisation,
        this.experimental,
        this.hairless,
        this.natural,
        this.rare,
        this.rex,
        this.suppressedTail,
        this.shortLegs,
        this.wikipediaUrl,
        this.hypoallergenic,
        this.lap,
    });

    Weight weight;
    String id;
    String name;
    String cfaUrl;
    String vetstreetUrl;
    String vcahospitalsUrl;
    String temperament;
    String origin;
    String countryCodes;
    String countryCode;
    String description;
    String lifeSpan;
    int indoor;
    String altNames;
    int adaptability;
    int affectionLevel;
    int childFriendly;
    int dogFriendly;
    int energyLevel;
    int grooming;
    int healthIssues;
    int intelligence;
    int sheddingLevel;
    int socialNeeds;
    int strangerFriendly;
    int vocalisation;
    int experimental;
    int hairless;
    int natural;
    int rare;
    int rex;
    int suppressedTail;
    int shortLegs;
    String wikipediaUrl;
    int hypoallergenic;
    int lap;

    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        weight: Weight.fromJson(json["weight"]),
        id: json["id"],
        name: json["name"],
        cfaUrl: json["cfa_url"] == null ? null : json["cfa_url"],
        vetstreetUrl: json["vetstreet_url"] == null ? null : json["vetstreet_url"],
        vcahospitalsUrl: json["vcahospitals_url"] == null ? null : json["vcahospitals_url"],
        temperament: json["temperament"],
        origin: json["origin"],
        countryCodes: json["country_codes"],
        countryCode: json["country_code"],
        description: json["description"],
        lifeSpan: json["life_span"],
        indoor: json["indoor"],
        altNames: json["alt_names"] == null ? null : json["alt_names"],
        adaptability: json["adaptability"],
        affectionLevel: json["affection_level"],
        childFriendly: json["child_friendly"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        grooming: json["grooming"],
        healthIssues: json["health_issues"],
        intelligence: json["intelligence"],
        sheddingLevel: json["shedding_level"],
        socialNeeds: json["social_needs"],
        strangerFriendly: json["stranger_friendly"],
        vocalisation: json["vocalisation"],
        experimental: json["experimental"],
        hairless: json["hairless"],
        natural: json["natural"],
        rare: json["rare"],
        rex: json["rex"],
        suppressedTail: json["suppressed_tail"],
        shortLegs: json["short_legs"],
        wikipediaUrl: json["wikipedia_url"],
        hypoallergenic: json["hypoallergenic"],
        lap: json["lap"] == null ? null : json["lap"],
    );

    Map<String, dynamic> toJson() => {
        "weight": weight.toJson(),
        "id": id,
        "name": name,
        "cfa_url": cfaUrl == null ? null : cfaUrl,
        "vetstreet_url": vetstreetUrl == null ? null : vetstreetUrl,
        "vcahospitals_url": vcahospitalsUrl == null ? null : vcahospitalsUrl,
        "temperament": temperament,
        "origin": origin,
        "country_codes": countryCodes,
        "country_code": countryCode,
        "description": description,
        "life_span": lifeSpan,
        "indoor": indoor,
        "alt_names": altNames == null ? null : altNames,
        "adaptability": adaptability,
        "affection_level": affectionLevel,
        "child_friendly": childFriendly,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "grooming": grooming,
        "health_issues": healthIssues,
        "intelligence": intelligence,
        "shedding_level": sheddingLevel,
        "social_needs": socialNeeds,
        "stranger_friendly": strangerFriendly,
        "vocalisation": vocalisation,
        "experimental": experimental,
        "hairless": hairless,
        "natural": natural,
        "rare": rare,
        "rex": rex,
        "suppressed_tail": suppressedTail,
        "short_legs": shortLegs,
        "wikipedia_url": wikipediaUrl,
        "hypoallergenic": hypoallergenic,
        "lap": lap == null ? null : lap,
    };
}

class Weight {
    Weight({
        this.imperial,
        this.metric,
    });

    String imperial;
    String metric;

    factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };
}

class Category {
    Category({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
