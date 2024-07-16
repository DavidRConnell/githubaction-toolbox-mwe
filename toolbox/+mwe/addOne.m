function y = addOne(x)
%ADDONE add one to a value
%   Y = ADDONE(X) adds one to the value X.
%
%   See also MWE.SUBTRACTONE.

    arguments
        x (1, 1) {mustBeNumeric}
    end

    y = x + 1;
end
