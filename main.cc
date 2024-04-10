#include <assert.h>
#include <node_api.h>

static napi_value Init(napi_env env, napi_value /* exports */) {
  napi_status status;
  napi_value result;

  status = napi_create_double(env, 200000, &result);
  assert(status == napi_ok);

  return result;
}

NAPI_MODULE(test, Init)
