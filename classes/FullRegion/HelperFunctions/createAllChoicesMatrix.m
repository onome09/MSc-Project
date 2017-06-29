function C = createAllChoicesMatrix( amount_chosen, amount_to_choose_from)
    v = 1:1:amount_to_choose_from;
    C = nchoosek(v,amount_chosen);