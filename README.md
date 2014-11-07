Boris Bikes
===========

Day 2 at Makers Academy

As an introduction to OOP and OOD we were instructed to create a simple system to manage Boris Bikes. The aim was to ensure that the system would:

- Keep track of a number of docking stations
- Keep track of a numebr of bikes
- Bikes can be rented and returned
- Bikes can break and be unavailable for rental
- A garage will be able to fix bikes
- A van will transport bikes between the garage and docking station. 

Stages:
-------

1. Building a domain model
2. Setting up the project & building the bike
3. Refactoring
4. Building the docking station
5. Discussing Van & Garage
6. Extracting common functionality to a module
7. Exercises

There were five other people in our team when discussing the domain model. Chris, Ming, Alan, Pavel, Rich

Domain model:

>We are building a system that manages **bikes** that can be *rented* by **users** from **docking stations** and *returned* there at the end of the **rental**. The **bikes** can *break* while being used, in which case they will not be *available* for **rental** after they are returned. There is a **garage** that can *fix* *broken* **bikes**. A **van** is used to *move* broken bikes from the **stations** to the **garage**. It can also be used to take fixed **bikes** back to the **station(s)**. The **van**, all **stations** and the **garage** have fixed *capacity*, so they cannot take more **bikes** that they can hold.

In discussing the domain model amoungst our group, we ended up with 6 classes. 

> * [x] = Implemented

* [x] Bike
* [x] Person
* [x] Van
* [x] Garage
* [x] Docking Station
* [ ] Rental

Rental was not completed after a presentation to the group, it appeared above the scope of the project, and although made sense in comparison to the actual Boris Bikes system, it was marked as item for future development.

CRC Card Examples from our Group.

| Class         | Bike                     |
|:------------- | :------------------------|
|**Responsibilities** | **Collaborators**  | 
| Can be broken | Docking station          |
| Can be fixed  | Van                      |
| Can be used   | Garage                   |
|               | User                     |


| Class         | User                     |
|:------------- | :------------------------|
|**Responsibilities** | **Collaborators**  | 
| Rent                | Bike               |
| Remove              | Docking Station    |
| Ride                |                    |
| Return              |                    |
| Break               |


