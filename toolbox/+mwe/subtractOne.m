function y = subtractOne(x)
%SUBTRACTONE remove one from a value
%   Y = SUBTRACTONE(X) subtracts one from the value X.
%
%   See also MWE.ADDONE.

    arguments
        x (:, :) {mustBeNumeric}
    end

    if max(size(x)) > 1
        % Use the efficient mex version when handling matrices (not really
        % faster than MATLAB's builtin).
        y = mexMatrixSubtractOne(x);
    else
        y = x - 1;
    end
end
