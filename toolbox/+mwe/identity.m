function y = identity(x)
%IDENTITY does nothing
%    Y = IDENTITY(X) returns the input untouched.

    arguments
        x (1, 1) {mustBeNumeric}
    end

    y = x;
end
