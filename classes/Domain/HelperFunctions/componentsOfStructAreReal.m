function bool = componentsOfStructAreReal(object)
bool = 1;
fields = fieldnames(object);
for i = 1:numel(fields)
    object.(fields{i});
  if(~isreal(object.(fields{i})))
      bool = 0;
  end
end
