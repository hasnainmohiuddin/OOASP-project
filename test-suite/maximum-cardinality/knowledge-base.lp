ooasp_class("m1", "Frame").
ooasp_class("m1", "ModuleA").
ooasp_class("m1", "ModuleB").

ooasp_assoc("m1", "frame_module", "Frame", 1, 1, "ModuleA", 1, 1).
ooasp_assoc("m1", "frame_module", "Frame", 1, 1, "ModuleB", 1, 1).
