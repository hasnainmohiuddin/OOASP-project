## Description

Given is an encoding which, given a description of an OOASP configuration model and a partial instantiation generates a complete instantiation of the model.

## Frame/Modules/Elements example

This test case is taken from the paper "OOASP: Connecting Object-Oriented and Logic Programming".

To run this example:
```
clingo ooasp.lp config-model.lp partial-instantiation.lp
```

## Constraints

### 1. Minimum Cardinality Constraint

This constraint makes sure that the minimum number of associations between instantiated objects is as defined by the association.

Command:
```
clingo ooasp.lp test-suite/minimum-cardinality/knowledge-base.lp test-suite/minimum-cardinality/partial-instantiation.lp
```

### 2. Maximum Cardinality Constraint

This constraint makes sure that the minimum number of associations between instantiated objects is as defined by the association.

Command:
```
clingo ooasp.lp test-suite/maximum-cardinality/knowledge-base.lp test-suite/maximum-cardinality/partial-instantiation.lp
```

### 3. Every Attribute Value must belong to an instance

This constraint ensures that the attribute values are associated with the instantiated objects.

Command:
```
clingo ooasp.lp test-suite/attr-value-to-ins/knowledge-base.lp test-suite/attr-value-to-ins/partial-instantiation.lp
```

### 4. Integer Value lower Bound

This constraint makes sure that the lower bound of the integer value limit is not violated.

Command:
```
clingo ooasp.lp test-suite/value-out-of-range/lower-bound-constraint/knowledge-base.lp test-suite/value-out-of-range/lower-bound-constraint/partial-instantiation.lp
```

### 5. Integer Value upper Bound

This constraint makes sure that the upper bound of the integer value limit is not violated.

The Command to run the test case for this constraint is:
```
clingo ooasp.lp test-suite/value-out-of-range/upper-bound-constraint/knowledge-base.lp test-suite/value-out-of-range/upper-bound-constraint/partial-instantiation.lp
```

### 6. Empty Instantiation

Ensures that there should be an instantiation in the configuration

The Command to run the test case for this constraint is:
```
clingo ooasp.lp test-suite/empty-instantiation/knowledge-base.lp test-suite/empty-instantiation/partial-instantiation.lp
```

## References

### Research Papers on OOASP

OOASP: Connecting Object-Oriented and Logic Programming (2015)

### OOASP

This GitHub repository is used as a reference for finding constraints and clarifications. (https://github.com/siemens/OOASP)
