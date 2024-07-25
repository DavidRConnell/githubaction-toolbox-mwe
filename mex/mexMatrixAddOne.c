#include <mex.h>

void mexFunction(int nlhs, mxArray* plhs[], int nrhs, const mxArray* prhs[])
{
  /* Note function is called by a MATLAB function that should ensure valid
     inputs and outputs. If this mex function receives the wrong values, it's
     an internal error not a user error. */
  if (nlhs != 1) {
    mexErrMsgIdAndTxt("mwe:internal:nlhs", "Too many output arguments.");
  }

  if (nrhs != 1) {
    mexErrMsgIdAndTxt("mwe:internal:nrhs",
                      "Invalid argument list. Function requires exactly 1 input.");
  }

  if (!mxIsDouble(prhs[0])) {
    mexErrMsgIdAndTxt("mwe:internal:mustBeNumeric",
                      "First argument must be numeric.");

  }

  mwSize m = mxGetM(prhs[0]);
  mwSize n = mxGetN(prhs[0]);
  double* vals = mxGetDoubles(prhs[0]);

  plhs[0] = mxCreateDoubleMatrix(m, n, mxREAL);
  double* ret = mxGetDoubles(plhs[0]);

  for (mwSize i = 0; i < m; i++) {
    for (mwSize j = 0; j < n; j++) {
      ret[i + (j* m)] = vals[i + (j* m)] + 1;
    }
  }
}
