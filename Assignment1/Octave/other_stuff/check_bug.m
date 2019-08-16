
V = [2]    # marg. distr. of variables V 
F = FACTORS.INPUT
E = [1,1]

FACTORS.JOINT = ComputeJointDistribution(F);
marg_distr = FactorMarginalization(FACTORS.JOINT, V);

if (length(E) == 0)
    fprintf('\n%s\n', 'No evidence assigned!');
    [cond_var] = setdiff (FACTORS.JOINT.var, V);
    marg_f = FactorMarginalization(FACTORS.JOINT, V = cond_var) ;
    M = marg_f
else
    evid = ObserveEvidence(F=FACTORS.JOINT, E=E);
    numer = evid.val(find(evid.val != 0));
    marg_const = GetValueOfAssignment(marg_distr, E(:,2));
    M = numer ./ marg_const
endif

# sprintf('%d\n', numel(F))

#fprintf('\n%s\n', 'No evidence assigned!');
#[cond_var] = setdiff (FACTORS.JOINT.var, V);
#marg_f = FactorMarginalization(FACTORS.JOINT, V = cond_var) ;
#M = marg_f

#evid = ObserveEvidence(F=FACTORS.JOINT, E=E)
#numer = evid.val(find(evid.val != 0))
#marg_const = GetValueOfAssignment(marg_distr, E(:,2))
#M = numer ./ marg_const