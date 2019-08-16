% FACTORS.INPUT(1) contains P(X_1)
FACTORS.INPUT(1) = struct('var', [1], 'card', [2], 'val', [0.11, 0.89]);

% FACTORS.INPUT(2) contains P(X_2 | X_1)
FACTORS.INPUT(2) = struct('var', [2, 1], 'card', [2, 2], 'val', [0.59, 0.41, 0.22, 0.78]);

% FACTORS.INPUT(3) contains P(X_3 | X_2)
FACTORS.INPUT(3) = struct('var', [3, 2], 'card', [2, 2], 'val', [0.39, 0.61, 0.06, 0.94]);

A = FACTORS.INPUT(1)

B = FACTORS.INPUT(2)

C = FactorProduct(A, B)

% Check for empty factors
if (isempty(A.var)), C = B; return; end;
if (isempty(B.var)), C = A; return; end;

% Check that variables in both A and B have the same cardinality
[dummy iA iB] = intersect(A.var, B.var);
if ~isempty(dummy)
	% A and B have at least 1 variable in common
	assert(all(A.card(iA) == B.card(iB)), 'Dimensionality mismatch in factors');
end

% Set the variables of C
C.var = union(A.var, B.var);

% Construct the mapping between variables in A and B and variables in C.
% In the code below, we have that
%
%   mapA(i) = j, if and only if, A.var(i) == C.var(j)
% 
% and similarly 
%
%   mapB(i) = j, if and only if, B.var(i) == C.var(j)
%
% For example, if A.var = [3 1 4], B.var = [4 5], and C.var = [1 3 4 5],
% then, mapA = [2 1 3] and mapB = [3 4]; mapA(1) = 2 because A.var(1) = 3
% and C.var(2) = 3, so A.var(1) == C.var(2).

[dummy, mapA] = ismember(A.var, C.var);   % returns index sets of dim A and C respect.
[dummy, mapB] = ismember(B.var, C.var);

% Set the cardinality of variables in C
C.card = zeros(1, length(C.var));
C.card(mapA) = A.card;
C.card(mapB) = B.card;

% Initialize the factor values of C:
%   prod(C.card) is the number of entries in C
C.val = zeros(1, prod(C.card));

% Compute some helper indices
% These will be very useful for calculating C.val
% so make sure you understand what these lines are doing.
assignments = IndexToAssignment(1:prod(C.card), C.card);
assignments

indxA = AssignmentToIndex(assignments(:, mapA), A.card);
indxA

indxB = AssignmentToIndex(assignments(:, mapB), B.card);
indxB

#GetValueOfAssignment(phi, [1 2 1])

GetValueOfAssignment(A, indxA)
GetValueOfAssignment(B, assignments)
#C = SetValueOfAssignment(C, [assignments2 2 1], 6)

A.val(indxA)
B.val(indxB)

#FactorProduct(FACTORS.INPUT(1), FACTORS.INPUT(2))

#ComputeJointDistribution(FACTORS)

IndexToAssignment(1:length(A.val), A.card)

assignments(:, mapB)

B = FactorMarginalization(A = FACTORS.INPUT(2), V = [2])

#FACTORS.INPUT(2)

#FactorProduct(FACTORS.INPUT(2), FACTORS.INPUT(1))

#      sprintf('Error: variable values/value ', names{i}))

#assignments = IndexToAssignment(1:length(FACTORS.JOINT.val), FACTORS.JOINT.card)

#AssignmentToIndex(assignments(:, mapB), B.card)

A = FACTORS.JOINT
V = [2]
#B = FactorMarginalization(A = FACTORS.JOINT, V = [2])

[B.var, mapB] = setdiff(A.var, V)     # difference here between 2|1 and 1

% Initialize B.card and B.val
B.card = A.card(mapB)
B.val = zeros(1, prod(B.card))

assignments = IndexToAssignment(1:length(A.val), A.card)    # 4x2 matrix with realizations; here 1 or 2
indxB = AssignmentToIndex(assignments(:, mapB), B.card)

phi = FACTORS.JOINT

GetValueOfAssignment(phi, [1 2 1]) 

phi = SetValueOfAssignment(phi, [2 2 1], 6)

#-------------------

FACTORS.INPUT(1)
FACTORS.INPUT(2)
FACTORS.INPUT(3)

E = [2 1; 3 2]

#ObserveEvidence(FACTORS.INPUT, [2 1; 3 2])

#ObserveEvidence(FACTORS.JOINT, [2 1; 3 2])

#F = FACTORS.JOINT
F = FACTORS.INPUT
#length(F)
length(F)


#SetValueOfAssignment(F, [1 2 1], 0)
#GetValueOfAssignment(F, [1 2 1])

i = 2
E = [2 1; 3 2]
v = E(i, 1) % variable
x = E(i, 2) % value

j = 3
F(j)
indx = find(F(j).var == v)

ass = IndexToAssignment(1:length(F(j).val), F(j).card)

find(ass(:,indx) != x)

F(j).val(find(ass(:,indx) != x))

ass(find(ass(:,indx) != x),:)

SetValueOfAssignment(F(j), ass(find(ass(:,indx) != x),:), 0, F(j).var)

FACTORS.EVIDENCE = ObserveEvidence(FACTORS.INPUT, [2 1; 3 2])



F = FACTORS
#length(F)
length(F)

FactorProduct(F.INPUT(1), F.INPUT(2))

#Joint = FactorProduct(FactorProduct(F.INPUT(1), F.INPUT(2)),F.INPUT(3))

FACTORS.JOINT = ComputeJointDistribution(FACTORS.INPUT)



