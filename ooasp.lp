% Encoding for instantiation and integrity constraints
ooasp_subclass(Instance_Id, Class_Id, SuperClass_Id) :- ooasp_class(Instance_Id, Class_Id), ooasp_class(Instance_Id, SuperClass_Id).

ooasp_assoc(Model_Id, Assoc_Id, Class1_Id, MinC1, MaxC1, Class2_Id, MinC2, MaxC2) :-
    ooasp_assoc(Model_Id, Assoc_Id, Class1_Id, MinC1, MaxC1, Class2_Id, MinC2, MaxC2).

ooasp_attribute(Model_Id, Class_Id, Attribute_Id, Type) :-
    ooasp_attribute(Model_Id, Class_Id, Attribute_Id, Type).

ooasp_attribute_minInclusive(Model_Id, Class_Id, Attribute_Id, MinValue) :-
    ooasp_attribute_minInclusive(Model_Id, Class_Id, Attribute_Id, MinValue).

ooasp_attribute_maxInclusive(Model_Id, Class_Id, Attribute_Id, MaxValue) :-
    ooasp_attribute_maxInclusive(Model_Id, Class_Id, Attribute_Id, MaxValue).

ooasp_attribute_enum(Model_Id, Class_Id, Attribute_Id, Val) :-
    ooasp_attribute_enum(Model_Id, Class_Id, Attribute_Id, Val).

% CONSTRAINTS

% Minimum Cardinality Constraint
:- { ooasp_associated(Instance_Id, Assoc_Id, Object_1, Object_2) : ooasp_isa(Instance_Id, C2, Object_2) } C2MIN - 1, 
    C2MIN > 0,
    ooasp_assoc(Model_Id, Assoc_Id, C1, C1MIN, C1MAX, C2, C2MIN, C2MAX),
    ooasp_instantiation(Model_Id, Instance_Id),
    ooasp_isa(Instance_Id, C1, Object_1).

% Maximum Cardinality Constraint
:- { ooasp_associated(Instance_Id, Assoc_Id, Object_1, Object_2) : ooasp_isa(Instance_Id, C2, Object_2) } > C2MAX, 
    ooasp_assoc(Model_Id, Assoc_Id, C1, C1MIN, C1MAX, C2, C2MIN, C2MAX),
    ooasp_instantiation(Model_Id, Instance_Id),
    ooasp_isa(Instance_Id, C1, Object_1).

% Attribute Values should not be less than minimum inclusive value
:- Val < Min,
    ooasp_attribute_value(Instance_Id, Attribute_Id, ID, Val),
    ooasp_attribute(Model_Id, Class_Id, Attribute_Id, Type),
    ooasp_isa(Instance_Id, Class_Id, Object_Id),
    ooasp_attribute_minInclusive(Model_Id, Class_Id, Attribute_Id, Min),
    ooasp_instantiation(Model_Id, Instance_Id).

% Attribute value should not be more than the maximum inclusive value
:- Val > Max,
    ooasp_attribute_value(Instance_Id, Attribute_Id, ID, Val),
    ooasp_attribute(Model_Id, Class_Id, Attribute_Id, Type),
    ooasp_isa(Instance_Id, Class_Id, Object_Id),
    ooasp_attribute_maxInclusive(Model_Id, Class_Id, Attribute_Id, Max),
    ooasp_instantiation(Model_Id, Instance_Id).

% Constraint checks if there's an attribute value associated with an object, and if that object is not instantiated
:- ooasp_attribute_value(Instance_Id, Attribute_Id, Object_Id, Val),
    not ooasp_isa(Instance_Id, _, Object_Id).

% Empty Instantiation
:- not ooasp_instantiation(_, _).

#show ooasp_isa/3.
#show ooasp_associated/4.
#show ooasp_attribute_value/4.

% Associations

% Define the maximum identifier
max_id(8).

1 { ooasp_isa(Config, Class, ID) : ooasp_class(Config, Class), ID = 1..MaxID } 1 :-
    max_id(MaxID).