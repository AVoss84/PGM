%ComputeMarginal Computes the marginal over a set of given variables
%   M = ComputeMarginal(V, F, E) computes the marginal over variables V
%   in the distribution induced by the set of factors F, given evidence E
%
%   M is a factor containing the marginal over variables V
%   V is a vector containing the variables in the marginal e.g. [1 2 3] for
%     X_1, X_2 and X_3.
%   F is a vector of factors (struct array) containing the factors 
%     defining the distribution
%   E is an N-by-2 matrix, each row being a variable/value pair. 
%     Variables are in the first column and values are in the second column.
%     If there is no evidence, pass in the empty matrix [] for E.


function M = ComputeMarginal(V, F, E)

% Check for empty factor list
if (numel(F) == 0)
      warning('Warning: empty factor list');
      M = struct('var', [], 'card', [], 'val', []);      
      return;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
% M should be a factor
% Remember to renormalize the entries of M!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#M = struct('var', [], 'card', [], 'val', []); % Returns empty factor. Change this.
FACTORS.JOINT = ComputeJointDistribution(F);
marg_distr = FactorMarginalization(FACTORS.JOINT, V);

if (length(E) == 0)
    fprintf('\n%s\n', 'No evidence assigned!');
    [cond_var] = setdiff (FACTORS.JOINT.var, V);
    marg_f = FactorMarginalization(FACTORS.JOINT, V = cond_var) ;
    M = marg_f; 
else
    evid = ObserveEvidence(FACTORS.JOINT, E);
    numer = evid.val(find(evid.val != 0));
    marg_const = GetValueOfAssignment(marg_distr, E(:,2));
    M = numer ./ marg_const;
endif       
return;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
