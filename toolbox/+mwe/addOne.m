function y = addOne(x)
%ADDONE add one to a value
%   Y = ADDONE(X) adds one to the value X.
%
%   See also MWE.SUBTRACTONE.

    arguments
        x (:, :) {mustBeNumeric}
    end

    if max(size(x)) > 1
        % Use the efficient mex version when handling matrices (not really
        % faster than MATLAB's builtin).
        y = mexMatrixAddOne(x);
    else
        y = x + 1;
    end
end
