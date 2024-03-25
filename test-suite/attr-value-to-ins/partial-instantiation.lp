% Instances
ooasp_instantiation("v1", "c1").
ooasp_isa("c1", "Class1", "object1").
ooasp_isa("c1", "Class2", "object2").

% Attribute Values - Correctly linked to instances
ooasp_attribute_value("c1", "class1", "object1", 2).
ooasp_attribute_value("c1", "class2", "object2", 2).

% This one violates the test case, as it's not instantiated
ooasp_attribute_value("c1", "class3", "object3", 2).
