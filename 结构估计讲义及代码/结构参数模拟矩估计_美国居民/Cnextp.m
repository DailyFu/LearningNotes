% Modified by Michael Reiter, 22.7.05
function c=Cnextp(m,mtp1,ctp1)

% Cnextp is constructed by interpolation to be the next-period consumption function Ct+1()

c = zeros(size(m));

% extrapolate above maximal m:
iAbove = m>=mtp1(end);
slopeAbove = (ctp1(end)-ctp1(end-1))/(mtp1(end)-mtp1(end-1));
c(iAbove) = ctp1(end) + (m(iAbove)-mtp1(end))*slopeAbove;

% extrapolate below minimal m:
iBelow = m<=mtp1(1);
slopeBelow = 1;
c(iBelow) = ctp1(1) + (m(iBelow)-mtp1(1))*slopeBelow;

% interpolate:
iInterp = ~(iAbove | iBelow);
c(iInterp) = interp1(mtp1,ctp1,m(iInterp));


