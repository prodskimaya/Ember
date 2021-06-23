#pragma once

#ifdef EB_PLATFORM_WINDOWS
	#ifdef EB_BUILD_DLL
		#define EMBER_API __declspec(dllexport)
	#else
		#define EMBER_API __declspec(dllimport)
	#endif
#else
	#error Ember currently only supports Windows!
#endif
