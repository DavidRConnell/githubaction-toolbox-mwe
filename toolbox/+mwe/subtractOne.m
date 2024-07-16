function y = subtractOne(x)
%SUBTRACTONE remove one from a value
%   Y = SUBTRACTONE(X) subtracts one from the value X.
%
%   See also MWE.ADDONE.

    arguments
        x (1, 1) {mustBeNumeric}
    end

    y = x - 1;
end
