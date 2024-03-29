workspace "Ember"
    architecture "x64"
    startproject "Sandbox"

    configurations 
    { 
        "Debug", 
        "Release", 
        "Dist" 
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to solution directory
IncludeDir = {}
IncludeDir["GLFW"] = "Ember/vendor/GLFW/include"

include "Ember/vendor/GLFW"

project "Ember"
    location "Ember"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "ebpch.h"
    pchsource "Ember/src/ebpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
    }

    includedirs
	{
        "%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
	}

    links
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
		staticruntime "On"
        systemversion "latest"

        defines
        {
            "EB_PLATFORM_WINDOWS",
            "EB_BUILD_DLL"
        }

        postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox/")
		}

    filter "configurations:Debug"
		defines "EB_DEBUG"
		symbols "On"

    filter "configurations:Release"
		defines "EB_RELEASE"
		optimize "On"

    filter "configurations:Dist"
		defines "EB_DIST"
		optimize "On"


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
	language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
    }

    includedirs
	{
		"Ember/vendor/spdlog/include",
        "Ember/src"
	}

    links
    {
        "Ember"
    }

    filter "system:windows"
        cppdialect "C++17"
		staticruntime "On"
        systemversion "latest"

        defines
        {
            "EB_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
		defines "EB_DEBUG"
		symbols "On"

    filter "configurations:Release"
		defines "EB_RELEASE"
		optimize "On"

    filter "configurations:Dist"
		defines "EB_DIST"
		optimize "On"