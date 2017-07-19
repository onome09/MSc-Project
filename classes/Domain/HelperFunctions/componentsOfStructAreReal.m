function bool = componentsOfStructAreReal(object)
bool = 1;


fields = fieldnames(object);
for i = 1:numel(fields)
    object.(fields{i});
  if((size(object.(fields{i}),1) * size(object.(fields{i}),1) == 0) || ~isempty(find(char(object.(fields{i}))=='i',1)))
      bool = 0;
  end
end

