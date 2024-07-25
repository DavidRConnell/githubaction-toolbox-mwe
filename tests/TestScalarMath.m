classdef TestScalarMath < matlab.unittest.TestCase
    properties
        xInt = 2;
        xDouble = 2.0;
        xChar = 'a';
        xMatrix = [1 2 3; 4 5 6; 7 8 9];
    end

    methods (Test)
        function testCanAddToInteger(testCase)
            expected = testCase.xInt + 1;
            actual = mwe.addOne(testCase.xInt);
            testCase.verifyEqual(actual, expected);
        end

        function testCanAddToDouble(testCase)
            expected = testCase.xDouble + 1;
            actual = mwe.addOne(testCase.xDouble);
            testCase.verifyEqual(actual, expected);
        end

        function testCanSubtractFromInteger(testCase)
            expected = testCase.xInt - 1;
            actual = mwe.subtractOne(testCase.xInt);
            testCase.verifyEqual(actual, expected);
        end

        function testCanSubtractFromDouble(testCase)
            expected = testCase.xDouble - 1;
            actual = mwe.subtractOne(testCase.xDouble);
            testCase.verifyEqual(actual, expected);
        end

        function testCanAddToMatrix(testCase)
            expected = testCase.xMatrix + 1;
            actual = mwe.addOne(testCase.xMatrix);
            testCase.verifyEqual(actual, expected);
        end

        function testCanSubtractFromMatrix(testCase)
            expected = testCase.xMatrix - 1;
            actual = mwe.subtractOne(testCase.xMatrix);
            testCase.verifyEqual(actual, expected);
        end

        function testFailsForNonNumeric(testCase)
            actual = @() mwe.addOne(testCase.xChar);
            testCase.verifyError(actual, 'MATLAB:validators:mustBeNumeric');
        end

        function testIdentity(testCase)
            expected = mwe.subtractOne(mwe.addOne(testCase.xInt));
            actual = mwe.identity(testCase.xInt);
            testCase.verifyEqual(actual, expected);
        end
    end
end
