% Author: Samin Rajabi
% provides an insight of how currency risk affects the optimal portfolio allocation
% Portfolio manangers should therefore take into account the correlation
% between currencies and their portfolio of assets
% We look at 3 cases to determine how currency risk can affect the portfolio
%allocation
%Case 1 - we do not take into account exchange rates & all assets are
%denominated in USD.
%Case 2 - Asset prices are now converted from USD to CAD and we look at how the
%optimal portfolio allocation changes
%Case 3 - Asset prices are converted from USD to AUD - we look at how the
%optimal portfolio allocation changes
 
%%Case 1- we do not take into account exchange rates & all assets are
%denominated in USD.
 
ret1 = [0.0754 0.0846];
vcv1 = [0.0376 0.0082; 0.0082 0.0109];
p1 = Portfolio('AssetMean',ret1,'AssetCovar',vcv1,'Budget',1,'LowerBound',0);
[p1risk p1ret] = p1.plotFrontier(10);
[pwgt1] = p1.estimateFrontier(10)
p1var = p1risk.*p1risk
for A = [1 3 6]
    u = p1ret - 0.5*A*p1var
    max(u)
end
 
%%Case 2- Asset prices are now converted from USD to CAD and we look at how the
%optimal portfolio allocation changes for the Canadian investor
 
ret2 = [0.019 0.0165];
vcv2 = [0.0579 0.028; 0.028 0.0254];
p2 = Portfolio('AssetMean',ret2,'AssetCovar',vcv2,'Budget',1,'LowerBound',0);
[p2risk p2ret] = p2.plotFrontier(10)
[pwgt2] = p2.estimateFrontier(10)
p2var = p2risk.*p2risk
for A = [1 3 6]
    u = p2ret - 0.5*A*p2var
    max(u)
end
 
%Case 3 - Asset prices are converted from USD to AUD - we look at how the
%optimal portfolio allocation changes for the Aussie investor
ret3 = [0.0077 0.0368];
vcv3 = [0.0022 0.0002; 0.0002 0.0284];
p3 = Portfolio('AssetMean',ret3,'AssetCovar',vcv3,'Budget',1,'LowerBound',0)
[p3risk p3ret] = p3.plotFrontier(10)
[pwgt3] = p3.estimateFrontier(10)
p3var = p3risk.*p3risk
for A = [1 3 6]
    u = p3ret - 0.5*A*p3var
    max(u)
end