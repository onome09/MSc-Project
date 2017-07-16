function bool = componentsOfStructAreReal(object)
bool = 1;

fields = fieldnames(object);
for i = 1:numel(fields)
    object.(fields{i});
  if((size(object.(fields{i}),1) * size(object.(fields{i}),1) == 0) || ~isreal(object.(fields{i})))
      bool = 0;
  end
end

