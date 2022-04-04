#pragma once
#define BIT(x) (1 << x)
#ifdef SE_PLATFORM_WINDOWS
#ifdef SE_BUILD_DLL
#define SE_API __declspec(dllexport)
#else
#define SE_API __declspec(dllimport)
#endif // HZ_BUILD_DLL
#else
#error SunEngine only support Windows!
#endif // !HZ_PLATFORM_WINDOWS

#ifdef SE_ENABLE_ASSERTS
#define SE_ASSERT(x, ...) { if(!(x)) { SE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#define SE_CORE_ASSERT(x, ...) { if(!(x)) { SE_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else

#define SE_ASSERT(x, ...)
#define SE_CORE_ASSERT(x, ...)
#endif

#define BIND_EVENT_FN(fn) [this](auto&&... args) -> decltype(auto) { return this->fn(std::forward<decltype(args)>(args)...); }
