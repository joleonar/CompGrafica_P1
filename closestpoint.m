function [junk,xselect,yselect] = closestpoint(xy,xdata,ydata,dx,dy)
% find the single closest point to xy, in scaled units
if ~iscell(xdata)
  % just one set of points to consider
  D = sqrt(((xdata - xy(1))/dx).^2 + ((ydata - xy(2))/dy).^2);
  [junk,pointslist] = min(D(:)); %#ok
  xselect = xdata(pointslist);
  yselect = ydata(pointslist);
else
  % there is more than one set of points
   Dmin = inf;
  pointslist = cell(size(xdata));
  for i = 1:numel(xdata);
    D = sqrt(((xdata{i} - xy(1))/dx).^2 + ((ydata{i} - xy(2))/dy).^2);
    [mind,ind] = min(D(:)); %#ok
    
    if mind < Dmin
      % searching for the closest point
      Dmin = mind;
      
      pointslist = cell(size(xdata));
      xselect = cell(size(xdata));
      yselect = cell(size(xdata));
      
      pointslist{i} = ind;
      xselect{i} = xdata{i}(ind);
      yselect{i} = ydata{i}(ind);
    end
  end
end

end % subfunction end