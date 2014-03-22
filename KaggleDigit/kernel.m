%%performs a gaussian kernel on x and y with support: sigma
function[returned] = kernel(x,y, sigma)

returned = exp(-norm(x-y)^2/(2*sigma^2));

end