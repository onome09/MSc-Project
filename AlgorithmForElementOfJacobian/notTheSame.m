function bool = notTheSame(starting_vertex, new_points_connected)
    bool = 1;
    n = size(new_points_connected,1);
    for i =1:n
       asum = sum(abs(starting_vertex' - new_points_connected(i,:)' ) );
       if asum < 0.001
           bool = 0;
          break
          
       end
          
    end
    