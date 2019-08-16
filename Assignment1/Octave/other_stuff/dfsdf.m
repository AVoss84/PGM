
V = [2]     # marg. distr. of variables V 

#F = FACTORS.JOINT
F = FACTORS.INPUT

length(F)

E = [1, 1; 3 , 1]


#FACTORS.EVIDENCE = ObserveEvidence(F, E)

#FACTORS.MARGINALIZATION = FactorMarginalization(FACTORS.EVIDENCE, V)

FACTORS.JOINT = ComputeJointDistribution(F);

num = ObserveEvidence(FACTORS.JOINT, E)

ass = IndexToAssignment(1:length(num.val), num.card)

[cond_var] = setdiff (FACTORS.JOINT.var, V)

#indx = find(ass(cond_ar) == c)

#ass(:,cond_var)

#for j=1:num.card(cond_var),
#     j
#     #indx = find(F(j).var == ass(:,cond_var));
#end

marg_distr = FactorMarginalization(FACTORS.JOINT, V)

denom = marg_distr.val

num.val

numer = num.val(find(num.val != 0))
#evid.val ./ denom(E(1,2))
b = ass(:,E(:,1))

marg_const = GetValueOfAssignment(marg_distr, E(:,2))

numer ./ marg_const

#FACTORS.MARGINAL = ComputeMarginal(V = [2, 3], F = FACTORS.INPUT, E = [1, 2])
FACTORS.MARGINAL = ComputeMarginal(V = [1], F = FACTORS.INPUT, E = [2,1;3,2])

%{
i = 0;
do
  i++;
until find(b(i) != E(:,1))   

numer ./ denom(i)

#while find(b(i) != E(:,1))
#  i++;
#endwhile

E = []
if (length(E) == 0)
    marg_f = FactorMarginalization(FACTORS.JOINT, V = cond_var) ; 
else    
    #marg_f = FactorMarginalization(FACTORS.JOINT, V = cond_var) ;
endif  

%}

cd 'C:\Users\Alexander\Documents\Arbeit\Allianz\Coursera\prob_graphical_models\Course1\Programming assignments\Assignment1\Octave'



