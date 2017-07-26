function hyperplane_list_cell_array = showHyperPlanesOfRegion(cell_of_region_info, cell_of_hyperplanes,index)
          hyperplane_info = cell_of_region_info{1,index};
          r = find(hyperplane_info(:,1)==1);
          hyperplane_list_cell_array = cell(sum(hyperplane_info(:,1)),2);
          for i = 1:sum(hyperplane_info(:,1))
                hyperplane_list_cell_array{i,1} = cell_of_hyperplanes{1,r(i,1)};
                if (hyperplane_info(r(i,1),2) >0)
                    hyperplane_list_cell_array{i,2} = 'greater than';
                else
                    hyperplane_list_cell_array{i,2} = 'less than';
                end        
          end
          displayCellArray(hyperplane_list_cell_array)
      end