ooasp_instantiation("m1", "i1").
ooasp_isa("i1", "Frame", "frame").
ooasp_isa("i1", "ModuleA", "moduleA1").
ooasp_isa("i1", "ModuleB", "moduleB").

ooasp_associated("i1", "frame_module", "frame", "moduleA1").
% ooasp_associated("i1", "frame_module", "frame", "moduleB").
